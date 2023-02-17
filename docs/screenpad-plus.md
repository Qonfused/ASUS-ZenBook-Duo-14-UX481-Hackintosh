## Schematic

### UX481FA/FL Schematic
**References:**
- **Schematic**: [Asus ZenBook Duo UX481FL Rev 2.0.pdf](https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/docs/resources/schematics/Asus%20ZenBook%20Duo%20UX481FL%20Rev%202.0.pdf)
- **Boardview**: [UX481FL-W25Q128.BIN](https://raw.githubusercontent.com/Qonfused/ASUS-ZenBook-Duo-14-UX481-Hackintosh/main/docs/resources/schematics/UX481FL-W25Q128.BIN)

#### CPU - Display Signals (U0301A, Page 3)
Pin | Signal           | PCH GPIO            | DP LCD Connector (J4501)
--- | ---------------- | ------------------- | ---
AL5 | DDI1_TXN_0       |                     | DDI1_TXN0_C
AL6 | DDI1_TXP_0       |                     | DDI1_TXP0_C
AJ5 | DDI1_TXN_1       |                     | DDI1_TXN1_C
AJ6 | DDI1_TXP_1       |                     | DDI1_TXP1_C
CC8 | DDPB_SCL_PCH     | GPP_E18             |
CC9 | DDPB_SDA_PCH     | GPP_E19             |
AC6 | DDI1_AUX_P       |                     | DP_AUXP_C
AC7 | DDI1_AUX#        |                     | DP_AUXP_C
CN6 | DDPB_HPD0        | GPP_E13             | DP_HPD_PCH_C

#### DP LCD Connector (J4501, Page 31)
Pin | Signal           | PCH GPIO            | EC IT8225 GPIO   | CPU (U0301A)
--- | ---------------- | ------------------- | ---------------- | ---
1   | CABC_DP_EN       |                     | GPJ7 (CABC_EN)   |
2   | (GND)            |                     |                  |
3   | DP_TXN1_C        |                     |                  | DDI1_TXN_1
4   | DP_TXP1_C        |                     |                  | DDI1_TXP_1
5   | (GND)            |                     |                  |
6   | DP_TXN0_C        |                     |                  | DDI1_TXN_0
7   | DP_TXP0_C        |                     |                  | DDI1_TXP_0
8   | (GND)            |                     |                  |
9   | DP_AUXP_C        |                     |                  | DDI1_AUX_P
10  | DP_AUXN_C        |                     |                  | DDI1_AUX#
11  | (GND)            |                     |                  |
12  | (GND)            |                     |                  |
13  | -                |                     |                  |
14  | +3VS_DP          |                     |                  |
15  | +3VS_DP          |                     |                  |
16  | -                |                     |                  |
17  | DP_HPD_PCH_C     | GPP_E13 (DDPB_HPD0) | GPF4 (DP_HPD#)   |
18  | DP_BLEN_C        |                     | GPB2 (DP_BL_EN)  |
19  | DP_PWM_C         |                     | GPA7 (DP_PWM)    |
20  | -                |                     |                  |
21  | AC_BAT_SYS_DP    |                     |                  |
22  | AC_BAT_SYS_DP    |                     |                  |
23  | -                |                     |                  |
24  | -                |                     |                  |
25  | +3VS_TP          |                     |                  |
26  | (GND)            |                     |                  |
27  | DP_TP_Report_SW  |                     |                  |
28  | I2C3_SCL_TCH_PNL | GPP_H7              |                  |
29  | I2C3_SDA_TCH_PNL | GPP_H6              |                  |
30  | TPanel_INT#_2ND  | GPP_B18             |                  |
31  | GND1             |                     |                  |
32  | GND2             |                     |                  |
33  | GND3             |                     |                  |
34  | GND4             |                     |                  |