/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLOWzFWO.aml, Wed Dec 28 19:03:13 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000448 (1096)
 *     Revision         0x02
 *     Checksum         0x46
 *     OEM ID           "ASUS"
 *     OEM Table ID     "UX481FA"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "ASUS", "UX481FA", 0x00000000)
{
    External (_SB_.ALSE, IntObj)
    External (_SB_.PCI0.I2C1.ETPD, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.ST9E, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.WEBC, MethodObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB.HS05.DCAN, DeviceObj)
    External (_SB_.PCI0.XWAK, MethodObj)
    External (_SB_.PR00, DeviceObj)
    External (_SB_.SLPB._STA, UnknownObj)
    External (ATKP, IntObj)
    External (HPTE, IntObj)
    External (IPTP, IntObj)
    External (KFSK, IntObj)
    External (STAS, IntObj)
    External (TPLP, IntObj)
    
    Scope (_SB)
    {
        If (_OSI ("Darwin"))
        {
            ATKP = One
            ALSE = 0x02
            HPTE = Zero
            TPLP = Zero
            \_SB.SLPB._STA = 0x0B
        }
    }
    
    // SSDT-AWAK
    Scope (_SB)
    {
        If (_OSI ("Darwin"))
        {
            STAS = One
        }
    }
    
    // Disable-Screenpad
    Scope (_SB)
    {
        If (_OSI ("Darwin"))
        {
            Local0 = Buffer (0x02) { 0x00, 0x00 }
            Local0 [One] = 0x00010082
            \_SB.PCI0.LPCB.EC0.WEBC (0x13, 0x02, Local0)
            If ((KFSK == Zero))
            {
                \_SB.PCI0.LPCB.EC0.ST9E (0x3C, 0xFF, 0x04)
            }
        }
    }
    Method (_SB.PCI0.NWAK, 0, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            Local0 = Buffer (0x02) { 0x00, 0x00 }
            Local0 [One] = 0x00010082
            \_SB.PCI0.LPCB.EC0.WEBC (0x13, 0x02, Local0)
            If ((KFSK == Zero))
            {
                \_SB.PCI0.LPCB.EC0.ST9E (0x3C, 0xFF, 0x04)
            }
        }
        Else { XWAK () }
    }

    // Trackpad GPIO
    Scope (_SB.PCI0.I2C1.ETPD)
    {
        Method (_CRS, 0, Serialized)
        {
            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault,
                        0x0000, "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer,,)
                { 0x006D }
            })
            Name (SBFI, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                                AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                                0x00, ResourceConsumer, , Exclusive,)
            })
            Return (ConcatenateResTemplate (SBFI, SBFG))
        }
    }

    // SSDT-PNLF
    Device (_SB.PCI0.GFX0.PNLF)
    {
        Name (_HID, EisaId ("APP0002"))
        Name (_CID, "backlight")
        Name (_UID, 0x13)
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin")) { Return (0x0B) }
            Else { Return (Zero) }
        }
    }

    // SSDT-MCHC
    Device (_SB.PCI0.MCHC)
    {
        Name (_ADR, Zero)
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin")) { Return (0x0F) }
            Else { Return (Zero) }
        }
    }

    // SSDT-PLUG
    Scope (_SB.PR00)
    {
        Method (_DSM, 4, NotSerialized)
        {
            If ((Arg2 == Zero)) { Return (Buffer (One) { 0x03 }) }
            
            Return (Package (0x02) { "plugin-type", One })
        }
    }

    // SSDT-EC
    Scope (_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin")) { Return (0x0F) }
                Else { Return (Zero) }
            }
        }
    }
    
    // SSDT-SBUS
    Device (_SB.PCI0.SBUS.BUS0)
    {
        Name (_CID, "smbus")
        Name (_ADR, Zero)
        Device (DVL0)
        {
            Name (_ADR, 0x57)
            Name (_CID, "diagsvault")
            Method (_DSM, 4, NotSerialized)
            {
                If (!Arg2) { Return (Buffer (One) { 0x57 }) }

                Return (Package (0x02) { "address", 0x57 })
            }
        }

        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin")) { Return (0x0F) }
            Else { Return (Zero) }
        }
    }
}

