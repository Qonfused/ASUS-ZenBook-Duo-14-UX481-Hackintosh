/*
 * Keyboard backlight EC control methods.
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "KBLC", 0x00000000)
{
    External (_SB_.ATKD, DeviceObj)
    External (_SB_.ATKD.XANE, MethodObj)
    External (_SB_.KBLV, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.ST9E, MethodObj)
    External (ATKP, IntObj)

    Scope (_SB)
    {
        // Enables media key EC methods (including KBLD and KBLU methods)
        // Reference: (ATKD.INIT)
        If (_OSI ("Darwin")) { ATKP = One }

        Scope (ATKD)
        {
            // Stores backlight increment/decrement direction.
            Name (DKLV, One)

            // Modifies IANE method to override backlight notifier events.
            // Reference: (KBLD, KBLU)
            Method (IANE, 1, Serialized)
            {
                // Hijacks KBLU notifier calls in macOS
                If (_OSI ("Darwin") && Arg0 == 0xC7) {
                    Local0 = 0xC4           // 0xC4 - Backlight Up
                    If (DKLV) { Local0++ }  // 0xC5 - Backlight Down
                }
                Else { Local0 = Arg0 }      // For all other events

                XANE (Local0)
            }

            If (_OSI ("Darwin"))
            {
                // Create keyboard backlight method for writing to EC register.
                // Reference: (SLKB)
                Method (SKBV, 1, NotSerialized)
                {
                    Local0 = (Arg0 / 0x10)
                    // Switch direction at min/max backlight
                    Switch (Local0)
                    {
                        Case (Zero) { DKLV = Zero }
                        Case (0x0F) { DKLV = One }
                    }
                    // Handle unset initial backlight
                    If (!^^KBLV && DKLV) { DKLV-- }

                    // Set new backlight value
                    ^^KBLV = Local0
                    ^^PCI0.LPCB.EC0.ST9E (0x1F, 0xFF, Arg0)

                    Return (Arg0)
                }
            }
        }
    }
}