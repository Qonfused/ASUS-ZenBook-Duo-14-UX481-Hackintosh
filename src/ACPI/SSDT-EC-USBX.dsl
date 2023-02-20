/*
 * Creates a fake EC device for macOS and a USBX device for USB power properties.
 * @see https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-fix.html
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "EC-USBX", 0x00001000)
{
    External (_SB_.PCI0.LPCB, DeviceObj)

    // Create fake EC device to satisfy macOS naming requirement
    Scope (_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")
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

    // Create USBX device for supplying USB power properties
    Device (USBX)
    {
        Name (_ADR, Zero)
        Method (_DSM, 4, NotSerialized)
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                     0x03
                })
            }

            Return (Package (0x08)
            {
                "kUSBSleepPowerSupply", 
                0x13EC, 
                "kUSBSleepPortCurrentLimit", 
                0x0834, 
                "kUSBWakePowerSupply", 
                0x13EC, 
                "kUSBWakePortCurrentLimit", 
                0x0834
            })
        }
    }
}

