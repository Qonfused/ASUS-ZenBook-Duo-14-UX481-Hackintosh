/*
 * Disables the Screenpad Plus display connector.
 */
DefinitionBlock ("", "SSDT", 2, "ASUS", "BOE087F", 0x00000000)
{
    External (_SB_.PCI0.GFX0.DD02, MethodObj)
    External (_SB_.PCI0.LPCB.EC0_.WEBC, MethodObj)
    // Requires a NWAK to XWAK ACPI rename
    External (_SB_.PCI0.XWAK, MethodObj)

    /*
	 * Defines a new '_OFF' method for the Screenpad Plus.
	 */
    Method (\_SB.PCI0.GFX0.DD02._OFF, 0, NotSerialized)
    {
        Local0 = Buffer (0x02) { 0x00, 0x00 }
        Local0 [One] = 0x00010082
        \_SB.PCI0.LPCB.EC0.WEBC (0x13, 0x02, Local0)
    }

    /*
	 * Overrides wake behavior by disabling Screenpad Plus.
	 */
    Method (\_SB.PCI0.NWAK, 0, NotSerialized)
    {
        If (_OSI ("Darwin")) { \_SB.PCI0.GFX0.DD02._OFF () }
        Else { XWAK () }
    }

    // Disable on macOS boot
    Scope (_SB)
    {
        If (_OSI ("Darwin")) { \_SB.PCI0.GFX0.DD02._OFF () }
    }
}