/*
 * Creates a PNLF device for macOS to store display backlight information.
 * @see https://dortania.github.io/Getting-Started-With-ACPI/Laptops/backlight.html
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "PNLF", 0x00000000)
{
    External (_SB_.PCI0.GFX0, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Device (\_SB.PCI0.GFX0.PNLF)
        {
            Name (_HID, EisaId ("APP0002"))
            Name (_CID, "backlight")
            Name (_UID, 0x13)
            Name (_STA, 0x0B)
        }
    }
}