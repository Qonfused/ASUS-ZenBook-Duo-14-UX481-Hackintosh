/*
 * SSDT for restoring FN keys on macOS for the UX481FA/FL Zenbook Duo.
 * 
 * This SSDT depends on SSDT-KBLC and SSDT-SPLC for keyboard/screenpad backlight
 * control methods.
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "ATKD", 0x00000000)
{
    External (_SB_.ATKD.IANE, MethodObj)
    External (_SB_.KBLV, IntObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.SPLC, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.SPSW, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.ST9E, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.WEBC, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ0D, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ0E, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ0F, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ18, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ31, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ32, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQD5, MethodObj)
    External (ATKP, IntObj)
    External (KFSK, IntObj)

    Scope (_SB)
    {
        If (_OSI ("Darwin"))
        {
            // Enables media key EC methods (including KBLD and KBLU methods)
            // Reference: (ATKD.INIT)
            ATKP = One

            // Sets FN+Lock disable default
            // Reference: (WMNB, IIA0=0x00100023)
            If ((KFSK == Zero))
            {
                \_SB.PCI0.LPCB.EC0.ST9E (0x3C, 0xFF, 0x04)
            }
        }
    }

    Name (FNKL, Zero)
    Name (DKLV, One)
    Name (BACT, Zero)

    Scope (_SB.PCI0.LPCB.EC0)
    {
        // FN + Lock: Toggle
        // Reference: (WMNB, IIA0=0x00100023)
        Method (_QD5, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((FNKL == Zero))
                {
                    Local0 = 0x08
                    FNKL = One
                }
                Else
                {
                    Local0 = 0x04
                    FNKL = Zero
                }

                ST9E (0x3C, 0xFF, Local0)
            }
            Else
            {
                XQD5 ()
            }
        }

        // FN + F4: Brightness down
        Method (_Q0E, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \_SB.ATKD.IANE (0x20)
            }
            Else
            {
                XQ0E ()
            }
        }

        // FN + F5: Brightness up
        Method (_Q0F, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \_SB.ATKD.IANE (0x10)
            }
            Else
            {
                XQ0F ()
            }
        }

        // FN + F7: Keyboard backlight slider
        Method (_Q0D, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                // Switch direction at min/max backlight
                Switch (ToInteger (KBLV))
                {
                    Case (Zero) { DKLV = Zero }
                    Case (0x0F) { DKLV = One }
                }

                // Brightness down
                If ((DKLV == One))
                {
                    \_SB.ATKD.IANE (0xC5)
                }
                // Brightness up
                Else
                {
                    \_SB.ATKD.IANE (0xC4)
                }
            }
            Else
            {
                XQ0D ()
            }
        }

        // FN + F12: Battery charging threshold toggle
        // Reference: (SRSC; WNMB, IIA0=0x00120057)
        Method (_Q18, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Name (BUF0, Buffer (One){ 0x00 })
                If ((BACT == Zero))
                {
                    BUF0 [Zero] = Zero
                    BACT = One
                }
                Else
                {
                    BUF0 [Zero] = 0x50
                    BACT = Zero
                }

                WEBC (0x06, One, BUF0)
            }
            Else
            {
                XQ18 ()
            }
        }

        // (Switch Windows): Screenpad brightness slider
        Method (_Q31, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                SPLC ()
            }
            Else
            {
                XQ31 ()
            }
        }

        // (Toggle Screenpad): Screenpad power toggle
        Method (_Q32, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                SPSW ()
            }
            Else
            {
                XQ32 ()
            }
        }
    }
}