/*
 * Ambient Light Sensor device for AsusSMC
 */
DefinitionBlock ("", "SSDT", 2, "UX481", "ALSD", 0x00000000)
{
	External (_SB_.ATKD, DeviceObj)
	External (_SB_.ALSD, DeviceObj)
	External (_SB_.ALSD._ALI, MethodObj)
	External (ALSE, IntObj)

	If (_OSI ("Darwin"))
	{
		// Enables ambient light sensor device.
		// Reference: (ALSD)
		ALSE = 0x02

		Method (_SB.ATKD.ALSS, 0, NotSerialized)
		{
			Return (^^ALSD._ALI ())
		}
	}
}