/*
 * Re-enables system management bus support in macOS (SMBus/AppleSMBus)
 * @see https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "SBUSMCHC", 0x00000000)
{
    External (_SB_.PCI0.SBUS, DeviceObj)

    Device (_SB.PCI0.MCHC)
    {
        Name (_ADR, Zero)
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }

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
                If (!Arg2)
                {
                    Return (Buffer (One){ 0x57 })
                }

                Return (Package (0x02)
                {
                    "address", 
                    0x57
                })
            }
        }

        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
}