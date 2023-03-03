/*
 * Re-enables legacy RTC clock for macOS.
 * @see https://dortania.github.io/Getting-Started-With-ACPI/Universal/awac.html
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "AWAC", 0x00000000)
{
    External (STAS, IntObj)

    If (_OSI ("Darwin"))
    {
        // Enables _STA method in legacy RTC
        STAS = One
    }
}