/*
 * Screenpad backlight control methods.
 * @see https://github.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/issues/6
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "SPLC", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.REBC, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.WEBC, MethodObj)

    // Sets default direction for backlight control (down/up)
    Name (SPBX, One)
    // Sets default screenpad backlight at max value (0xFF)
    Name (SPBL, Buffer (0x02) { 0x01, 0xFF })

    Scope (_SB.PCI0.LPCB.EC0)
    {
        // Screenpad backlight down
        // Reference: (WMNB, IIA0=0x00050032)
        Method (SPLD, 0, Serialized)
        {
            Local0 = DerefOf (SPBL [One])
            If ((Local0 > Zero))
            {
                SPBL [One] = (Local0 - 0x33)
                WEBC (0x13, 0x02, SPBL)
            }
        }

        // Screenpad backlight up
        // Reference: (WMNB, IIA0=0x00050032)
        Method (SPLU, 0, Serialized)
        {
            Local0 = DerefOf (SPBL [One])
            If ((Local0 < 0xFF))
            {
                SPBL [One] = (Local0 + 0x33)
                WEBC (0x13, 0x02, SPBL)
            }
        }

        // Handles 5 level brightness slider
        Method (SPLC, 0, Serialized)
        {
            If (SPBX)
            {
                SPLD ()
                // Check if reached minimum backlight
                Local0 = (DerefOf (SPBL [One]) > Zero)
            }
            Else
            {
                SPLU ()
                // Check if reached maximum backlight
                Local0 = (DerefOf (SPBL [One]) < 0xFF)
            }

            // Switch backlight control direction at bounds
            If (!Local0) { SPBX = !SPBX }
        }

        // Resets backlight to last recorded value if out of sync or disabled.
        // Reference: (WMNB, IIA0=0x00050035)
        Method (SPRS, 0, Serialized)
        {
            Local0 = REBC (0x12, 0x02)
            // Fixes OOB condition if register frozen in invalid state
            If ((DerefOf (Local0 [Zero]) > 0xFF)) { SPBL [One] = 0xFF }
            // Resets connector power
            If (!DerefOf (SPBL [Zero])) { SPBL [Zero] = One }

            WEBC (0x13, 0x02, SPBL)
        }
        // Set screenpad backlight to default backlight at boot
        If (_OSI ("Darwin")) { SPRS () }

        // Toggles Screenpad connector power
        // Reference: (WMNB, IIA0=0x00050031)
        Method (SPSW, 0, NotSerialized)
        {
            SPBL [Zero] = (One - DerefOf (SPBL [Zero]))
            If (!DerefOf (SPBL [Zero]))
            {
                SPBL [Zero] = Zero
                Local0 = SPBL
                Local0 [One] = 0x00010082
                WEBC (0x13, 0x02, Local0)
            }
            Else { SPRS () }
        }
    }
}