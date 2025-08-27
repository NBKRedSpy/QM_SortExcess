using ModConfigMenu;
using ModConfigMenu.Objects;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.Assertions.Must;

namespace SortExcess
{
    internal class McmConfiguration
    {

        public ModConfig Config { get; set; }

        public McmConfiguration(ModConfig config)
        {
                Config = config;
        }


        /// <summary>
        /// Attempts to configure the MCM, but logs an error and continues if it fails.
        /// </summary>
        public bool TryConfigure()
        {
            try
            {
                Configure();
                return true;
            }
            catch (FileNotFoundException)
            {

                Plugin.Logger.Log("Bypassing MCM. The 'Mod Configuration Menu' mod is not loaded. ");
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex,"Bypassing MCM");
            }

            return false;

        }

        public void Configure()
        {
            ModConfig defaults = new ModConfig();

            ModConfigMenuAPI.RegisterModConfig("Sort Excess", new List<ConfigValue>()
            {
                new ConfigValue(nameof(ModConfig.MaxItems), Config.MaxItems,"General", 
                    defaults.MaxItems,
                    "The maximum amount of an item to keep at the top of the storage tab.  The rest are put at the bottom.", 
                    "Top amount", min: 1, max: 20),
            }, OnSave);

        }

        private bool OnSave(Dictionary<string, object> currentConfig, out string feedbackMessage)
        {
            feedbackMessage = "";

            try
            {
                Config.MaxItems = (int)currentConfig[nameof(ModConfig.MaxItems)];
                Config.Save(Plugin.ConfigDirectories.ConfigPath);
                return true;
            }
            catch(Exception ex)
            {
                Plugin.Logger.LogError(ex, "Error saving the configuration");
            }

            return false;
        }
    }
}
