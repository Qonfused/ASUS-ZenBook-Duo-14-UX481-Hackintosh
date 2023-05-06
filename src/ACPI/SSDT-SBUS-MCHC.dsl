/*
 * Re-enables system management bus support in macOS (SMBus/AppleSMBus)
 * @see https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "SBUSMCHC", 0x00000000)
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
            Else { Return (Zero) }
        }
    }

    Device (_SB.PCI0.SBUS.BUS0)
    {
        Name (_CID, "smbus")
        Name (_ADR, Zero)
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else { Return (Zero) }
        }
    }
}