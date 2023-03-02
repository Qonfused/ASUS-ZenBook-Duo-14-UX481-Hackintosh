/*
 * Disables dGPU by calling _OFF method or falling back to S3 power state.
 * @see https://dortania.github.io/Getting-Started-With-ACPI/Laptops/laptop-disable.html
 *
 * Credit for the Bumblebee (S3) method goes to Bumblebee-Project
 * @see https://github.com/Bumblebee-Project/Bumblebee/wiki/ACPI-for-Developers#acpi-and-the-nvidia-card
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "DGPU", 0x00000000)
{
    External (_SB_.PCI0.RP05.PEGP._DSM, MethodObj)
    External (_SB_.PCI0.RP05.PEGP._OFF, MethodObj)
    External (_SB_.PCI0.RP05.PEGP._PS3, MethodObj)

    // Use _OFF method if present in dGPU device
    If (CondRefOf (\_SB.PCI0.RP05.PEGP._OFF))
    {
        Device (RMD1)
        {
            Name (_HID, "RMD10000")
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else { Return (Zero) }
            }

            Method (_INI, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    \_SB.PCI0.RP05.PEGP._OFF ()
                }
            }
        }
    }
    // Fallback to S3 method if both required methods are present
    ElseIf ((CondRefOf (\_SB.PCI0.RP05.PEGP._DSM) && CondRefOf (\_SB.PCI0.RP05.PEGP._PS3)))
    {
        Device (NHG1)
        {
            Name (_HID, "NHG10000")
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else { Return (Zero) }
            }

            Method (_INI, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    // dGPU off request
                    \_SB.PCI0.RP05.PEGP._DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0"), 0x0100, 0x1A, Buffer (0x04)
                        {
                            0x01, 0x00, 0x00, 0x03
                        })
                    // Power dGPU off
                    \_SB.PCI0.RP05.PEGP._PS3 ()
                }
            }
        }
    }
}

