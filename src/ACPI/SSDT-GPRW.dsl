/*
 * Fixes instant wake on USB or power state change.
 * @see https://dortania.github.io/OpenCore-Post-Install/usb/misc/instant-wake.html
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "GPRW", 0x00000000)
{
    // config.plist ACPI > Patch renames
    External (XPRW, MethodObj)

    Method (GPRW, 2, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            Switch (Arg0)
            {
                Case (0x6D) { Return (Package (0x02){ 0x6D, Zero }) }
                Case (0x0D) { Return (Package (0x02){ 0x0D, Zero }) }
            }
        }

        Return (XPRW (Arg0, Arg1))
    }
}