/*
 * Keyboard backlight EC control methods.
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "KBLC", 0x00000000)
{
    External (_SB_.ALSE, IntObj)
    External (_SB_.ATKD, DeviceObj)
    External (_SB_.KBLV, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.ST9E, MethodObj)
    External (ATKP, IntObj)

    Scope (\_SB)
    {
        If (_OSI ("Darwin"))
        {
            // Enables KBLD and KBLU backlight control methods.
            ATKP = One

            // Create keyboard backlight method for writing to EC register.
            Scope (ATKD)
            {
                Method (SKBV, 1, NotSerialized)
                {
                    \_SB.KBLV = (Arg0 / 0x10)
                    \_SB.PCI0.LPCB.EC0.ST9E (0x1F, 0xFF, Arg0)
                    Return (Arg0)
                }
            }
        }
    }
}