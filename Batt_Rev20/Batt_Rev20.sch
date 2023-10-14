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
Wire Wire Line
	9675 3350 9825 3350
Wire Wire Line
	8600 4625 8600 4825
$Comp
L Regulator_Linear:LT3040xMSE U5
U 1 1 641AA952
P 9275 3450
AR Path="/641AA952" Ref="U5"  Part="1" 
AR Path="/63F5E23E/641AA952" Ref="U?"  Part="1" 
F 0 "U5" H 9275 3817 50  0000 C CNN
F 1 "LT3040xMSE" H 9275 3726 50  0000 C CNN
F 2 "Package_SO:MSOP-12-1EP_3x4mm_P0.65mm_EP1.65x2.85mm_ThermalVias" H 9275 3775 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/3042fb.pdf" H 9275 3450 50  0001 C CNN
	1    9275 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R13
U 1 1 641AA959
P 8775 3450
AR Path="/641AA959" Ref="R13"  Part="1" 
AR Path="/63F5E23E/641AA959" Ref="R?"  Part="1" 
F 0 "R13" H 8850 3375 50  0000 L CNN
F 1 "200k" H 8850 3475 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8775 3450 50  0001 C CNN
F 3 "~" H 8775 3450 50  0001 C CNN
	1    8775 3450
	-1   0    0    1   
$EndComp
$Comp
L Reference_Voltage:LTC6655xHLS8-5 U3
U 1 1 641AA973
P 5875 3750
AR Path="/641AA973" Ref="U3"  Part="1" 
AR Path="/63F5E23E/641AA973" Ref="U?"  Part="1" 
F 0 "U3" H 5825 4100 50  0000 L CNN
F 1 "LTC6655xHLS8-5" H 5550 4025 50  0000 L CNN
F 2 "Package_Linear:LS8" H 5975 4100 50  0001 L CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6655-6655LN.pdf" H 5925 3400 50  0001 C CIN
	1    5875 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9825 3350 9825 3450
Wire Wire Line
	9675 3450 9825 3450
Wire Wire Line
	5475 3650 5475 3850
Connection ~ 5475 3850
Connection ~ 9825 3350
Wire Wire Line
	8250 3750 8550 3750
Wire Wire Line
	8825 3750 8825 3800
Connection ~ 8825 3750
Wire Wire Line
	8825 3750 8875 3750
Wire Wire Line
	9900 3550 9900 3625
Wire Wire Line
	9675 3550 9900 3550
Connection ~ 9825 3450
$Comp
L Device:R_Small_US R12
U 1 1 6193AE14
P 8650 3750
AR Path="/6193AE14" Ref="R12"  Part="1" 
AR Path="/63F5E23E/6193AE14" Ref="R?"  Part="1" 
F 0 "R12" V 8600 3500 50  0000 L CNN
F 1 "10k" V 8700 3525 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8650 3750 50  0001 C CNN
F 3 "~" H 8650 3750 50  0001 C CNN
	1    8650 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 3750 8825 3750
$Comp
L power:+VDC #PWR01
U 1 1 61F1F8B6
P 575 2275
F 0 "#PWR01" H 575 2175 50  0001 C CNN
F 1 "+VDC" H 575 2550 50  0000 C CNN
F 2 "" H 575 2275 50  0001 C CNN
F 3 "" H 575 2275 50  0001 C CNN
	1    575  2275
	1    0    0    -1  
$EndComp
Wire Wire Line
	6975 3850 6875 3850
$Comp
L Device:C_Small C7
U 1 1 62A3711F
P 6375 4050
AR Path="/62A3711F" Ref="C7"  Part="1" 
AR Path="/63F5E23E/62A3711F" Ref="C?"  Part="1" 
F 0 "C7" H 6100 4100 50  0000 L CNN
F 1 "4.7uF film" H 5900 4025 50  0000 L CNN
F 2 "Capacitor_SMD:C_1812_4532Metric" H 6375 4050 50  0001 C CNN
F 3 "~" H 6375 4050 50  0001 C CNN
	1    6375 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9675 3650 9675 3975
$Comp
L power:GND #PWR017
U 1 1 618DA553
P 9900 3975
F 0 "#PWR017" H 9900 3725 50  0001 C CNN
F 1 "GND" H 9905 3802 50  0000 C CNN
F 2 "" H 9900 3975 50  0001 C CNN
F 3 "" H 9900 3975 50  0001 C CNN
	1    9900 3975
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R11
U 1 1 62C31E38
P 8600 5050
AR Path="/62C31E38" Ref="R11"  Part="1" 
AR Path="/63F5E23E/62C31E38" Ref="R?"  Part="1" 
F 0 "R11" H 8675 5075 50  0000 L CNN
F 1 "22k" H 8675 5000 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8600 5050 50  0001 C CNN
F 3 "~" H 8600 5050 50  0001 C CNN
	1    8600 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8825 4000 8825 4075
Wire Wire Line
	8825 4075 8850 4075
$Comp
L Device:R_Small_US R10
U 1 1 62E86486
P 8600 4525
AR Path="/62E86486" Ref="R10"  Part="1" 
AR Path="/63F5E23E/62E86486" Ref="R?"  Part="1" 
F 0 "R10" H 8375 4500 50  0000 L CNN
F 1 "33k" H 8375 4575 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8600 4525 50  0001 C CNN
F 3 "~" H 8600 4525 50  0001 C CNN
	1    8600 4525
	-1   0    0    1   
$EndComp
Wire Wire Line
	8250 3750 8250 3650
Wire Wire Line
	8250 3650 8875 3650
$Comp
L power:+12V #PWR018
U 1 1 62102979
P 10625 3225
F 0 "#PWR018" H 10625 3075 50  0001 C CNN
F 1 "+12V" H 10640 3398 50  0000 C CNN
F 2 "" H 10625 3225 50  0001 C CNN
F 3 "" H 10625 3225 50  0001 C CNN
	1    10625 3225
	1    0    0    -1  
$EndComp
Text Notes 9650 4725 0    50   ~ 0
For 12V: R18 100R, R19 2k, R20 1.5k;\nFor 12.5V R18 1k, R19 2k, R20 2k
Wire Wire Line
	7175 4050 7175 4100
Wire Wire Line
	8600 5150 8600 5275
Connection ~ 8600 4825
Wire Wire Line
	8600 4825 8600 4950
$Comp
L Device:R_Small_US R8
U 1 1 62756ECC
P 8325 4525
AR Path="/62756ECC" Ref="R8"  Part="1" 
AR Path="/63F5E23E/62756ECC" Ref="R?"  Part="1" 
F 0 "R8" H 8150 4475 50  0000 L CNN
F 1 "trim" H 8100 4550 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 8325 4525 50  0001 C CNN
F 3 "~" H 8325 4525 50  0001 C CNN
	1    8325 4525
	-1   0    0    1   
$EndComp
Wire Wire Line
	8325 4825 8325 4625
Wire Wire Line
	8325 4200 8600 4200
Connection ~ 8325 4825
Wire Wire Line
	8325 4825 8600 4825
Wire Wire Line
	8325 4425 8325 4200
$Comp
L Device:R_Small_US R9
U 1 1 6278C2AC
P 8325 5050
AR Path="/6278C2AC" Ref="R9"  Part="1" 
AR Path="/63F5E23E/6278C2AC" Ref="R?"  Part="1" 
F 0 "R9" H 8425 5025 50  0000 L CNN
F 1 "trim" H 8425 5100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 8325 5050 50  0001 C CNN
F 3 "~" H 8325 5050 50  0001 C CNN
	1    8325 5050
	-1   0    0    1   
$EndComp
Wire Wire Line
	8325 4825 8325 4950
Wire Wire Line
	8325 5275 8600 5275
$Comp
L power:GND #PWR014
U 1 1 627E201E
P 7175 4100
F 0 "#PWR014" H 7175 3850 50  0001 C CNN
F 1 "GND" H 7180 3927 50  0000 C CNN
F 2 "" H 7175 4100 50  0001 C CNN
F 3 "" H 7175 4100 50  0001 C CNN
	1    7175 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9675 3975 9825 3975
Connection ~ 9900 3975
Wire Wire Line
	10625 3225 10625 3350
Connection ~ 8600 4200
Wire Wire Line
	8325 5150 8325 5275
$Comp
L power:GND #PWR016
U 1 1 62B97D0D
P 8600 5375
F 0 "#PWR016" H 8600 5125 50  0001 C CNN
F 1 "GND" H 8605 5202 50  0000 C CNN
F 2 "" H 8600 5375 50  0001 C CNN
F 3 "" H 8600 5375 50  0001 C CNN
	1    8600 5375
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5275 8600 5375
Connection ~ 8600 5275
Wire Wire Line
	6275 3650 6375 3650
Wire Wire Line
	6375 4150 6375 4200
Connection ~ 6375 3650
Text Label 10625 4200 2    50   ~ 0
+12VSense
Wire Wire Line
	9050 4075 9275 4075
$Comp
L Device:R_Small_US R14
U 1 1 62E69149
P 8825 3900
AR Path="/62E69149" Ref="R14"  Part="1" 
AR Path="/63F5E23E/62E69149" Ref="R?"  Part="1" 
F 0 "R14" H 8900 3900 50  0000 L CNN
F 1 "2R" H 8900 3975 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8825 3900 50  0001 C CNN
F 3 "~" H 8825 3900 50  0001 C CNN
	1    8825 3900
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C10
U 1 1 62F8419E
P 6800 2450
AR Path="/62F8419E" Ref="C10"  Part="1" 
AR Path="/63F5E23E/62F8419E" Ref="C?"  Part="1" 
F 0 "C10" H 6575 2400 50  0000 L CNN
F 1 "0.1uF" H 6500 2500 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6800 2450 50  0001 C CNN
F 3 "~" H 6800 2450 50  0001 C CNN
	1    6800 2450
	-1   0    0    1   
$EndComp
$Comp
L power:+15V #PWR012
U 1 1 62F841A4
P 6025 2225
AR Path="/62F841A4" Ref="#PWR012"  Part="1" 
AR Path="/63F5E23E/62F841A4" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H 6025 2075 50  0001 C CNN
F 1 "+15V" H 6040 2398 50  0000 C CNN
F 2 "" H 6025 2225 50  0001 C CNN
F 3 "" H 6025 2225 50  0001 C CNN
	1    6025 2225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 62F841AA
P 6800 2625
F 0 "#PWR013" H 6800 2375 50  0001 C CNN
F 1 "GND" H 6805 2452 50  0000 C CNN
F 2 "" H 6800 2625 50  0001 C CNN
F 3 "" H 6800 2625 50  0001 C CNN
	1    6800 2625
	1    0    0    -1  
$EndComp
Wire Wire Line
	6375 3650 6375 3950
Wire Wire Line
	6375 3650 6400 3650
Connection ~ 8250 3750
Wire Wire Line
	6875 3850 6875 4825
$Comp
L power:GND #PWR015
U 1 1 6308709E
P 8425 3200
F 0 "#PWR015" H 8425 2950 50  0001 C CNN
F 1 "GND" H 8430 3027 50  0000 C CNN
F 2 "" H 8425 3200 50  0001 C CNN
F 3 "" H 8425 3200 50  0001 C CNN
	1    8425 3200
	1    0    0    -1  
$EndComp
Connection ~ 7750 4825
Wire Wire Line
	7750 4825 8100 4825
$Comp
L Device:C_Small C11
U 1 1 6319EC7E
P 7750 4400
AR Path="/6319EC7E" Ref="C11"  Part="1" 
AR Path="/63F5E23E/6319EC7E" Ref="C?"  Part="1" 
F 0 "C11" H 7875 4375 50  0000 L CNN
F 1 "0.1uF" H 7850 4475 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7750 4400 50  0001 C CNN
F 3 "~" H 7750 4400 50  0001 C CNN
	1    7750 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 4500 7750 4825
$Comp
L Device:R_Small_US R15
U 1 1 632D7F7B
P 10625 3875
AR Path="/632D7F7B" Ref="R15"  Part="1" 
AR Path="/63F5E23E/632D7F7B" Ref="R?"  Part="1" 
F 0 "R15" H 10425 3850 50  0000 L CNN
F 1 "0R01" H 10375 3925 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" H 10625 3875 50  0001 C CNN
F 3 "~" H 10625 3875 50  0001 C CNN
	1    10625 3875
	-1   0    0    1   
$EndComp
Wire Wire Line
	10625 3350 10625 3775
Wire Wire Line
	10625 3975 10625 4200
Connection ~ 10625 3350
$Comp
L Device:RF_Shield_One_Piece J2
U 1 1 635D1DD8
P 3975 1225
F 0 "J2" H 4605 1214 50  0000 L CNN
F 1 "RF_Shield_One_Piece" H 4605 1123 50  0000 L CNN
F 2 "RF_Shielding:Laird_Technologies_BMI-S-210-F_44.00x30.50mm" H 3975 1125 50  0001 C CNN
F 3 "~" H 3975 1125 50  0001 C CNN
	1    3975 1225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 635D2723
P 3975 1625
F 0 "#PWR09" H 3975 1375 50  0001 C CNN
F 1 "GND" H 3980 1452 50  0000 C CNN
F 2 "" H 3975 1625 50  0001 C CNN
F 3 "" H 3975 1625 50  0001 C CNN
	1    3975 1625
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 6367CE18
P 6375 3200
F 0 "TP2" H 6433 3318 50  0000 L CNN
F 1 "TestPoint" H 6433 3227 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 6575 3200 50  0001 C CNN
F 3 "~" H 6575 3200 50  0001 C CNN
	1    6375 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6375 3200 6375 3650
$Comp
L Connector:TestPoint TP1
U 1 1 636BEF97
P 725 3150
F 0 "TP1" V 650 3075 50  0000 L CNN
F 1 "TestPoint" V 825 2975 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 925 3150 50  0001 C CNN
F 3 "~" H 925 3150 50  0001 C CNN
	1    725  3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 636BF5E2
P 725 3250
F 0 "#PWR02" H 725 3000 50  0001 C CNN
F 1 "GND" H 730 3077 50  0000 C CNN
F 2 "" H 725 3250 50  0001 C CNN
F 3 "" H 725 3250 50  0001 C CNN
	1    725  3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	725  3150 725  3250
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J1
U 1 1 61C0A200
P 1550 1275
F 0 "J1" H 1600 1750 50  0000 C CNN
F 1 "B2B Conn" H 1600 1650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 1550 1275 50  0001 C CNN
F 3 "~" H 1550 1275 50  0001 C CNN
	1    1550 1275
	1    0    0    -1  
$EndComp
$Comp
L power:+VDC #PWR03
U 1 1 61C0B0DB
P 1125 1050
F 0 "#PWR03" H 1125 950 50  0001 C CNN
F 1 "+VDC" H 1125 1325 50  0000 C CNN
F 2 "" H 1125 1050 50  0001 C CNN
F 3 "" H 1125 1050 50  0001 C CNN
	1    1125 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1075 1125 1075
Wire Wire Line
	1125 1075 1125 1050
Wire Wire Line
	1350 1175 1125 1175
Wire Wire Line
	1125 1175 1125 1075
Connection ~ 1125 1075
Wire Wire Line
	1350 1275 1125 1275
Wire Wire Line
	1125 1275 1125 1375
Wire Wire Line
	1125 1375 1350 1375
$Comp
L power:GND #PWR04
U 1 1 61C3DC40
P 1125 1375
F 0 "#PWR04" H 1125 1125 50  0001 C CNN
F 1 "GND" H 1130 1202 50  0000 C CNN
F 2 "" H 1125 1375 50  0001 C CNN
F 3 "" H 1125 1375 50  0001 C CNN
	1    1125 1375
	1    0    0    -1  
$EndComp
Connection ~ 1125 1375
Wire Wire Line
	1850 1375 2275 1375
Wire Wire Line
	2275 1375 2275 1275
Wire Wire Line
	2275 1275 1850 1275
Wire Wire Line
	1850 1175 2025 1175
Wire Wire Line
	2025 1175 2025 1075
Wire Wire Line
	2025 1075 1850 1075
$Comp
L power:+15V #PWR08
U 1 1 61C85354
P 2275 1275
AR Path="/61C85354" Ref="#PWR08"  Part="1" 
AR Path="/63F5E23E/61C85354" Ref="#PWR?"  Part="1" 
F 0 "#PWR08" H 2275 1125 50  0001 C CNN
F 1 "+15V" H 2290 1448 50  0000 C CNN
F 2 "" H 2275 1275 50  0001 C CNN
F 3 "" H 2275 1275 50  0001 C CNN
	1    2275 1275
	1    0    0    -1  
$EndComp
Connection ~ 2275 1275
$Comp
L power:+12V #PWR07
U 1 1 61C8572E
P 2025 1075
F 0 "#PWR07" H 2025 925 50  0001 C CNN
F 1 "+12V" H 2040 1248 50  0000 C CNN
F 2 "" H 2025 1075 50  0001 C CNN
F 3 "" H 2025 1075 50  0001 C CNN
	1    2025 1075
	1    0    0    -1  
$EndComp
Connection ~ 2025 1075
Wire Wire Line
	6800 2275 6800 2350
Wire Wire Line
	6800 2550 6800 2575
Wire Wire Line
	6025 2225 6025 2275
Wire Wire Line
	6425 2575 6800 2575
Wire Wire Line
	6425 2550 6425 2575
Connection ~ 6800 2575
Wire Wire Line
	6800 2575 6800 2625
Wire Wire Line
	6425 2275 6425 2350
Connection ~ 6425 2275
Wire Wire Line
	6425 2275 6800 2275
Wire Wire Line
	7750 4300 7750 3750
Connection ~ 7750 3750
Wire Wire Line
	7750 3750 8100 3750
Wire Wire Line
	6800 2275 7175 2275
Connection ~ 6800 2275
Wire Wire Line
	7725 2875 7725 3350
$Comp
L Device:CP1_Small C13
U 1 1 621327FF
P 8425 3075
F 0 "C13" H 8700 3075 50  0000 R CNN
F 1 "10uF Ta-Poly" H 9000 3000 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-7343-31_Kemet-D" H 8425 3075 50  0001 C CNN
F 3 "~" H 8425 3075 50  0001 C CNN
	1    8425 3075
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R7
U 1 1 62132FC2
P 8125 2875
AR Path="/62132FC2" Ref="R7"  Part="1" 
AR Path="/63F5E23E/62132FC2" Ref="R?"  Part="1" 
F 0 "R7" V 7925 2825 50  0000 L CNN
F 1 "0R5" V 8025 2825 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" H 8125 2875 50  0001 C CNN
F 3 "~" H 8125 2875 50  0001 C CNN
	1    8125 2875
	0    1    1    0   
$EndComp
Wire Wire Line
	8775 2875 8775 3350
Wire Wire Line
	8225 2875 8425 2875
Wire Wire Line
	8775 3350 8875 3350
Wire Wire Line
	8425 2875 8425 2975
Connection ~ 8425 2875
Wire Wire Line
	8425 2875 8775 2875
Connection ~ 8775 3350
Wire Wire Line
	8775 3550 8875 3550
Wire Wire Line
	8875 3450 8875 3350
Connection ~ 8875 3350
Wire Wire Line
	8100 4825 8100 4500
Wire Wire Line
	8100 4300 8100 3750
Connection ~ 8100 4825
Wire Wire Line
	8100 4825 8325 4825
Connection ~ 8100 3750
Wire Wire Line
	8100 3750 8250 3750
$Comp
L Device:CP1_Small C12
U 1 1 61B0C683
P 8100 4400
F 0 "C12" H 7975 4450 50  0000 R CNN
F 1 "22uF" H 8000 4350 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-7343-30_AVX-N" H 8100 4400 50  0001 C CNN
F 3 "~" H 8100 4400 50  0001 C CNN
	1    8100 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 61B440A7
P 8950 4075
AR Path="/61B440A7" Ref="C14"  Part="1" 
AR Path="/63F5E23E/61B440A7" Ref="C?"  Part="1" 
F 0 "C14" V 9075 3925 50  0000 L CNN
F 1 "1uF" V 9000 3875 50  0000 L CNN
F 2 "Capacitor_SMD:C_2220_5650Metric" H 8950 4075 50  0001 C CNN
F 3 "~" H 8950 4075 50  0001 C CNN
	1    8950 4075
	0    -1   -1   0   
$EndComp
$Comp
L Amplifier_Operational:ADA4522-1 U4
U 1 1 61BB47A3
P 7275 3750
F 0 "U4" H 7200 4050 50  0000 L CNN
F 1 "ADA4522-1" H 7200 3950 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7275 3750 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/ADA4522-1_4522-2_4522-4.pdf" H 7275 3950 50  0001 C CNN
	1    7275 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7175 2275 7175 3450
$Comp
L Device:CP1_Small C8
U 1 1 61C1C467
P 6425 2450
F 0 "C8" H 6350 2500 50  0000 R CNN
F 1 "4.7uF" H 6350 2425 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-10_Kemet-I" H 6425 2450 50  0001 C CNN
F 3 "~" H 6425 2450 50  0001 C CNN
	1    6425 2450
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LT3045xMSE U1
U 1 1 61C16825
P 2875 3450
F 0 "U1" H 2875 3817 50  0000 C CNN
F 1 "LT3045xMSE" H 2875 3726 50  0000 C CNN
F 2 "Package_SO:MSOP-12-1EP_3x4mm_P0.65mm_EP1.65x2.85mm_ThermalVias" H 2875 3775 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/3045fa.pdf" H 2875 3450 50  0001 C CNN
	1    2875 3450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2SC1945 Q2
U 1 1 61C19684
P 1800 3000
F 0 "Q2" H 1992 3046 50  0000 L CNN
F 1 "2SCR586D3TL1" H 1992 2955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 2000 2925 50  0001 L CIN
F 3 "http://rtellason.com/transdata/2sc1945.pdf" H 1800 3000 50  0001 L CNN
	1    1800 3000
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:MMBF4392 Q1
U 1 1 61C1D228
P 1475 2525
F 0 "Q1" H 1666 2571 50  0000 L CNN
F 1 "MMBF4392" H 1666 2480 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1675 2450 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MMBF4391LT1-D.PDF" H 1475 2525 50  0001 L CNN
	1    1475 2525
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1375 2275 1375 2325
Wire Wire Line
	1675 2525 2100 2525
Wire Wire Line
	3325 2525 3325 3350
Wire Wire Line
	3325 3350 3275 3350
$Comp
L Device:CP1_Small C1
U 1 1 61C42832
P 1375 3150
F 0 "C1" H 1466 3196 50  0000 L CNN
F 1 "4.7uF" H 1466 3105 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-12_Kemet-T" H 1375 3150 50  0001 C CNN
F 3 "~" H 1375 3150 50  0001 C CNN
	1    1375 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1375 2725 1375 3000
Wire Wire Line
	1375 3000 1600 3000
Wire Wire Line
	1375 3000 1375 3050
Connection ~ 1375 3000
Wire Wire Line
	1900 2800 1900 2275
Wire Wire Line
	1900 2275 1375 2275
Connection ~ 1375 2275
Wire Wire Line
	1900 3200 1900 3350
Wire Wire Line
	2475 3350 2350 3350
Connection ~ 1900 3350
Wire Wire Line
	1900 3350 1900 3975
$Comp
L Device:R_US R1
U 1 1 61C75E8E
P 2250 2525
F 0 "R1" V 2045 2525 50  0000 C CNN
F 1 "100R" V 2136 2525 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2290 2515 50  0001 C CNN
F 3 "~" H 2250 2525 50  0001 C CNN
	1    2250 2525
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 2525 3325 2525
$Comp
L Device:R_US R3
U 1 1 61C768C9
P 2825 4075
F 0 "R3" H 2975 4025 50  0000 R CNN
F 1 "150k" H 3075 4100 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2865 4065 50  0001 C CNN
F 3 "~" H 2825 4075 50  0001 C CNN
	1    2825 4075
	-1   0    0    1   
$EndComp
$Comp
L Device:CP1_Small C3
U 1 1 61C77468
P 2500 4025
F 0 "C3" H 2325 4050 50  0000 L CNN
F 1 "22uF" H 2225 3975 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-7343-31_Kemet-D" H 2500 4025 50  0001 C CNN
F 3 "~" H 2500 4025 50  0001 C CNN
	1    2500 4025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 61C77B91
P 1375 3250
F 0 "#PWR05" H 1375 3000 50  0001 C CNN
F 1 "GND" H 1380 3077 50  0000 C CNN
F 2 "" H 1375 3250 50  0001 C CNN
F 3 "" H 1375 3250 50  0001 C CNN
	1    1375 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2475 3450 2350 3450
Wire Wire Line
	2350 3450 2350 3350
Connection ~ 2350 3350
Wire Wire Line
	2350 3350 2250 3350
Wire Wire Line
	2825 3850 2825 3875
Wire Wire Line
	2825 3875 2500 3875
Wire Wire Line
	2500 3875 2500 3925
Wire Wire Line
	2500 4350 2825 4350
Wire Wire Line
	2825 4350 2825 4225
Wire Wire Line
	2500 4125 2500 4350
Connection ~ 2825 3875
Wire Wire Line
	2825 3875 2825 3925
Wire Wire Line
	2925 3850 2925 4150
Wire Wire Line
	2925 4350 2825 4350
Connection ~ 2825 4350
$Comp
L Device:R_Small_US R2
U 1 1 61CF4316
P 2250 3450
AR Path="/61CF4316" Ref="R2"  Part="1" 
AR Path="/63F5E23E/61CF4316" Ref="R?"  Part="1" 
F 0 "R2" H 2075 3475 50  0000 L CNN
F 1 "200k" H 2000 3400 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2250 3450 50  0001 C CNN
F 3 "~" H 2250 3450 50  0001 C CNN
	1    2250 3450
	1    0    0    -1  
$EndComp
Connection ~ 2250 3350
Wire Wire Line
	2250 3350 1900 3350
Wire Wire Line
	2250 3550 2475 3550
Wire Wire Line
	1900 4175 1900 4350
Wire Wire Line
	1900 4350 2175 4350
Connection ~ 2500 4350
Wire Wire Line
	2475 3650 2175 3650
Wire Wire Line
	2175 3650 2175 4350
Connection ~ 2175 4350
Wire Wire Line
	2175 4350 2500 4350
$Comp
L Device:R_Small_US R5
U 1 1 61D26240
P 3900 3950
AR Path="/61D26240" Ref="R5"  Part="1" 
AR Path="/63F5E23E/61D26240" Ref="R?"  Part="1" 
F 0 "R5" H 3950 3975 50  0000 L CNN
F 1 "10k" H 3950 3900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3900 3950 50  0001 C CNN
F 3 "~" H 3900 3950 50  0001 C CNN
	1    3900 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R4
U 1 1 61D26CB2
P 3900 3550
AR Path="/61D26CB2" Ref="R4"  Part="1" 
AR Path="/63F5E23E/61D26CB2" Ref="R?"  Part="1" 
F 0 "R4" H 3975 3600 50  0000 L CNN
F 1 "470k" H 3950 3500 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3900 3550 50  0001 C CNN
F 3 "~" H 3900 3550 50  0001 C CNN
	1    3900 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3325 3350 3650 3350
Connection ~ 3325 3350
$Comp
L Device:CP1_Small C4
U 1 1 61D7261F
P 3650 3450
F 0 "C4" H 3600 3725 50  0000 L CNN
F 1 "10uF Tant/Poly" H 3375 3625 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-7343-31_Kemet-D" H 3650 3450 50  0001 C CNN
F 3 "~" H 3650 3450 50  0001 C CNN
	1    3650 3450
	1    0    0    -1  
$EndComp
Connection ~ 3650 3350
Wire Wire Line
	3650 3350 3900 3350
Wire Wire Line
	3275 3450 3400 3450
Wire Wire Line
	3400 3450 3650 3350
Wire Wire Line
	3275 3550 3275 3750
Wire Wire Line
	3275 3750 3900 3750
Wire Wire Line
	3900 3750 3900 3850
Wire Wire Line
	3900 4150 3650 4150
Wire Wire Line
	3900 4050 3900 4150
Connection ~ 3900 3750
Connection ~ 2925 4150
Wire Wire Line
	2925 4150 2925 4350
Wire Wire Line
	3650 3550 3650 4150
Connection ~ 3650 4150
Wire Wire Line
	3650 4150 2925 4150
Wire Wire Line
	3900 3350 4125 3350
Connection ~ 3900 3350
Connection ~ 4350 3350
Wire Wire Line
	3900 3350 3900 3450
Wire Wire Line
	3900 3650 3900 3750
Wire Wire Line
	6025 2275 6425 2275
Wire Wire Line
	5875 4200 5300 4200
Wire Wire Line
	5875 4050 5875 4200
$Comp
L Device:C_Small C6
U 1 1 61F0A893
P 5300 4000
AR Path="/61F0A893" Ref="C6"  Part="1" 
AR Path="/63F5E23E/61F0A893" Ref="C?"  Part="1" 
F 0 "C6" H 5400 3975 50  0000 L CNN
F 1 "0.1uF" H 5350 4075 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5300 4000 50  0001 C CNN
F 3 "~" H 5300 4000 50  0001 C CNN
	1    5300 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5300 3900 5300 3850
Connection ~ 5300 3850
Wire Wire Line
	5300 3850 5475 3850
Wire Wire Line
	8600 4200 10625 4200
Wire Wire Line
	6275 3850 6375 3650
$Comp
L Device:R_US R6
U 1 1 61F730FB
P 6550 3650
F 0 "R6" V 6345 3650 50  0000 C CNN
F 1 "20k" V 6436 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6590 3640 50  0001 C CNN
F 3 "~" H 6550 3650 50  0001 C CNN
	1    6550 3650
	0    1    1    0   
$EndComp
$Comp
L Device:CP1_Small C9
U 1 1 61F73E98
P 6750 4050
F 0 "C9" H 6625 4100 50  0000 R CNN
F 1 "22uF" H 6650 4000 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-7343-30_AVX-N" H 6750 4050 50  0001 C CNN
F 3 "~" H 6750 4050 50  0001 C CNN
	1    6750 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3650 6750 3950
Wire Wire Line
	6750 4200 6375 4200
Wire Wire Line
	6700 3650 6750 3650
Wire Wire Line
	6750 4150 6750 4200
Connection ~ 6750 3650
Wire Wire Line
	6750 3650 6975 3650
Connection ~ 6375 4200
Wire Wire Line
	8425 3175 8425 3200
Wire Wire Line
	7725 2875 8025 2875
Wire Wire Line
	2250 3550 1450 3550
Connection ~ 2250 3550
Text Label 1450 3550 0    50   ~ 0
PG
$Comp
L Device:C_Small C2
U 1 1 61FD4B42
P 1900 4075
AR Path="/61FD4B42" Ref="C2"  Part="1" 
AR Path="/63F5E23E/61FD4B42" Ref="C?"  Part="1" 
F 0 "C2" H 2025 4050 50  0000 L CNN
F 1 "10uF/50V X7R" H 2000 4150 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 1900 4075 50  0001 C CNN
F 3 "~" H 1900 4075 50  0001 C CNN
	1    1900 4075
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 61FD80EB
P 1900 4350
F 0 "#PWR06" H 1900 4100 50  0001 C CNN
F 1 "GND" H 1905 4177 50  0000 C CNN
F 2 "" H 1900 4350 50  0001 C CNN
F 3 "" H 1900 4350 50  0001 C CNN
	1    1900 4350
	1    0    0    -1  
$EndComp
Connection ~ 1900 4350
$Comp
L Mechanical:MountingHole H1
U 1 1 6207B854
P 8925 1250
F 0 "H1" H 9025 1296 50  0000 L CNN
F 1 "MountingHole" H 9025 1205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 8925 1250 50  0001 C CNN
F 3 "~" H 8925 1250 50  0001 C CNN
	1    8925 1250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6207BE70
P 8925 1475
F 0 "H2" H 9025 1521 50  0000 L CNN
F 1 "MountingHole" H 9025 1430 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 8925 1475 50  0001 C CNN
F 3 "~" H 8925 1475 50  0001 C CNN
	1    8925 1475
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6207C1F7
P 8925 1675
F 0 "H3" H 9025 1721 50  0000 L CNN
F 1 "MountingHole" H 9025 1630 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 8925 1675 50  0001 C CNN
F 3 "~" H 8925 1675 50  0001 C CNN
	1    8925 1675
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 6207C505
P 8925 1875
F 0 "H4" H 9025 1921 50  0000 L CNN
F 1 "MountingHole" H 9025 1830 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 8925 1875 50  0001 C CNN
F 3 "~" H 8925 1875 50  0001 C CNN
	1    8925 1875
	1    0    0    -1  
$EndComp
$Comp
L power:+15V #PWR010
U 1 1 6209C486
P 4125 3250
AR Path="/6209C486" Ref="#PWR010"  Part="1" 
AR Path="/63F5E23E/6209C486" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 4125 3100 50  0001 C CNN
F 1 "+15V" H 4140 3423 50  0000 C CNN
F 2 "" H 4125 3250 50  0001 C CNN
F 3 "" H 4125 3250 50  0001 C CNN
	1    4125 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4125 3250 4125 3350
Connection ~ 4125 3350
Wire Wire Line
	4125 3350 4350 3350
Connection ~ 9825 3975
Wire Wire Line
	9825 3975 9900 3975
Wire Wire Line
	9275 4075 9275 3975
Wire Wire Line
	575  2275 1375 2275
Wire Wire Line
	7575 3750 7750 3750
Wire Wire Line
	9825 3350 10625 3350
Wire Wire Line
	6875 4825 7750 4825
Wire Wire Line
	1850 1475 2275 1475
Text Label 2275 1475 2    50   ~ 0
PG
Wire Wire Line
	8600 4200 8600 4425
Wire Wire Line
	4350 3350 7725 3350
$Comp
L Regulator_Linear:L78L09_SOT89 U2
U 1 1 6219538C
P 4800 3850
F 0 "U2" H 4800 4092 50  0000 C CNN
F 1 "L78L09_SOT89" H 4800 4001 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-89-3" H 4800 4050 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 4800 3800 50  0001 C CNN
	1    4800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3850 4500 3850
Wire Wire Line
	4350 3350 4350 3850
Wire Wire Line
	5100 3850 5300 3850
$Comp
L power:GND #PWR011
U 1 1 621A582D
P 4800 4225
F 0 "#PWR011" H 4800 3975 50  0001 C CNN
F 1 "GND" H 4805 4052 50  0000 C CNN
F 2 "" H 4800 4225 50  0001 C CNN
F 3 "" H 4800 4225 50  0001 C CNN
	1    4800 4225
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C5
U 1 1 621A5E71
P 4350 3950
F 0 "C5" H 4475 4100 50  0000 R CNN
F 1 "4.7uF" H 4600 4025 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-10_Kemet-I" H 4350 3950 50  0001 C CNN
F 3 "~" H 4350 3950 50  0001 C CNN
	1    4350 3950
	-1   0    0    -1  
$EndComp
Connection ~ 4350 3850
Wire Wire Line
	4350 4050 4350 4200
Wire Wire Line
	4350 4200 4800 4200
Wire Wire Line
	4800 4200 4800 4150
Wire Wire Line
	4800 4200 4800 4225
Connection ~ 4800 4200
Wire Wire Line
	4800 4200 5300 4200
Connection ~ 5300 4200
Wire Wire Line
	5300 4200 5300 4100
Wire Wire Line
	5875 4200 6375 4200
Connection ~ 5875 4200
Wire Wire Line
	9675 3975 9275 3975
Connection ~ 9675 3975
Connection ~ 9275 3975
Wire Wire Line
	9275 3975 9275 3950
$Comp
L Device:CP1_Small_Kelvin C15
U 1 1 63E4339C
P 9900 3725
F 0 "C15" H 9809 3771 50  0000 R CNN
F 1 "10uF Ta-Poly" H 9809 3680 50  0000 R CNN
F 2 "" H 9900 3725 50  0001 C CNN
F 3 "~" H 9900 3725 50  0001 C CNN
	1    9900 3725
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9825 3450 9825 3625
Wire Wire Line
	9900 3825 9900 3975
Wire Wire Line
	9825 3825 9825 3975
$EndSCHEMATC
