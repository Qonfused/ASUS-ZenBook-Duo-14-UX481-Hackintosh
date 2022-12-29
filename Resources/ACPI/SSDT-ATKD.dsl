DefinitionBlock ("", "SSDT", 2, "ASUS", "ATKD", 0x00000000)
{
    External (_SB_.ATKD, DeviceObj)
    External (_SB_.ATKD.IANE, MethodObj)
    External (_SB_.ATKP, DeviceObj)
    External (_SB_.KBLV, IntObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.ST9E, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.WEBC, MethodObj)
    
    // ACPI Renames
    External (_SB_.PCI0.LPCB.EC0_.XQ0D, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ0E, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ0F, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ17, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ18, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ32, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ71, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.XQD5, MethodObj)
    
    External (_SB_.SPPF, IntObj)
    External (ATKP, IntObj)
    External (KFSK, IntObj)
    External (OSYS, IntObj)
    External (RMDT, DeviceObj)

    Name (FNKL, Zero)
    Name (SCPD, Zero)
    Name (SPMD, Zero)
    Name (SCBL, Zero)
    Name (SCBX, Zero)
    Name (BACT, Zero)
    Name (DKLV, One)

    Scope (\_SB)
    {
        If (_OSI ("Darwin"))
        {
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

    Scope (_SB.PCI0.LPCB.EC0)
    {
        // FN Lock/Unlock
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
            Else { XQD5 () }
        }

		// FN + F4, Brightness Down
        Method (_Q0E, 0, NotSerialized)
        {
            If (_OSI ("Darwin")) { \_SB.ATKD.IANE (0x20) }
            Else { XQ0E () }
        }

		// FN + F5, Brightness Up
        Method (_Q0F, 0, NotSerialized)
        {
            If (_OSI ("Darwin")) { \_SB.ATKD.IANE (0x10) }
            Else { XQ0F () }
        }

        // FN + F6, ???

        // FN + F7, Keyboard Backlight
        Method (_Q0D, 0, Serialized)
        {
            If (_OSI ("Darwin"))
            {
                Switch (ToInteger (KBLV))
                {
                    Case (Zero) { DKLV = Zero }
                    Case (0x0F) { DKLV = One }
                }

                If ((DKLV == One)) { \_SB.ATKD.IANE (0xC5) }
                Else { \_SB.ATKD.IANE (0xC4) }
            }
            Else { XQ0D () }
        }

        // FN + F8, ???

        // FN + F9, ???

		// FN + F10, ???
        Method (_Q17, 0, NotSerialized)
        {
            If (_OSI ("Darwin")) { \_SB.ATKD.IANE (0x35) }
            Else { XQ17 () }
        }

		// FN + F11, ???
        Method (_Q18, 0, NotSerialized)
        {
            If (_OSI ("Darwin")) { \_SB.ATKD.IANE (0x45) }
            Else { XQ18 () }
        }

        // FN + F12, ???

        // FN + Disable Screenpad Plus
        Method (_Q32, 0, NotSerialized)
        {
            If ((_OSI ("Darwin") || (OSYS <= 0x07DD)))
            {
                Local0 = Buffer (0x02){ 0x00, 0x00 }
                If ((SCPD == Zero))
                {
                    Local0 [Zero] = 0x00010001
                    Local0 [One] = 0x0001FF52
                    SCPD = One
                }
                ElseIf ((SCPD == One))
                {
                    Local0 [Zero] = Zero
                    Local0 [One] = 0x00010082
                    SCPD = Zero
                }

                WEBC (0x13, 0x02, Local0)
            }
            Else { XQ32 () }
        }

        // FN + Spacebar, Battery Threshold
        Method (_Q71, 0, NotSerialized)
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
            Else { XQ71 () }
        }

        // FN + A, Screenpad Backlight
        Method (_Q76, 0, Serialized)
        {
            Local0 = Buffer (0x02) { 0x01, 0x00 }
            Switch (ToInteger (SCBX))
            {
                Case (Zero)
                {
                    If ((SCBX == Zero))
                    {
                        Local0 [One] = 0x14
                        SCBX = One
                    }
                }
                Case (One)
                {
                    If ((SCBX == One))
                    {
                        Local0 [One] = 0x32
                        SCBX = 0x02
                    }
                }
                Case (0x02)
                {
                    If ((SCBX == 0x02))
                    {
                        Local0 [One] = 0x64
                        SCBX = 0x03
                    }
                }
                Case (0x03)
                {
                    If ((SCBX == 0x03))
                    {
                        Local0 [One] = 0xFF
                        SCBX = 0x04
                    }
                }
                Default
                {
                    If ((SCBX == 0x04))
                    {
                        Local0 [One] = 0x05
                        SCBX = Zero
                    }
                }

            }

            If ((SCBL == One)) { SCBL = Zero }
            Else { SCBL = One }

            WEBC (0x13, 0x02, Local0)
        }
    }
}
