/*
 * Allows native cpu power management (XCPM).
 * @see https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html
 *
 * Note: Not needed for macOS versions above Monterey 11.3
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "CpuPlug", 0x00003000)
{
    External (_SB_.PR00, ProcessorObj)

    Scope (_SB.PR00)
    {
        Method (_DSM, 4, NotSerialized)
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One){ 0x03 })
            }

            Return (Package (0x02)
            {
                "plugin-type", 
                One
            })
        }
    }
}