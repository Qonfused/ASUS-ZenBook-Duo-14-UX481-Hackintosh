/*
 * Firmware sends Fn+F4 and Fn+F5 to the internal display through GFX0.DD1F.
 * Forwarding those keys through ATKD lets AsusSMC adjust brightness on the
 * display under the pointer.
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "ATKD", 0x00000000)
{
    External (_SB_.ATKD, DeviceObj)
    External (_SB_.ATKD.IANE, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ0E, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ0F, MethodObj)

    Scope (_SB.ATKD)
    {
        // AsusSMC uses Fn+F12 (MyASUS) to switch between 80% and full charging.
        Name (BKEY, One)
    }

    Scope (_SB.PCI0.LPCB.EC0)
    {
        // Fn+F4 dims the display.
        Method (_Q0E, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                ^^^^ATKD.IANE (0x20)
            }
            Else { XQ0E () }
        }

        // Fn+F5 brightens the display.
        Method (_Q0F, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                ^^^^ATKD.IANE (0x10)
            }
            Else { XQ0F () }
        }
    }
}
