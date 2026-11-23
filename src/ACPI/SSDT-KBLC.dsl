/*
 * Firmware's SLKB method selects one of four keyboard brightness presets.
 * Writing the brightness from AsusSMC directly to the embedded controller
 * preserves all 16 steps available in macOS.
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "KBLC", 0x00000000)
{
    External (_SB_.ATKD, DeviceObj)
    External (_SB_.KBLV, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.ST9E, MethodObj)

    Scope (_SB.ATKD)
    {
        Method (SKBV, 1, Serialized)
        {
            Local0 = (Arg0 / 0x10)
            If ((^^KBLV != Local0) || !Local0)
            {
                ^^KBLV = Local0
                ^^PCI0.LPCB.EC0.ST9E (0x1F, 0xFF, Arg0)
            }

            Return (Arg0)
        }
    }
}
