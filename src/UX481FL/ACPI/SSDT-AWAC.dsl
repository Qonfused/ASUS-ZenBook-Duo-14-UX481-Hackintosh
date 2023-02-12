/*
 * Re-enables legacy RTC clock for macOS.
 * @see https://dortania.github.io/Getting-Started-With-ACPI/Universal/awac.html
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "AWAC", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC0_.ST9E, MethodObj)
    External (KFSK, IntObj)
    External (STAS, IntObj)

    Scope (_SB)
    {
        If (_OSI ("Darwin"))
        {
            // Enables _STA method in legacy RTC
            STAS = One

            // Disables RTC clock (WMI: IIA0=0x00100023, IIA1=Zero)
            If ((KFSK == Zero))
            {
                \_SB.PCI0.LPCB.EC0.ST9E (0x3C, 0xFF, 0x04)
            }
        }
    }
}