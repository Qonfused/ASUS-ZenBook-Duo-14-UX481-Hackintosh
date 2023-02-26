/*
 * Ambient Light Sensor device for AsusSMC
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "ALSD", 0x00000000)
{
    External (_SB_.ATKD, DeviceObj)
	External (_SB_.ALSD, DeviceObj)
	External (ALSE, IntObj)

	If (_OSI ("Darwin"))
	{
		// Enables ambient light sensor device.
		// Reference: (ALSD)
		ALSE = 0x02
			
		Scope (\_SB.ATKD)
		{
			Method (ALSS, 0, NotSerialized)
			{
				Return (^^ALSD._ALI ())
			}

			Method (ALSC, 1, NotSerialized)
			{
			}
		}
	}
}