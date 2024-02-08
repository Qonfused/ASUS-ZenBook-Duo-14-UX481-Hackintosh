/*
 * Handles macOS-specific device initialization quirks on wake.
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "XWAK", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    // config.plist ACPI > Patch renames
    External (XWAK, MethodObj)
    // SSDT-ATKD methods and variables
    External (_SB_.PCI0.LPCB.EC0_._QD5, MethodObj)
    External (FNKL, IntObj)
    // SSDT-KBLC variables
    External (_SB_.KBLV, IntObj)
    External (DKLV, IntObj)
    // SSDT-SPLC methods and variables
    External (_SB_.PCI0.LPCB.EC0_.SPSW, MethodObj)
    External (SPBL, BuffObj)

    Method (_WAK, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            Scope (\_SB.PCI0.LPCB.EC0)
            {
                // Restore FN+Lock to previous state
                FNKL ^= One
                _QD5 ()

                // Restore keyboard backlight to previous state
                // If (DKLV != (\_SB.KBLV / 0xFF)) { DKLV ^= One }
                If ((DKLV == ((0xFF - \_SB.KBLV) / 0xFF))) { DKLV ^= One }

                // Restore screenpad backlight to previous state
                SPBL [Zero] = (One - DerefOf (SPBL [Zero]))
                SPSW ()
            }
        }
        
        Return (XWAK (Arg0))
    }
}