/*
 * SSDT map of USB personalities.
 */
DefinitionBlock ("", "SSDT", 2, "UX434", "USB", 0x00000000)
{
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS01, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS01.XUPC, PkgObj)
    External (_SB_.PCI0.XHC_.RHUB.HS02, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS02.XUPC, PkgObj)
    External (_SB_.PCI0.XHC_.RHUB.HS05, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS05.DCAM, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS05.DCAN, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS05.XUPC, PkgObj)
    External (_SB_.PCI0.XHC_.RHUB.HS10, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS10.XUPC, PkgObj)
    External (_SB_.PCI0.XHC_.RHUB.SS01, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SS01.XUPC, PkgObj)
    External (_SB_.PCI0.XHC_.RHUB.SS02, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SS02.XUPC, PkgObj)
    External (_SB_.PCI0.XHC_.RHUB.SS03, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SS03.XUPC, PkgObj)
    External (_SB_.PCI0.XHC_.RHUB.SS04, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.SS04.XUPC, PkgObj)
    External (XUPC, IntObj)

    Scope (_SB.PCI0.XHC.RHUB.HS01)
    {
        Method (_UPC, 0, Serialized)
        {
            If (_OSI ("Darwin")) { Return (Package (0x04) { 0xFF, Zero, Zero, Zero }) }
            Else { Return (XUPC) }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS02)
    {
        Method (_UPC, 0, Serialized)
        {
            If (_OSI ("Darwin")) { Return (Package (0x04) { 0xFF, Zero, Zero, Zero }) }
            Else { Return (XUPC) }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS05.DCAM)
    {
        Method (_UPC, 0, Serialized)
        {
            If (_OSI ("Darwin")) { Return (Package (0x04) { 0xFF, 0xFF, Zero, Zero }) }
            Else { Return (XUPC) }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS05.DCAN)
    {
        Method (_UPC, 0, Serialized)
        {
            If (_OSI ("Darwin")) { Return (Package (0x04) { Zero, 0xFF, Zero, Zero }) }
            Else { Return (XUPC) }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.HS10)
    {
        Method (_UPC, 0, Serialized)
        {
            If (_OSI ("Darwin")) { Return (Package (0x04) { 0xFF, 0xFF, Zero, Zero }) }
            Else { Return (XUPC) }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS01)
    {
        Method (_UPC, 0, Serialized)
        {
            If (_OSI ("Darwin")) { Return (Package (0x04) { 0xFF, 0x03, Zero, Zero }) }
            Else { Return (\_SB.PCI0.XHC.RHUB.SS01.XUPC) }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS02)
    {
        Method (_UPC, 0, Serialized)
        {
            If (_OSI ("Darwin")) { Return (Package (0x04) { 0xFF, 0x03, Zero, Zero }) }
            Else { Return (\_SB.PCI0.XHC.RHUB.SS02.XUPC) }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS03)
    {
        Method (_UPC, 0, Serialized)
        {
            If (_OSI ("Darwin")) { Return (Package (0x04) { 0xFF, 0x09, Zero, Zero }) }
            Else { Return (\_SB.PCI0.XHC.RHUB.SS03.XUPC) }
        }
    }

    Scope (_SB.PCI0.XHC.RHUB.SS04)
    {
        Method (_UPC, 0, Serialized)
        {
            If (_OSI ("Darwin")) { Return (Package (0x04) { 0xFF, 0x09, Zero, Zero }) }
            Else { Return (\_SB.PCI0.XHC.RHUB.SS04.XUPC) }
        }
    }

    // SSDT-USBX
    Scope (\_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)
            Method (_DSM, 4, NotSerialized)
            {
                If ((Arg2 == Zero)) { Return (Buffer (One) { 0x03 }) }

                Return (Package (0x08)
                {
                    "kUSBSleepPortCurrentLimit", 
                    0x0BB8, 
                    "kUSBWakePortCurrentLimit", 
                    0x0BB8
                })
            }

            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin")) { Return (0x0F) }
                Else { Return (Zero) }
            }
        }
    }
}

