/*
 * Keyboard backlight EC control methods.
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "KBLC", 0x00000000)
{
    External (_SB_.ATKD, DeviceObj)
    External (_SB_.KBLV, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.ST9E, MethodObj)

    Scope (\_SB.ATKD)
    {
        If (_OSI ("Darwin"))
        {
            // Create keyboard backlight method for writing to EC register.
            Method (SKBV, 1, NotSerialized)
            {
                \_SB.KBLV = (Arg0 / 0x10)
                \_SB.PCI0.LPCB.EC0.ST9E (0x1F, 0xFF, Arg0)
                Return (Arg0)
            }
        }
    }
}