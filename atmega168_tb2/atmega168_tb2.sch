EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L atmega168_tb2-rescue:ATmega168PB-AU-MCU_Microchip_ATmega U2
U 1 1 5F1D38A0
P 3550 2950
F 0 "U2" H 3550 2850 50  0000 C CNN
F 1 "ATmega168PB-AU" H 3550 2950 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 3550 2950 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/40001909A.pdf" H 3550 2950 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/ATMEGA168PB-AU/ATMEGA168PB-AU-ND/5029503/?itemSeq=333404562" H 3550 2950 50  0001 C CNN "Digikey"
	1    3550 2950
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0101
U 1 1 5F1D3F0C
P 3550 4450
F 0 "#PWR0101" H 3550 4200 50  0001 C CNN
F 1 "GND" H 3555 4277 50  0000 C CNN
F 2 "" H 3550 4450 50  0001 C CNN
F 3 "" H 3550 4450 50  0001 C CNN
	1    3550 4450
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0102
U 1 1 5F1D483B
P 3650 1450
F 0 "#PWR0102" H 3650 1300 50  0001 C CNN
F 1 "+BATT" H 3665 1623 50  0001 C CNN
F 2 "" H 3650 1450 50  0001 C CNN
F 3 "" H 3650 1450 50  0001 C CNN
	1    3650 1450
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0103
U 1 1 5F1D4C41
P 3550 1450
F 0 "#PWR0103" H 3550 1300 50  0001 C CNN
F 1 "+BATT" H 3565 1623 50  0000 C CNN
F 2 "" H 3550 1450 50  0001 C CNN
F 3 "" H 3550 1450 50  0001 C CNN
	1    3550 1450
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0104
U 1 1 5F1D4F57
P 1600 1950
F 0 "#PWR0104" H 1600 1800 50  0001 C CNN
F 1 "+BATT" H 1615 2123 50  0000 C CNN
F 2 "" H 1600 1950 50  0001 C CNN
F 3 "" H 1600 1950 50  0001 C CNN
	1    1600 1950
	0    1    1    0   
$EndComp
$Comp
L atmega168_tb2-rescue:Micro_SD_Card_Det-Connector J4
U 1 1 5F1D5A97
P 8350 2400
F 0 "J4" H 8300 3217 50  0000 C CNN
F 1 "Micro_SD_Card_Det" H 8300 3126 50  0000 C CNN
F 2 "MicroSD-HYC77-TF09-200:MicroSD-HYC77-TF09-200" H 10400 3100 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 8350 2500 50  0001 C CNN
	1    8350 2400
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0105
U 1 1 5F1D68C8
P 9150 2900
F 0 "#PWR0105" H 9150 2650 50  0001 C CNN
F 1 "GND" V 9155 2772 50  0000 R CNN
F 2 "" H 9150 2900 50  0001 C CNN
F 3 "" H 9150 2900 50  0001 C CNN
	1    9150 2900
	0    -1   -1   0   
$EndComp
$Comp
L atmega168_tb2-rescue:Crystal-Device Y1
U 1 1 5F1DD35C
P 5150 2400
F 0 "Y1" V 5104 2531 50  0000 L CNN
F 1 "32768 Hz" V 5195 2531 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_3215-2Pin_3.2x1.5mm" H 5150 2400 50  0001 C CNN
F 3 "~" H 5150 2400 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/diodes-incorporated/G83270022/G83270022CT-ND/6111477" V 5150 2400 50  0001 C CNN "Digikey"
	1    5150 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 2250 4950 2250
Wire Wire Line
	4950 2250 4950 2350
Wire Wire Line
	4950 2350 4150 2350
Wire Wire Line
	4150 2450 4900 2450
Wire Wire Line
	4900 2450 4900 2550
Wire Wire Line
	4900 2550 5150 2550
$Comp
L atmega168_tb2-rescue:C_Small-Device C2
U 1 1 5F1DDFF0
P 4900 2650
F 0 "C2" H 4992 2696 50  0000 L CNN
F 1 "5pF" H 4992 2605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4900 2650 50  0001 C CNN
F 3 "~" H 4900 2650 50  0001 C CNN
	1    4900 2650
	1    0    0    -1  
$EndComp
Connection ~ 4900 2550
Wire Wire Line
	5150 2250 5550 2250
Wire Wire Line
	5550 2250 5550 2550
Connection ~ 5150 2250
$Comp
L atmega168_tb2-rescue:C_Small-Device C5
U 1 1 5F1DEE70
P 5550 2650
F 0 "C5" H 5642 2696 50  0000 L CNN
F 1 "5pF" H 5642 2605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5550 2650 50  0001 C CNN
F 3 "~" H 5550 2650 50  0001 C CNN
	1    5550 2650
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0106
U 1 1 5F1DF1D9
P 5550 2750
F 0 "#PWR0106" H 5550 2500 50  0001 C CNN
F 1 "GND" H 5555 2577 50  0000 C CNN
F 2 "" H 5550 2750 50  0001 C CNN
F 3 "" H 5550 2750 50  0001 C CNN
	1    5550 2750
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0107
U 1 1 5F1DF5B0
P 4900 2750
F 0 "#PWR0107" H 4900 2500 50  0001 C CNN
F 1 "GND" H 4905 2577 50  0000 C CNN
F 2 "" H 4900 2750 50  0001 C CNN
F 3 "" H 4900 2750 50  0001 C CNN
	1    4900 2750
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0108
U 1 1 5F1DF898
P 4150 1950
F 0 "#PWR0108" H 4150 1700 50  0001 C CNN
F 1 "GND" V 4155 1822 50  0000 R CNN
F 2 "" H 4150 1950 50  0001 C CNN
F 3 "" H 4150 1950 50  0001 C CNN
	1    4150 1950
	0    -1   -1   0   
$EndComp
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0109
U 1 1 5F1E0230
P 6200 3650
F 0 "#PWR0109" H 6200 3500 50  0001 C CNN
F 1 "+BATT" H 6215 3823 50  0000 C CNN
F 2 "" H 6200 3650 50  0001 C CNN
F 3 "" H 6200 3650 50  0001 C CNN
	1    6200 3650
	1    0    0    -1  
$EndComp
Text GLabel 7450 2000 0    50   Input ~ 0
D2
Text GLabel 7450 2100 0    50   Input ~ 0
D3CS
Text GLabel 7450 2200 0    50   Input ~ 0
CMDDI
Text GLabel 7450 2300 0    50   Input ~ 0
CARD_VDD
$Comp
L atmega168_tb2-rescue:Q_PMOS_GSD-Device Q2
U 1 1 5F1E285C
P 6600 3750
F 0 "Q2" V 6942 3750 50  0000 C CNN
F 1 "P_FET" V 6851 3750 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6800 3850 50  0001 C CNN
F 3 "~" H 6600 3750 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/DMP2120U-7/DMP2120U-7DICT-ND/8275360/?itemSeq=333404697" V 6600 3750 50  0001 C CNN "Digikey"
	1    6600 3750
	0    1    -1   0   
$EndComp
Wire Wire Line
	6400 3650 6200 3650
Text GLabel 6800 3650 2    50   Input ~ 0
CARD_VDD
Text GLabel 7450 2400 0    50   Input ~ 0
CARDCLK
$Comp
L atmega168_tb2-rescue:GND-power #PWR0110
U 1 1 5F1E5CF5
P 7450 2500
F 0 "#PWR0110" H 7450 2250 50  0001 C CNN
F 1 "GND" V 7455 2372 50  0000 R CNN
F 2 "" H 7450 2500 50  0001 C CNN
F 3 "" H 7450 2500 50  0001 C CNN
	1    7450 2500
	0    1    1    0   
$EndComp
Text GLabel 7450 2600 0    50   Input ~ 0
CARDDAT0_DO
Text GLabel 7450 2700 0    50   Input ~ 0
CARDDAT1
Text GLabel 4150 3150 2    50   Input ~ 0
CMDDI
Text GLabel 4150 2950 2    50   Input ~ 0
D3CS
Text GLabel 4150 2850 2    50   Input ~ 0
D2
Text GLabel 4150 2750 2    50   Input ~ 0
CARDDAT1
Text GLabel 4150 2650 2    50   Input ~ 0
CARDDAT0_DO
Text GLabel 4150 3050 2    50   Input ~ 0
CARDCLK
Text GLabel 6600 3950 0    50   Input ~ 0
CARDPWR
Text GLabel 2950 3650 0    50   Input ~ 0
CARDPWR
Text GLabel 7450 2900 0    50   Input ~ 0
CARD_DET
Text GLabel 2950 3750 0    50   Input ~ 0
CARD_DET
$Comp
L atmega168_tb2-rescue:AVR-ISP-6-Connector J1
U 1 1 5F207105
P 1100 3300
F 0 "J1" H 771 3396 50  0000 R CNN
F 1 "AVR-ISP-6" H 1450 2950 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" V 850 3350 50  0001 C CNN
F 3 " ~" H -175 2750 50  0001 C CNN
	1    1100 3300
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0111
U 1 1 5F2076C1
P 1000 3700
F 0 "#PWR0111" H 1000 3450 50  0001 C CNN
F 1 "GND" H 1005 3527 50  0000 C CNN
F 2 "" H 1000 3700 50  0001 C CNN
F 3 "" H 1000 3700 50  0001 C CNN
	1    1000 3700
	1    0    0    -1  
$EndComp
Text GLabel 1500 3400 2    50   Input ~ 0
RST
Text GLabel 4150 3250 2    50   Input ~ 0
RST
Text GLabel 1500 3300 2    50   Input ~ 0
SCK
Text GLabel 4150 2250 2    50   Input ~ 0
SCK
Text GLabel 1500 3200 2    50   Input ~ 0
MOSI
Text GLabel 4150 2050 2    50   Input ~ 0
MOSI
Text GLabel 4150 2150 2    50   Input ~ 0
MISO
Text GLabel 1500 3100 2    50   Input ~ 0
MISO
$Comp
L atmega168_tb2-rescue:LP2985-3.0-Regulator_Linear U1
U 1 1 5F209147
P 1200 2050
F 0 "U1" H 1200 2392 50  0000 C CNN
F 1 "LP2985-3.0" H 1200 2301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 1200 2375 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp2985.pdf" H 1200 2050 50  0001 C CNN
	1    1200 2050
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0112
U 1 1 5F209AC4
P 1200 2350
F 0 "#PWR0112" H 1200 2100 50  0001 C CNN
F 1 "GND" H 1205 2177 50  0000 C CNN
F 2 "" H 1200 2350 50  0001 C CNN
F 3 "" H 1200 2350 50  0001 C CNN
	1    1200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  1950 800  2050
Wire Wire Line
	800  2050 800  2800
Wire Wire Line
	800  2800 850  2800
Connection ~ 800  2050
Text GLabel 5350 3700 1    50   Input ~ 0
RST
$Comp
L atmega168_tb2-rescue:C_Small-Device C4
U 1 1 5F212E37
P 5350 3800
F 0 "C4" H 5442 3846 50  0000 L CNN
F 1 "100n" H 5442 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5350 3800 50  0001 C CNN
F 3 "~" H 5350 3800 50  0001 C CNN
	1    5350 3800
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0113
U 1 1 5F2134AA
P 5350 3900
F 0 "#PWR0113" H 5350 3650 50  0001 C CNN
F 1 "GND" H 5355 3727 50  0000 C CNN
F 2 "" H 5350 3900 50  0001 C CNN
F 3 "" H 5350 3900 50  0001 C CNN
	1    5350 3900
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:C_Small-Device C3
U 1 1 5F2145C2
P 5000 3800
F 0 "C3" H 5092 3846 50  0000 L CNN
F 1 "100n" H 5092 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5000 3800 50  0001 C CNN
F 3 "~" H 5000 3800 50  0001 C CNN
	1    5000 3800
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0114
U 1 1 5F2149DF
P 5000 3700
F 0 "#PWR0114" H 5000 3550 50  0001 C CNN
F 1 "+BATT" H 5015 3873 50  0000 C CNN
F 2 "" H 5000 3700 50  0001 C CNN
F 3 "" H 5000 3700 50  0001 C CNN
	1    5000 3700
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:C_Small-Device C6
U 1 1 5F214E68
P 5750 3800
F 0 "C6" H 5842 3846 50  0000 L CNN
F 1 "100n" H 5842 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5750 3800 50  0001 C CNN
F 3 "~" H 5750 3800 50  0001 C CNN
	1    5750 3800
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0115
U 1 1 5F215340
P 5750 3700
F 0 "#PWR0115" H 5750 3550 50  0001 C CNN
F 1 "+BATT" H 5765 3873 50  0000 C CNN
F 2 "" H 5750 3700 50  0001 C CNN
F 3 "" H 5750 3700 50  0001 C CNN
	1    5750 3700
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0116
U 1 1 5F215811
P 5000 3900
F 0 "#PWR0116" H 5000 3650 50  0001 C CNN
F 1 "GND" H 5005 3727 50  0000 C CNN
F 2 "" H 5000 3900 50  0001 C CNN
F 3 "" H 5000 3900 50  0001 C CNN
	1    5000 3900
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0117
U 1 1 5F215C86
P 5750 3900
F 0 "#PWR0117" H 5750 3650 50  0001 C CNN
F 1 "GND" H 5755 3727 50  0000 C CNN
F 2 "" H 5750 3900 50  0001 C CNN
F 3 "" H 5750 3900 50  0001 C CNN
	1    5750 3900
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:C_Small-Device C7
U 1 1 5F21618B
P 7550 3700
F 0 "C7" H 7642 3746 50  0000 L CNN
F 1 "100n" H 7642 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7550 3700 50  0001 C CNN
F 3 "~" H 7550 3700 50  0001 C CNN
	1    7550 3700
	1    0    0    -1  
$EndComp
Text GLabel 7550 3600 2    50   Input ~ 0
CARD_VDD
$Comp
L atmega168_tb2-rescue:GND-power #PWR0118
U 1 1 5F2169DC
P 7550 3800
F 0 "#PWR0118" H 7550 3550 50  0001 C CNN
F 1 "GND" H 7555 3627 50  0000 C CNN
F 2 "" H 7550 3800 50  0001 C CNN
F 3 "" H 7550 3800 50  0001 C CNN
	1    7550 3800
	1    0    0    -1  
$EndComp
Text GLabel 7150 4350 0    50   Input ~ 0
CARDPWR
$Comp
L atmega168_tb2-rescue:R_Small-Device R1
U 1 1 5F2175BB
P 7150 4250
F 0 "R1" H 7209 4296 50  0000 L CNN
F 1 "10k" H 7209 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7150 4250 50  0001 C CNN
F 3 "~" H 7150 4250 50  0001 C CNN
	1    7150 4250
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0119
U 1 1 5F21AD24
P 7150 4150
F 0 "#PWR0119" H 7150 4000 50  0001 C CNN
F 1 "+BATT" H 7165 4323 50  0000 C CNN
F 2 "" H 7150 4150 50  0001 C CNN
F 3 "" H 7150 4150 50  0001 C CNN
	1    7150 4150
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:Conn_01x10-Connector_Generic J3
U 1 1 5F221146
P 6550 2400
F 0 "J3" H 6630 2392 50  0000 L CNN
F 1 "DBG_CARD" H 6630 2301 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical_SMD_Pin1Right" H 6550 2400 50  0001 C CNN
F 3 "~" H 6550 2400 50  0001 C CNN
	1    6550 2400
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0120
U 1 1 5F222CB0
P 6350 2900
F 0 "#PWR0120" H 6350 2650 50  0001 C CNN
F 1 "GND" H 6355 2727 50  0000 C CNN
F 2 "" H 6350 2900 50  0001 C CNN
F 3 "" H 6350 2900 50  0001 C CNN
	1    6350 2900
	1    0    0    -1  
$EndComp
Text GLabel 6350 2300 0    50   Input ~ 0
CMDDI
Text GLabel 6350 2500 0    50   Input ~ 0
D3CS
Text GLabel 6350 2600 0    50   Input ~ 0
D2
Text GLabel 6350 2700 0    50   Input ~ 0
CARDDAT1
Text GLabel 6350 2800 0    50   Input ~ 0
CARDDAT0_DO
Text GLabel 6350 2400 0    50   Input ~ 0
CARDCLK
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0121
U 1 1 5F22ABC2
P 6350 2000
F 0 "#PWR0121" H 6350 1850 50  0001 C CNN
F 1 "+BATT" V 6365 2127 50  0000 L CNN
F 2 "" H 6350 2000 50  0001 C CNN
F 3 "" H 6350 2000 50  0001 C CNN
	1    6350 2000
	0    -1   -1   0   
$EndComp
$Comp
L atmega168_tb2-rescue:+5V-power #PWR0122
U 1 1 5F22B725
P 850 2800
F 0 "#PWR0122" H 850 2650 50  0001 C CNN
F 1 "+5V" H 865 2973 50  0000 C CNN
F 2 "" H 850 2800 50  0001 C CNN
F 3 "" H 850 2800 50  0001 C CNN
	1    850  2800
	1    0    0    -1  
$EndComp
Connection ~ 850  2800
Wire Wire Line
	850  2800 1000 2800
$Comp
L atmega168_tb2-rescue:+5V-power #PWR0123
U 1 1 5F22BD41
P 6350 2100
F 0 "#PWR0123" H 6350 1950 50  0001 C CNN
F 1 "+5V" V 6365 2228 50  0000 L CNN
F 2 "" H 6350 2100 50  0001 C CNN
F 3 "" H 6350 2100 50  0001 C CNN
	1    6350 2100
	0    -1   -1   0   
$EndComp
Text GLabel 6350 2200 0    50   Input ~ 0
CARD_VDD
$Comp
L atmega168_tb2-rescue:Conn_01x08-Connector_Generic J2
U 1 1 5F2507D9
P 5200 4950
F 0 "J2" H 5280 4942 50  0000 L CNN
F 1 "WAVESHARE" H 5280 4851 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical_SMD_Pin1Left" H 5200 4950 50  0001 C CNN
F 3 "~" H 5200 4950 50  0001 C CNN
	1    5200 4950
	1    0    0    -1  
$EndComp
Text GLabel 5000 4650 0    50   Input ~ 0
P_BUSY
Text GLabel 5000 4750 0    50   Input ~ 0
PRST
Text GLabel 5000 4850 0    50   Input ~ 0
PDC
Text GLabel 5000 4950 0    50   Input ~ 0
PCS
Text GLabel 5000 5050 0    50   Input ~ 0
PCLK
Text GLabel 5000 5150 0    50   Input ~ 0
PDI
$Comp
L atmega168_tb2-rescue:GND-power #PWR0124
U 1 1 5F260FC1
P 5000 5250
F 0 "#PWR0124" H 5000 5000 50  0001 C CNN
F 1 "GND" V 5005 5122 50  0000 R CNN
F 2 "" H 5000 5250 50  0001 C CNN
F 3 "" H 5000 5250 50  0001 C CNN
	1    5000 5250
	0    1    1    0   
$EndComp
$Comp
L atmega168_tb2-rescue:Q_PMOS_GSD-Device Q1
U 1 1 5F261447
P 4100 5450
F 0 "Q1" V 4442 5450 50  0000 C CNN
F 1 "P_FET" V 4351 5450 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4300 5550 50  0001 C CNN
F 3 "~" H 4100 5450 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/DMP2120U-7/DMP2120U-7DICT-ND/8275360/?itemSeq=333404697" V 4100 5450 50  0001 C CNN "Digikey"
	1    4100 5450
	0    1    -1   0   
$EndComp
Text GLabel 5000 5350 0    50   Input ~ 0
PPWR
Text GLabel 4300 5350 2    50   Input ~ 0
PPWR
Text GLabel 4100 5650 0    50   Input ~ 0
PPWRCTRL
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0125
U 1 1 5F262E50
P 3900 5350
F 0 "#PWR0125" H 3900 5200 50  0001 C CNN
F 1 "+BATT" V 3915 5477 50  0000 L CNN
F 2 "" H 3900 5350 50  0001 C CNN
F 3 "" H 3900 5350 50  0001 C CNN
	1    3900 5350
	0    -1   -1   0   
$EndComp
Text GLabel 4150 3550 2    50   Input ~ 0
P_BUSY
Text GLabel 4150 3650 2    50   Input ~ 0
PRST
Text GLabel 4150 3750 2    50   Input ~ 0
PDC
Text GLabel 4150 3850 2    50   Input ~ 0
PCS
Text GLabel 4150 3950 2    50   Input ~ 0
PCLK
Text GLabel 4150 4050 2    50   Input ~ 0
PDI
Text GLabel 4150 4150 2    50   Input ~ 0
PPWRCTRL
$Comp
L atmega168_tb2-rescue:C_Small-Device C1
U 1 1 5F26D062
P 1900 4400
F 0 "C1" H 1992 4446 50  0000 L CNN
F 1 "100u" H 1992 4355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1900 4400 50  0001 C CNN
F 3 "~" H 1900 4400 50  0001 C CNN
	1    1900 4400
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0126
U 1 1 5F26D557
P 1900 4500
F 0 "#PWR0126" H 1900 4250 50  0001 C CNN
F 1 "GND" H 1905 4327 50  0000 C CNN
F 2 "" H 1900 4500 50  0001 C CNN
F 3 "" H 1900 4500 50  0001 C CNN
	1    1900 4500
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0127
U 1 1 5F26DAD5
P 1900 4300
F 0 "#PWR0127" H 1900 4150 50  0001 C CNN
F 1 "+BATT" H 1915 4473 50  0000 C CNN
F 2 "" H 1900 4300 50  0001 C CNN
F 3 "" H 1900 4300 50  0001 C CNN
	1    1900 4300
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:R_Small-Device R2
U 1 1 5F27AEF3
P 3050 5500
F 0 "R2" H 3109 5546 50  0000 L CNN
F 1 "10k" H 3109 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3050 5500 50  0001 C CNN
F 3 "~" H 3050 5500 50  0001 C CNN
	1    3050 5500
	1    0    0    -1  
$EndComp
Text GLabel 3050 5600 0    50   Input ~ 0
PPWRCTRL
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0128
U 1 1 5F27BFC3
P 3050 5400
F 0 "#PWR0128" H 3050 5250 50  0001 C CNN
F 1 "+BATT" V 3065 5527 50  0000 L CNN
F 2 "" H 3050 5400 50  0001 C CNN
F 3 "" H 3050 5400 50  0001 C CNN
	1    3050 5400
	0    -1   -1   0   
$EndComp
$Comp
L atmega168_tb2-rescue:Conn_01x02-Connector_Generic J5
U 1 1 5F287D5B
P 6300 4650
F 0 "J5" H 6380 4642 50  0000 L CNN
F 1 "BATT" H 6380 4551 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 6300 4650 50  0001 C CNN
F 3 "~" H 6300 4650 50  0001 C CNN
	1    6300 4650
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0129
U 1 1 5F288244
P 6100 4750
F 0 "#PWR0129" H 6100 4500 50  0001 C CNN
F 1 "GND" H 6105 4577 50  0000 C CNN
F 2 "" H 6100 4750 50  0001 C CNN
F 3 "" H 6100 4750 50  0001 C CNN
	1    6100 4750
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:+BATT-power #PWR0130
U 1 1 5F288895
P 6100 4650
F 0 "#PWR0130" H 6100 4500 50  0001 C CNN
F 1 "+BATT" V 6115 4777 50  0000 L CNN
F 2 "" H 6100 4650 50  0001 C CNN
F 3 "" H 6100 4650 50  0001 C CNN
	1    6100 4650
	0    -1   -1   0   
$EndComp
Text GLabel 4150 3450 2    50   Input ~ 0
RX
Text GLabel 2950 3450 0    50   Input ~ 0
PE0
Text GLabel 2950 3550 0    50   Input ~ 0
PE1
$Comp
L atmega168_tb2-rescue:Conn_01x01_Female-Connector J6
U 1 1 5F205323
P 5200 1200
F 0 "J6" H 5228 1226 50  0000 L CNN
F 1 "RX" H 5228 1135 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 5200 1200 50  0001 C CNN
F 3 "~" H 5200 1200 50  0001 C CNN
	1    5200 1200
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:Conn_01x01_Female-Connector J7
U 1 1 5F206AE0
P 5200 1400
F 0 "J7" H 5228 1426 50  0000 L CNN
F 1 "PE0" H 5228 1335 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 5200 1400 50  0001 C CNN
F 3 "~" H 5200 1400 50  0001 C CNN
	1    5200 1400
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:Conn_01x01_Female-Connector J8
U 1 1 5F2077A2
P 5200 1600
F 0 "J8" H 5228 1626 50  0000 L CNN
F 1 "PE1" H 5228 1535 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 5200 1600 50  0001 C CNN
F 3 "~" H 5200 1600 50  0001 C CNN
	1    5200 1600
	1    0    0    -1  
$EndComp
Text GLabel 5000 1400 0    50   Input ~ 0
PE0
Text GLabel 5000 1600 0    50   Input ~ 0
PE1
Text GLabel 5000 1200 0    50   Input ~ 0
RX
$Comp
L atmega168_tb2-rescue:Conn_01x01_Female-Connector J9
U 1 1 5F208BCE
P 5200 1800
F 0 "J9" H 5228 1826 50  0000 L CNN
F 1 "GND" H 5228 1735 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 5200 1800 50  0001 C CNN
F 3 "~" H 5200 1800 50  0001 C CNN
	1    5200 1800
	1    0    0    -1  
$EndComp
$Comp
L atmega168_tb2-rescue:GND-power #PWR0131
U 1 1 5F20BC57
P 5000 1800
F 0 "#PWR0131" H 5000 1550 50  0001 C CNN
F 1 "GND" H 5005 1627 50  0000 C CNN
F 2 "" H 5000 1800 50  0001 C CNN
F 3 "" H 5000 1800 50  0001 C CNN
	1    5000 1800
	0    1    1    0   
$EndComp
$EndSCHEMATC
