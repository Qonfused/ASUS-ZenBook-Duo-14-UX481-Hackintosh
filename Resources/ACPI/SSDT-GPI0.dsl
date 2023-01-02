/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL6zd1fW.aml, Mon Jan  2 10:08:19 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000E4 (228)
 *     Revision         0x02
 *     Checksum         0x3F
 *     OEM ID           "UX481"
 *     OEM Table ID     "GPI0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "GPI0", 0x00000000)
{
    External (_SB_.PCI0.I2C1.ETPD, DeviceObj)
    External (_SB_.PCI0.I2C1.ETPD.XCRS, MethodObj)
    External (GPHD, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin")) { GPHD = Zero }
    }

    Scope (_SB.PCI0.I2C1.ETPD)
    {
        // GPIO pin for macOS
        Name (SBFG, ResourceTemplate ()
        {
            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,)
                { 0x006D }
        })
        
        // APIC pin for Windows
        Name (SBFA, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Exclusive, ,, )
            { 0x0000006D }
        })     
        
        Method (_CRS, 0, Serialized)
        {
            // I2C bus info, pin is added below
            Name (SBFI, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
        
            If (_OSI ("Darwin"))
            {
                Return (ConcatenateResTemplate (SBFI, SBFG))
            }
            Else
            {
                Return (ConcatenateResTemplate (SBFI, SBFA))
                // XCRS ()
            }
        }
    }
}

