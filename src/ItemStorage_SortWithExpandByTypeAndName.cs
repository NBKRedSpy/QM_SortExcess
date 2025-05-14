using HarmonyLib;
using MGSC;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using static HarmonyLib.Code;

namespace SortExcess
{
    [HarmonyPatch(typeof(ItemStorage), nameof(ItemStorage.SortWithExpandByTypeAndName))]
    public static class ItemStorage_SortWithExpandByTypeAndName_Patch
    {
        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {

            //Goal - call the MoveExcess function after the sort, and before the inventory is updated in the grid.
            //  Need to reorder the items before the code loops though the items and updates the ItemStorage.
            //Targets:
            ///// Items.Clear();
            //  IL_01bb: ldarg.0
            //  IL_01bc: call instance class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem> MGSC.ItemStorage::get_Items()
            //  IL_01c1: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::Clear()
            //....
            //	IL_01cb: newobj instance void class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::.ctor()
            //  IL_01d0: stloc.s 5

            //Local 1 is the dictionary:
            //[1] class [mscorlib] System.Collections.Generic.Dictionary`2<class [mscorlib] System.Type, class [mscorlib] System.Collections.Generic.List`1<class MGSC.BasePickupItem>>,
            //
            //Local 2 is the list of types which is used like a grouping.  Ex:  WeaponRecord
            //[2] class [mscorlib] System.Collections.Generic.List`1<class [mscorlib] System.Type>,

            IEnumerable<CodeInstruction> original = instructions.ToList();
            List<CodeInstruction> output;

            //Utils.LogIL(original, @"C:\work\out.il");

            output = new CodeMatcher(original)
                .MatchEndForward(
                    new CodeMatch(OpCodes.Callvirt, AccessTools.PropertyGetter(typeof(List<BasePickupItem>), nameof(List<BasePickupItem>.Clear))
                ))
                .ThrowIfNotMatch("Did not find the list of items.")
                .MatchEndForward(
                    new CodeMatch(OpCodes.Newobj, AccessTools.Constructor(typeof(List<BasePickupItem>))),
                    new CodeMatch(OpCodes.Stloc_S)
                )
                .ThrowIfNotMatch("Did not find the item list creation.")
                .Advance(1)
                .InsertAndAdvance(
                    new CodeInstruction(OpCodes.Ldloc_S, 1), //Load the dictionary
                    new CodeInstruction(OpCodes.Ldloc_S, 2), //Load the type list (effectively a grouping)
                    CodeInstruction.Call(() => MoveExcessCall(null, null))
                )

                .InstructionEnumeration()
                .ToList();

            return output;

        }

        private static void MoveExcessCall(Dictionary<Type, List<BasePickupItem>> dictionary, List<Type> list)
        {
            MoveExcess(Plugin.Config.MaxItems, dictionary, list);
        }

        private static void MoveExcess(int maxItems, Dictionary<Type, List<BasePickupItem>> dictionary, List<Type> list)
        {

            List<BasePickupItem> excessItems = new List<BasePickupItem>();

            foreach (List<BasePickupItem> itemList in dictionary.Values)
            {
                foreach (IGrouping<string, BasePickupItem> itemGroup in itemList.GroupBy(x => x.Id))
                {
                    if (itemGroup.Count() > maxItems)
                    {
                        foreach (BasePickupItem item in itemGroup.Skip(maxItems))
                        {
                            excessItems.Add(item);
                            itemList.Remove(item);
                        }
                    }
                }
            }

            if (excessItems.Count == 0) return;

            //Make a fake type so the game's inventory placement will include those items.
            list.Add(typeof(int));
            dictionary.Add(typeof(int), excessItems);
        }

    }
}
