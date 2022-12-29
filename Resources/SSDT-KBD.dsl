/*
 * Remaps keyboard based on scan codes.
 * @see https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/wiki/How-to-Use-Custom-Keyboard-Mapping.
 */
DefinitionBlock ("", "SSDT", 2, "UX434", "PS2KBD", 0x00000000)
{
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)

    Scope (_SB.PCI0.LPCB.PS2K)
    {
        Name (RMCF, Package (0x02)
        {
            "Keyboard", 
            Package (0x06)
            {
                // TODO: Document PS2 remapping
                "Custom PS2 Map", 
                Package (0x06)
                {
                    Package (0x00){},
                    "46=80",   // 
                    "e045=80", // 
                    "e037=64", // 
                    "e052=67", // 
                    "e05d=57"  // 
                },

                "MaximumMacroTime",
                0x017D7840, 
                "Macro Inversion",
                Package (0x03)
                {
                    Package (0x00){}, 
                    Buffer (0x0C)
                    {
                        /* 0000 */  0xFF, 0xFF, 0x01, 0x57, 0x00, 0x00, 0x00, 0x00,
                        /* 0008 */  0x02, 0x5B, 0x01, 0x19
                    },

                    Buffer (0x0C)
                    {
                        /* 0000 */  0xFF, 0xFF, 0x01, 0xD7, 0x00, 0x00, 0x00, 0x00,
                        /* 0008 */  0x01, 0x99, 0x02, 0xDB
                    }
                }
            }
        })
    }
}