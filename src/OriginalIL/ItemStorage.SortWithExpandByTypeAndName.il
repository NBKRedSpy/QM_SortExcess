.method public hidebysig 
	instance void SortWithExpandByTypeAndName (
		class MGSC.SpaceTime spaceTime
	) cil managed 
{
	// Method begins at RVA 0x1b6e8
	// Header size: 12
	// Code size: 808 (0x328)
	.maxstack 5
	.locals init (
		[0] class MGSC.ItemStorage/'<>c__DisplayClass77_0',
		[1] class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>,
		[2] class [mscorlib]System.Collections.Generic.List`1<class [mscorlib]System.Type>,
		[3] int32,
		[4] int32,
		[5] class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>,
		[6] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>,
		[7] class MGSC.BasePickupItem,
		[8] class MGSC.BasePickupItemRecord,
		[9] class MGSC.CompositeItemRecord,
		[10] class [mscorlib]System.Type,
		[11] class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>,
		[12] bool,
		[13] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>,
		[14] class MGSC.BasePickupItem,
		[15] bool,
		[16] valuetype [mscorlib]System.Collections.Generic.Dictionary`2/Enumerator<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>,
		[17] valuetype [mscorlib]System.Collections.Generic.KeyValuePair`2<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>,
		[18] int32,
		[19] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class [mscorlib]System.Type>,
		[20] class [mscorlib]System.Type,
		[21] class MGSC.BasePickupItem,
		[22] class MGSC.BasePickupItem
	)

	// {
	IL_0000: newobj instance void MGSC.ItemStorage/'<>c__DisplayClass77_0'::.ctor()
	IL_0005: stloc.0
	// Dictionary<Type, List<BasePickupItem>> dictionary = new Dictionary<Type, List<BasePickupItem>>();
	IL_0006: newobj instance void class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>::.ctor()
	IL_000b: stloc.1
	// Dictionary<Type, int> typePriority = new Dictionary<Type, int>();
	IL_000c: ldloc.0
	IL_000d: newobj instance void class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, int32>::.ctor()
	IL_0012: stfld class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, int32> MGSC.ItemStorage/'<>c__DisplayClass77_0'::typePriority
	// List<Type> list = new List<Type>();
	IL_0017: newobj instance void class [mscorlib]System.Collections.Generic.List`1<class [mscorlib]System.Type>::.ctor()
	IL_001c: stloc.2
	// foreach (BasePickupItem item in Items)
	IL_001d: ldarg.0
	IL_001e: call instance class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem> MGSC.ItemStorage::get_Items()
	IL_0023: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::GetEnumerator()
	IL_0028: stloc.s 6
	.try
	{
		// foreach (BasePickupItem item in Items)
		IL_002a: br IL_0128
		// loop start (head: IL_0128)
			IL_002f: ldloca.s 6
			IL_0031: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>::get_Current()
			IL_0036: stloc.s 7
			// BasePickupItemRecord basePickupItemRecord = Data.Items.GetRecord(item.Id);
			IL_0038: call class MGSC.ItemsCollection MGSC.Data::get_Items()
			IL_003d: ldloc.s 7
			IL_003f: callvirt instance string MGSC.BasePickupItem::get_Id()
			IL_0044: ldc.i4.1
			IL_0045: callvirt instance !0 class MGSC.ConfigRecordCollection`1<class MGSC.BasePickupItemRecord>::GetRecord(string, bool)
			IL_004a: stloc.s 8
			// if (basePickupItemRecord is CompositeItemRecord compositeItemRecord)
			IL_004c: ldloc.s 8
			IL_004e: isinst MGSC.CompositeItemRecord
			IL_0053: stloc.s 9
			// basePickupItemRecord = compositeItemRecord.PrimaryRecord;
			IL_0055: ldloc.s 9
			IL_0057: brfalse.s IL_0062

			IL_0059: ldloc.s 9
			IL_005b: callvirt instance class MGSC.BasePickupItemRecord MGSC.CompositeItemRecord::get_PrimaryRecord()
			IL_0060: stloc.s 8

			// item.Storage = null;
			IL_0062: ldloc.s 7
			IL_0064: ldnull
			IL_0065: callvirt instance void MGSC.BasePickupItem::set_Storage(class MGSC.ItemStorage)
			// Type type = basePickupItemRecord.GetType();
			IL_006a: ldloc.s 8
			IL_006c: callvirt instance class [mscorlib]System.Type [mscorlib]System.Object::GetType()
			IL_0071: stloc.s 10
			// if (dictionary.TryGetValue(type, out var value))
			IL_0073: ldloc.1
			IL_0074: ldloc.s 10
			IL_0076: ldloca.s 11
			IL_0078: callvirt instance bool class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>::TryGetValue(!0, !1&)
			IL_007d: brfalse.s IL_00f7

			// bool flag = true;
			IL_007f: ldc.i4.1
			IL_0080: stloc.s 12
			// foreach (BasePickupItem item2 in value)
			IL_0082: ldloc.s 11
			IL_0084: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::GetEnumerator()
			IL_0089: stloc.s 13
			.try
			{
				// foreach (BasePickupItem item2 in value)
				IL_008b: br.s IL_00cf
				// loop start (head: IL_00cf)
					IL_008d: ldloca.s 13
					IL_008f: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>::get_Current()
					IL_0094: stloc.s 14
					// if (!item.IsStackable)
					IL_0096: ldloc.s 7
					IL_0098: callvirt instance bool MGSC.BasePickupItem::get_IsStackable()
					IL_009d: brtrue.s IL_00a1

					// break;
					IL_009f: leave.s IL_00e8

					// if (item2.Id == item.Id)
					IL_00a1: ldloc.s 14
					IL_00a3: callvirt instance string MGSC.BasePickupItem::get_Id()
					IL_00a8: ldloc.s 7
					IL_00aa: callvirt instance string MGSC.BasePickupItem::get_Id()
					IL_00af: call bool [mscorlib]System.String::op_Equality(string, string)
					IL_00b4: brfalse.s IL_00cf

					// bool emptyAfterMerge = false;
					IL_00b6: ldc.i4.0
					IL_00b7: stloc.s 15
					// if (ItemInteractionSystem.Merge(spaceTime, item, item2, ref emptyAfterMerge) && emptyAfterMerge)
					IL_00b9: ldarg.1
					IL_00ba: ldloc.s 7
					IL_00bc: ldloc.s 14
					IL_00be: ldloca.s 15
					IL_00c0: call bool MGSC.ItemInteractionSystem::Merge(class MGSC.SpaceTime, class MGSC.BasePickupItem, class MGSC.BasePickupItem, bool&)
					IL_00c5: ldloc.s 15
					IL_00c7: and
					IL_00c8: brfalse.s IL_00cf

					// flag = false;
					IL_00ca: ldc.i4.0
					IL_00cb: stloc.s 12
					// break;
					IL_00cd: leave.s IL_00e8

					// foreach (BasePickupItem item2 in value)
					IL_00cf: ldloca.s 13
					IL_00d1: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>::MoveNext()
					IL_00d6: brtrue.s IL_008d
				// end loop

				// (no C# code)
				IL_00d8: leave.s IL_00e8
			} // end .try
			finally
			{
				IL_00da: ldloca.s 13
				IL_00dc: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>
				IL_00e2: callvirt instance void [mscorlib]System.IDisposable::Dispose()
				// if (flag)
				IL_00e7: endfinally
			} // end handler

			IL_00e8: ldloc.s 12
			IL_00ea: brfalse.s IL_0128

			// value.Add(item);
			IL_00ec: ldloc.s 11
			IL_00ee: ldloc.s 7
			IL_00f0: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::Add(!0)
			// (no C# code)
			IL_00f5: br.s IL_0128

			// typePriority.Add(type, basePickupItemRecord.InventorySortOrder);
			IL_00f7: ldloc.0
			IL_00f8: ldfld class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, int32> MGSC.ItemStorage/'<>c__DisplayClass77_0'::typePriority
			IL_00fd: ldloc.s 10
			IL_00ff: ldloc.s 8
			IL_0101: callvirt instance int32 MGSC.BasePickupItemRecord::get_InventorySortOrder()
			IL_0106: callvirt instance void class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, int32>::Add(!0, !1)
			// list.Add(type);
			IL_010b: ldloc.2
			IL_010c: ldloc.s 10
			IL_010e: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class [mscorlib]System.Type>::Add(!0)
			// dictionary.Add(type, new List<BasePickupItem> { item });
			IL_0113: ldloc.1
			IL_0114: ldloc.s 10
			IL_0116: newobj instance void class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::.ctor()
			IL_011b: dup
			IL_011c: ldloc.s 7
			IL_011e: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::Add(!0)
			IL_0123: callvirt instance void class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>::Add(!0, !1)

			// foreach (BasePickupItem item in Items)
			IL_0128: ldloca.s 6
			IL_012a: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>::MoveNext()
			IL_012f: brtrue IL_002f
		// end loop

		// (no C# code)
		IL_0134: leave.s IL_0144
	} // end .try
	finally
	{
		IL_0136: ldloca.s 6
		IL_0138: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>
		IL_013e: callvirt instance void [mscorlib]System.IDisposable::Dispose()
		// list.Sort((Type x, Type y) => typePriority[x].CompareTo(typePriority[y]));
		IL_0143: endfinally
	} // end handler

	IL_0144: ldloc.2
	IL_0145: ldloc.0
	IL_0146: ldftn instance int32 MGSC.ItemStorage/'<>c__DisplayClass77_0'::'<SortWithExpandByTypeAndName>b__0'(class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_014c: newobj instance void class [mscorlib]System.Comparison`1<class [mscorlib]System.Type>::.ctor(object, native int)
	// foreach (KeyValuePair<Type, List<BasePickupItem>> item3 in dictionary)
	IL_0151: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class [mscorlib]System.Type>::Sort(class [mscorlib]System.Comparison`1<!0>)
	IL_0156: ldloc.1
	IL_0157: callvirt instance valuetype [mscorlib]System.Collections.Generic.Dictionary`2/Enumerator<!0, !1> class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>::GetEnumerator()
	IL_015c: stloc.s 16
	.try
	{
		// foreach (KeyValuePair<Type, List<BasePickupItem>> item3 in dictionary)
		IL_015e: br.s IL_0181
		// loop start (head: IL_0181)
			IL_0160: ldloca.s 16
			IL_0162: call instance valuetype [mscorlib]System.Collections.Generic.KeyValuePair`2<!0, !1> valuetype [mscorlib]System.Collections.Generic.Dictionary`2/Enumerator<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>::get_Current()
			IL_0167: stloc.s 17
			// item3.Value.Sort(SortingComparsion);
			IL_0169: ldloca.s 17
			IL_016b: call instance !1 valuetype [mscorlib]System.Collections.Generic.KeyValuePair`2<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>::get_Value()
			IL_0170: ldarg.0
			IL_0171: ldftn instance int32 MGSC.ItemStorage::SortingComparsion(class MGSC.BasePickupItem, class MGSC.BasePickupItem)
			IL_0177: newobj instance void class [mscorlib]System.Comparison`1<class MGSC.BasePickupItem>::.ctor(object, native int)
			IL_017c: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::Sort(class [mscorlib]System.Comparison`1<!0>)

			// foreach (KeyValuePair<Type, List<BasePickupItem>> item3 in dictionary)
			IL_0181: ldloca.s 16
			IL_0183: call instance bool valuetype [mscorlib]System.Collections.Generic.Dictionary`2/Enumerator<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>::MoveNext()
			IL_0188: brtrue.s IL_0160
		// end loop

		// (no C# code)
		IL_018a: leave.s IL_019a
	} // end .try
	finally
	{
		IL_018c: ldloca.s 16
		IL_018e: constrained. valuetype [mscorlib]System.Collections.Generic.Dictionary`2/Enumerator<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>
		IL_0194: callvirt instance void [mscorlib]System.IDisposable::Dispose()
		// for (int i = 0; i < _positions.Length; i++)
		IL_0199: endfinally
	} // end handler

	IL_019a: ldc.i4.0
	IL_019b: stloc.s 18
	// _positions[i] = null;
	IL_019d: br.s IL_01af
	// loop start (head: IL_01af)
		IL_019f: ldarg.0
		IL_01a0: ldfld class MGSC.BasePickupItem[] MGSC.ItemStorage::_positions
		IL_01a5: ldloc.s 18
		IL_01a7: ldnull
		IL_01a8: stelem.ref
		// for (int i = 0; i < _positions.Length; i++)
		IL_01a9: ldloc.s 18
		IL_01ab: ldc.i4.1
		IL_01ac: add
		IL_01ad: stloc.s 18

		// for (int i = 0; i < _positions.Length; i++)
		IL_01af: ldloc.s 18
		IL_01b1: ldarg.0
		IL_01b2: ldfld class MGSC.BasePickupItem[] MGSC.ItemStorage::_positions
		IL_01b7: ldlen
		IL_01b8: conv.i4
		IL_01b9: blt.s IL_019f
	// end loop

	// Items.Clear();
	IL_01bb: ldarg.0
	IL_01bc: call instance class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem> MGSC.ItemStorage::get_Items()
	IL_01c1: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::Clear()
	// int num = 0;
	IL_01c6: ldc.i4.0
	IL_01c7: stloc.3
	// int num2 = 0;
	IL_01c8: ldc.i4.0
	IL_01c9: stloc.s 4
	// List<BasePickupItem> list2 = new List<BasePickupItem>();
	IL_01cb: newobj instance void class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::.ctor()
	IL_01d0: stloc.s 5
	// foreach (Type item4 in list)
	IL_01d2: ldloc.2
	IL_01d3: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<class [mscorlib]System.Type>::GetEnumerator()
	IL_01d8: stloc.s 19
	.try
	{
		// foreach (Type item4 in list)
		IL_01da: br IL_029a
		// loop start (head: IL_029a)
			IL_01df: ldloca.s 19
			IL_01e1: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class [mscorlib]System.Type>::get_Current()
			IL_01e6: stloc.s 20
			// foreach (BasePickupItem item5 in dictionary[item4])
			IL_01e8: ldloc.1
			IL_01e9: ldloc.s 20
			IL_01eb: callvirt instance !1 class [mscorlib]System.Collections.Generic.Dictionary`2<class [mscorlib]System.Type, class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>>::get_Item(!0)
			IL_01f0: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::GetEnumerator()
			IL_01f5: stloc.s 6
			.try
			{
				// foreach (BasePickupItem item5 in dictionary[item4])
				IL_01f7: br IL_027e
				// loop start (head: IL_027e)
					IL_01fc: ldloca.s 6
					IL_01fe: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>::get_Current()
					IL_0203: stloc.s 21
					// if (!TryPutItem(item5, new CellPosition(num, num2), hasSpecialPos: true))
					IL_0205: ldarg.0
					IL_0206: ldloc.s 21
					IL_0208: ldloc.3
					IL_0209: ldloc.s 4
					IL_020b: newobj instance void MGSC.CellPosition::.ctor(int32, int32)
					IL_0210: ldc.i4.1
					IL_0211: ldc.i4.1
					IL_0212: call instance bool MGSC.ItemStorage::TryPutItem(class MGSC.BasePickupItem, valuetype MGSC.CellPosition, bool, bool)
					IL_0217: brtrue.s IL_0263

					// if (Width - num < item5.InventoryWidthSize)
					IL_0219: ldarg.0
					IL_021a: call instance int32 MGSC.ItemStorage::get_Width()
					IL_021f: ldloc.3
					IL_0220: sub
					IL_0221: ldloc.s 21
					IL_0223: callvirt instance int32 MGSC.BasePickupItem::get_InventoryWidthSize()
					IL_0228: bge.s IL_0244

					// num = 0;
					IL_022a: ldc.i4.0
					IL_022b: stloc.3
					// num2++;
					IL_022c: ldloc.s 4
					IL_022e: ldc.i4.1
					IL_022f: add
					IL_0230: stloc.s 4
					// if (!IsCapacityAvailable(item5))
					IL_0232: ldarg.0
					IL_0233: ldloc.s 21
					IL_0235: ldnull
					IL_0236: call instance bool MGSC.ItemStorage::IsCapacityAvailable(class MGSC.BasePickupItem, class MGSC.BasePickupItem)
					IL_023b: brtrue.s IL_0244

					// ExpandHeight(1);
					IL_023d: ldarg.0
					IL_023e: ldc.i4.1
					IL_023f: call instance void MGSC.ItemStorage::ExpandHeight(int32)

					// if (!TryPutItem(item5, new CellPosition(num, num2), hasSpecialPos: true))
					IL_0244: ldarg.0
					IL_0245: ldloc.s 21
					IL_0247: ldloc.3
					IL_0248: ldloc.s 4
					IL_024a: newobj instance void MGSC.CellPosition::.ctor(int32, int32)
					IL_024f: ldc.i4.1
					IL_0250: ldc.i4.1
					IL_0251: call instance bool MGSC.ItemStorage::TryPutItem(class MGSC.BasePickupItem, valuetype MGSC.CellPosition, bool, bool)
					IL_0256: brtrue.s IL_026d

					// list2.Add(item5);
					IL_0258: ldloc.s 5
					IL_025a: ldloc.s 21
					IL_025c: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::Add(!0)
					// num += item5.InventoryWidthSize;
					IL_0261: br.s IL_026d

					IL_0263: ldloc.3
					IL_0264: ldloc.s 21
					IL_0266: callvirt instance int32 MGSC.BasePickupItem::get_InventoryWidthSize()
					IL_026b: add
					IL_026c: stloc.3

					// if (num >= Width)
					IL_026d: ldloc.3
					IL_026e: ldarg.0
					IL_026f: call instance int32 MGSC.ItemStorage::get_Width()
					IL_0274: blt.s IL_027e

					// num = 0;
					IL_0276: ldc.i4.0
					IL_0277: stloc.3
					// num2++;
					IL_0278: ldloc.s 4
					IL_027a: ldc.i4.1
					IL_027b: add
					IL_027c: stloc.s 4

					// foreach (BasePickupItem item5 in dictionary[item4])
					IL_027e: ldloca.s 6
					IL_0280: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>::MoveNext()
					IL_0285: brtrue IL_01fc
				// end loop

				// (no C# code)
				IL_028a: leave.s IL_029a
			} // end .try
			finally
			{
				IL_028c: ldloca.s 6
				IL_028e: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>
				IL_0294: callvirt instance void [mscorlib]System.IDisposable::Dispose()
				// foreach (Type item4 in list)
				IL_0299: endfinally
			} // end handler

			IL_029a: ldloca.s 19
			IL_029c: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class [mscorlib]System.Type>::MoveNext()
			IL_02a1: brtrue IL_01df
		// end loop

		// (no C# code)
		IL_02a6: leave.s IL_02b6
	} // end .try
	finally
	{
		IL_02a8: ldloca.s 19
		IL_02aa: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class [mscorlib]System.Type>
		IL_02b0: callvirt instance void [mscorlib]System.IDisposable::Dispose()
		// foreach (BasePickupItem item6 in list2)
		IL_02b5: endfinally
	} // end handler

	IL_02b6: ldloc.s 5
	IL_02b8: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::GetEnumerator()
	IL_02bd: stloc.s 6
	.try
	{
		// foreach (BasePickupItem item6 in list2)
		IL_02bf: br.s IL_030e
		// loop start (head: IL_030e)
			IL_02c1: ldloca.s 6
			IL_02c3: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>::get_Current()
			IL_02c8: stloc.s 22
			// if (!TryPutItem(item6, CellPosition.Zero))
			IL_02ca: ldarg.0
			IL_02cb: ldloc.s 22
			IL_02cd: ldsfld valuetype MGSC.CellPosition MGSC.CellPosition::Zero
			IL_02d2: ldc.i4.0
			IL_02d3: ldc.i4.1
			IL_02d4: call instance bool MGSC.ItemStorage::TryPutItem(class MGSC.BasePickupItem, valuetype MGSC.CellPosition, bool, bool)
			IL_02d9: brtrue.s IL_030e

			// ExpandHeight(1);
			IL_02db: ldarg.0
			IL_02dc: ldc.i4.1
			IL_02dd: call instance void MGSC.ItemStorage::ExpandHeight(int32)
			// if (!TryPutItem(item6, CellPosition.Zero))
			IL_02e2: ldarg.0
			IL_02e3: ldloc.s 22
			IL_02e5: ldsfld valuetype MGSC.CellPosition MGSC.CellPosition::Zero
			IL_02ea: ldc.i4.0
			IL_02eb: ldc.i4.1
			IL_02ec: call instance bool MGSC.ItemStorage::TryPutItem(class MGSC.BasePickupItem, valuetype MGSC.CellPosition, bool, bool)
			IL_02f1: brtrue.s IL_030e

			// Debug.LogError("Failed put item " + item6.Id + " after sorting.");
			IL_02f3: ldstr "Failed put item "
			IL_02f8: ldloc.s 22
			IL_02fa: callvirt instance string MGSC.BasePickupItem::get_Id()
			IL_02ff: ldstr " after sorting."
			IL_0304: call string [mscorlib]System.String::Concat(string, string, string)
			IL_0309: call void [UnityEngine.CoreModule]UnityEngine.Debug::LogError(object)

			// foreach (BasePickupItem item6 in list2)
			IL_030e: ldloca.s 6
			IL_0310: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>::MoveNext()
			// (no C# code)
			IL_0315: brtrue.s IL_02c1
		// end loop

		IL_0317: leave.s IL_0327
	} // end .try
	finally
	{
		IL_0319: ldloca.s 6
		IL_031b: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.BasePickupItem>
		IL_0321: callvirt instance void [mscorlib]System.IDisposable::Dispose()
		IL_0326: endfinally
	} // end handler

	IL_0327: ret
} // end of method ItemStorage::SortWithExpandByTypeAndName
