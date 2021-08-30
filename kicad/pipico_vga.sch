EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "2021-02-12"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+3V3 #PWR05
U 1 1 602B260E
P 4950 1450
F 0 "#PWR05" H 4950 1300 50  0001 C CNN
F 1 "+3V3" H 4965 1623 50  0000 C CNN
F 2 "" H 4950 1450 50  0001 C CNN
F 3 "" H 4950 1450 50  0001 C CNN
	1    4950 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 602B7049
P 5300 1600
F 0 "C1" H 5415 1646 50  0000 L CNN
F 1 "100n" H 5415 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5338 1450 50  0001 C CNN
F 3 "~" H 5300 1600 50  0001 C CNN
	1    5300 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 602B84F6
P 5700 1600
F 0 "C2" H 5815 1646 50  0000 L CNN
F 1 "100n" H 5815 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5738 1450 50  0001 C CNN
F 3 "~" H 5700 1600 50  0001 C CNN
	1    5700 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 602BC665
P 6100 1600
F 0 "C3" H 6215 1646 50  0000 L CNN
F 1 "100n" H 6215 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6138 1450 50  0001 C CNN
F 3 "~" H 6100 1600 50  0001 C CNN
	1    6100 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 602C07DA
P 6500 1600
F 0 "C4" H 6615 1646 50  0000 L CNN
F 1 "100n" H 6615 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6538 1450 50  0001 C CNN
F 3 "~" H 6500 1600 50  0001 C CNN
	1    6500 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1450 5300 1450
Connection ~ 5300 1450
Wire Wire Line
	5300 1450 5700 1450
Connection ~ 5700 1450
Wire Wire Line
	5700 1450 6100 1450
Connection ~ 6100 1450
Wire Wire Line
	6100 1450 6500 1450
Wire Wire Line
	5300 1750 5700 1750
Connection ~ 5700 1750
Wire Wire Line
	5700 1750 6100 1750
Connection ~ 6100 1750
Wire Wire Line
	6100 1750 6500 1750
$Comp
L power:GND #PWR06
U 1 1 602E0BC1
P 6100 1950
F 0 "#PWR06" H 6100 1700 50  0001 C CNN
F 1 "GND" H 6105 1777 50  0000 C CNN
F 2 "" H 6100 1950 50  0001 C CNN
F 3 "" H 6100 1950 50  0001 C CNN
	1    6100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1950 6100 1750
Text Label 5700 3300 0    50   ~ 0
r3
Text Label 5700 2700 0    50   ~ 0
g0
Text Label 5700 2600 0    50   ~ 0
g1
Text Label 5700 2500 0    50   ~ 0
g2
Text Label 5700 2400 0    50   ~ 0
g3
Connection ~ 9400 5000
Wire Wire Line
	9400 4800 9400 5000
Connection ~ 9400 4800
Wire Wire Line
	9400 4600 9400 4800
$Comp
L Connector:TestPoint GND3
U 1 1 602A27FA
P 9400 5000
F 0 "GND3" V 9354 5188 50  0000 L CNN
F 1 "TestPoint" V 9445 5188 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 9600 5000 50  0001 C CNN
F 3 "~" H 9600 5000 50  0001 C CNN
	1    9400 5000
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint GND2
U 1 1 602A27F4
P 9400 4800
F 0 "GND2" V 9354 4988 50  0000 L CNN
F 1 "TestPoint" V 9445 4988 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 9600 4800 50  0001 C CNN
F 3 "~" H 9600 4800 50  0001 C CNN
	1    9400 4800
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint GND1
U 1 1 602A27EE
P 9400 4600
F 0 "GND1" V 9354 4788 50  0000 L CNN
F 1 "TestPoint" V 9445 4788 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 9600 4600 50  0001 C CNN
F 3 "~" H 9600 4600 50  0001 C CNN
	1    9400 4600
	0    1    1    0   
$EndComp
Text Label 9400 3900 2    50   ~ 0
red
Text Label 9400 4100 2    50   ~ 0
green
Text Label 9400 4300 2    50   ~ 0
blue
$Comp
L Connector:DB15_Male_HighDensity_MountingHoles J2
U 1 1 603A08C8
P 9900 2700
F 0 "J2" H 9900 3567 50  0000 C CNN
F 1 "DB15_Male_HighDensity_MountingHoles" H 9900 3476 50  0000 C CNN
F 2 "good_things:DSUB-15-HDEX15SNT" H 8950 3100 50  0001 C CNN
F 3 " ~" H 8950 3100 50  0001 C CNN
	1    9900 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 603DBFE2
P 9900 3400
F 0 "#PWR012" H 9900 3150 50  0001 C CNN
F 1 "GND" H 9905 3227 50  0000 C CNN
F 2 "" H 9900 3400 50  0001 C CNN
F 3 "" H 9900 3400 50  0001 C CNN
	1    9900 3400
	1    0    0    -1  
$EndComp
Text Label 10200 2200 0    50   ~ 0
vga_clk
Text Label 10200 2800 0    50   ~ 0
vga_data
NoConn ~ 10200 3000
NoConn ~ 9600 2400
Text Label 10200 2400 0    50   ~ 0
vsync
Text Label 10200 2600 0    50   ~ 0
hsync
Wire Wire Line
	9150 2300 9150 2700
Connection ~ 9150 2300
Wire Wire Line
	9150 2200 9150 2300
Wire Wire Line
	9600 2300 9150 2300
Connection ~ 9150 3100
Wire Wire Line
	9150 3100 9150 3250
$Comp
L power:GND #PWR010
U 1 1 603B6B91
P 9150 3250
F 0 "#PWR010" H 9150 3000 50  0001 C CNN
F 1 "GND" H 9155 3077 50  0000 C CNN
F 2 "" H 9150 3250 50  0001 C CNN
F 3 "" H 9150 3250 50  0001 C CNN
	1    9150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2700 9150 2900
Connection ~ 9150 2700
Wire Wire Line
	9600 2700 9150 2700
Wire Wire Line
	9150 2900 9150 3100
Connection ~ 9150 2900
Wire Wire Line
	9600 2900 9150 2900
Wire Wire Line
	9150 3100 9600 3100
Wire Wire Line
	9600 2200 9150 2200
Text Label 9600 2600 2    50   ~ 0
blue
Text Label 9600 2800 2    50   ~ 0
green
Text Label 9600 3000 2    50   ~ 0
red
Text Label 8200 3950 2    50   ~ 0
r3
Text Label 8200 3550 2    50   ~ 0
r2
Text Label 8200 3150 2    50   ~ 0
r1
Text Label 8200 2750 2    50   ~ 0
r0
Text Label 7250 3950 2    50   ~ 0
g3
Text Label 7250 3550 2    50   ~ 0
g2
Text Label 7250 3150 2    50   ~ 0
g1
Text Label 7250 2750 2    50   ~ 0
g0
Text Label 6300 3950 2    50   ~ 0
b3
Text Label 6300 3550 2    50   ~ 0
b2
Text Label 6300 3150 2    50   ~ 0
b1
Text Label 6300 2750 2    50   ~ 0
b0
Text Label 8550 3950 0    50   ~ 0
red
Text Label 6650 3950 0    50   ~ 0
blue
Text Label 7600 3950 0    50   ~ 0
green
Wire Wire Line
	6650 3950 6650 3900
Wire Wire Line
	6600 3950 6650 3950
Wire Wire Line
	6650 3550 6650 3500
Connection ~ 6650 3550
Wire Wire Line
	6600 3550 6650 3550
Wire Wire Line
	6650 3150 6650 3100
Connection ~ 6650 3150
Wire Wire Line
	6600 3150 6650 3150
Wire Wire Line
	6650 2750 6650 2700
Connection ~ 6650 2750
Wire Wire Line
	6600 2750 6650 2750
Wire Wire Line
	6300 2350 6200 2350
Wire Wire Line
	6650 2350 6600 2350
Wire Wire Line
	6650 2400 6650 2350
Wire Wire Line
	6650 2800 6650 2750
Wire Wire Line
	6650 3200 6650 3150
Wire Wire Line
	6650 3600 6650 3550
$Comp
L power:GND #PWR07
U 1 1 60244632
P 6200 2350
F 0 "#PWR07" H 6200 2100 50  0001 C CNN
F 1 "GND" H 6205 2177 50  0000 C CNN
F 2 "" H 6200 2350 50  0001 C CNN
F 3 "" H 6200 2350 50  0001 C CNN
	1    6200 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 602445FC
P 6450 3950
F 0 "R5" H 6520 3996 50  0000 L CNN
F 1 "536" H 6520 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6380 3950 50  0001 C CNN
F 3 "~" H 6450 3950 50  0001 C CNN
	1    6450 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 602445F6
P 6650 3750
F 0 "R9" V 6443 3750 50  0000 C CNN
F 1 "270" V 6534 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6580 3750 50  0001 C CNN
F 3 "~" H 6650 3750 50  0001 C CNN
	1    6650 3750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 602445F0
P 6450 3550
F 0 "R4" H 6520 3596 50  0000 L CNN
F 1 "536" H 6520 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6380 3550 50  0001 C CNN
F 3 "~" H 6450 3550 50  0001 C CNN
	1    6450 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 602445EA
P 6650 3350
F 0 "R8" V 6443 3350 50  0000 C CNN
F 1 "270" V 6534 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6580 3350 50  0001 C CNN
F 3 "~" H 6650 3350 50  0001 C CNN
	1    6650 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 602445E4
P 6450 3150
F 0 "R3" H 6520 3196 50  0000 L CNN
F 1 "536" H 6520 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6380 3150 50  0001 C CNN
F 3 "~" H 6450 3150 50  0001 C CNN
	1    6450 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 602445DE
P 6650 2950
F 0 "R7" V 6443 2950 50  0000 C CNN
F 1 "270" V 6534 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6580 2950 50  0001 C CNN
F 3 "~" H 6650 2950 50  0001 C CNN
	1    6650 2950
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 602445D8
P 6450 2750
F 0 "R2" H 6520 2796 50  0000 L CNN
F 1 "536" H 6520 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6380 2750 50  0001 C CNN
F 3 "~" H 6450 2750 50  0001 C CNN
	1    6450 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 602445D2
P 6650 2550
F 0 "R6" V 6443 2550 50  0000 C CNN
F 1 "270" V 6534 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6580 2550 50  0001 C CNN
F 3 "~" H 6650 2550 50  0001 C CNN
	1    6650 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 602445CC
P 6450 2350
F 0 "R1" H 6520 2396 50  0000 L CNN
F 1 "536" H 6520 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6380 2350 50  0001 C CNN
F 3 "~" H 6450 2350 50  0001 C CNN
	1    6450 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	8550 3950 8550 3900
Wire Wire Line
	8500 3950 8550 3950
Wire Wire Line
	8550 3550 8550 3500
Connection ~ 8550 3550
Wire Wire Line
	8500 3550 8550 3550
Wire Wire Line
	8550 3150 8550 3100
Connection ~ 8550 3150
Wire Wire Line
	8500 3150 8550 3150
Wire Wire Line
	8550 2750 8550 2700
Connection ~ 8550 2750
Wire Wire Line
	8500 2750 8550 2750
Wire Wire Line
	8200 2350 8100 2350
Wire Wire Line
	8550 2350 8500 2350
Wire Wire Line
	8550 2400 8550 2350
Wire Wire Line
	8550 2800 8550 2750
Wire Wire Line
	8550 3200 8550 3150
Wire Wire Line
	8550 3600 8550 3550
$Comp
L power:GND #PWR09
U 1 1 6023DDC8
P 8100 2350
F 0 "#PWR09" H 8100 2100 50  0001 C CNN
F 1 "GND" H 8105 2177 50  0000 C CNN
F 2 "" H 8100 2350 50  0001 C CNN
F 3 "" H 8100 2350 50  0001 C CNN
	1    8100 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R23
U 1 1 6023DD92
P 8350 3950
F 0 "R23" H 8420 3996 50  0000 L CNN
F 1 "536" H 8420 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8280 3950 50  0001 C CNN
F 3 "~" H 8350 3950 50  0001 C CNN
	1    8350 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R27
U 1 1 6023DD8C
P 8550 3750
F 0 "R27" V 8343 3750 50  0000 C CNN
F 1 "270" V 8434 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8480 3750 50  0001 C CNN
F 3 "~" H 8550 3750 50  0001 C CNN
	1    8550 3750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R22
U 1 1 6023DD86
P 8350 3550
F 0 "R22" H 8420 3596 50  0000 L CNN
F 1 "536" H 8420 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8280 3550 50  0001 C CNN
F 3 "~" H 8350 3550 50  0001 C CNN
	1    8350 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R26
U 1 1 6023DD80
P 8550 3350
F 0 "R26" V 8343 3350 50  0000 C CNN
F 1 "270" V 8434 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8480 3350 50  0001 C CNN
F 3 "~" H 8550 3350 50  0001 C CNN
	1    8550 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R21
U 1 1 6023DD7A
P 8350 3150
F 0 "R21" H 8420 3196 50  0000 L CNN
F 1 "536" H 8420 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8280 3150 50  0001 C CNN
F 3 "~" H 8350 3150 50  0001 C CNN
	1    8350 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R R25
U 1 1 6023DD74
P 8550 2950
F 0 "R25" V 8343 2950 50  0000 C CNN
F 1 "270" V 8434 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8480 2950 50  0001 C CNN
F 3 "~" H 8550 2950 50  0001 C CNN
	1    8550 2950
	-1   0    0    1   
$EndComp
$Comp
L Device:R R20
U 1 1 6023DD6E
P 8350 2750
F 0 "R20" H 8420 2796 50  0000 L CNN
F 1 "536" H 8420 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8280 2750 50  0001 C CNN
F 3 "~" H 8350 2750 50  0001 C CNN
	1    8350 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R24
U 1 1 6023DD68
P 8550 2550
F 0 "R24" V 8343 2550 50  0000 C CNN
F 1 "270" V 8434 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8480 2550 50  0001 C CNN
F 3 "~" H 8550 2550 50  0001 C CNN
	1    8550 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R19
U 1 1 6023DD62
P 8350 2350
F 0 "R19" H 8420 2396 50  0000 L CNN
F 1 "536" H 8420 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8280 2350 50  0001 C CNN
F 3 "~" H 8350 2350 50  0001 C CNN
	1    8350 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 3950 7600 3900
Wire Wire Line
	7550 3950 7600 3950
Wire Wire Line
	7600 3550 7600 3500
Connection ~ 7600 3550
Wire Wire Line
	7550 3550 7600 3550
Wire Wire Line
	7600 3150 7600 3100
Connection ~ 7600 3150
Wire Wire Line
	7550 3150 7600 3150
Wire Wire Line
	7600 2750 7600 2700
Connection ~ 7600 2750
Wire Wire Line
	7550 2750 7600 2750
Wire Wire Line
	7250 2350 7150 2350
Wire Wire Line
	7600 2350 7550 2350
Wire Wire Line
	7600 2400 7600 2350
Wire Wire Line
	7600 2800 7600 2750
Wire Wire Line
	7600 3200 7600 3150
Wire Wire Line
	7600 3600 7600 3550
$Comp
L power:GND #PWR08
U 1 1 602060D3
P 7150 2350
F 0 "#PWR08" H 7150 2100 50  0001 C CNN
F 1 "GND" H 7155 2177 50  0000 C CNN
F 2 "" H 7150 2350 50  0001 C CNN
F 3 "" H 7150 2350 50  0001 C CNN
	1    7150 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 602048A2
P 7400 3950
F 0 "R14" H 7470 3996 50  0000 L CNN
F 1 "536" H 7470 3905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7330 3950 50  0001 C CNN
F 3 "~" H 7400 3950 50  0001 C CNN
	1    7400 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 6020489C
P 7600 3750
F 0 "R18" V 7393 3750 50  0000 C CNN
F 1 "270" V 7484 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7530 3750 50  0001 C CNN
F 3 "~" H 7600 3750 50  0001 C CNN
	1    7600 3750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R13
U 1 1 60204482
P 7400 3550
F 0 "R13" H 7470 3596 50  0000 L CNN
F 1 "536" H 7470 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7330 3550 50  0001 C CNN
F 3 "~" H 7400 3550 50  0001 C CNN
	1    7400 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 6020447C
P 7600 3350
F 0 "R17" V 7393 3350 50  0000 C CNN
F 1 "270" V 7484 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7530 3350 50  0001 C CNN
F 3 "~" H 7600 3350 50  0001 C CNN
	1    7600 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R12
U 1 1 602035E4
P 7400 3150
F 0 "R12" H 7470 3196 50  0000 L CNN
F 1 "536" H 7470 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7330 3150 50  0001 C CNN
F 3 "~" H 7400 3150 50  0001 C CNN
	1    7400 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 602035DE
P 7600 2950
F 0 "R16" V 7393 2950 50  0000 C CNN
F 1 "270" V 7484 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7530 2950 50  0001 C CNN
F 3 "~" H 7600 2950 50  0001 C CNN
	1    7600 2950
	-1   0    0    1   
$EndComp
$Comp
L Device:R R11
U 1 1 602008CD
P 7400 2750
F 0 "R11" H 7470 2796 50  0000 L CNN
F 1 "536" H 7470 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7330 2750 50  0001 C CNN
F 3 "~" H 7400 2750 50  0001 C CNN
	1    7400 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 60200384
P 7600 2550
F 0 "R15" V 7393 2550 50  0000 C CNN
F 1 "270" V 7484 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7530 2550 50  0001 C CNN
F 3 "~" H 7600 2550 50  0001 C CNN
	1    7600 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R10
U 1 1 601FFEDF
P 7400 2350
F 0 "R10" H 7470 2396 50  0000 L CNN
F 1 "536" H 7470 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7330 2350 50  0001 C CNN
F 3 "~" H 7400 2350 50  0001 C CNN
	1    7400 2350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 604D5C03
P 750 4150
F 0 "#PWR01" H 750 3900 50  0001 C CNN
F 1 "GND" H 755 3977 50  0000 C CNN
F 2 "" H 750 4150 50  0001 C CNN
F 3 "" H 750 4150 50  0001 C CNN
	1    750  4150
	1    0    0    -1  
$EndComp
Text Label 5700 4050 0    50   ~ 0
b0
Text Label 5700 3950 0    50   ~ 0
b1
Text Label 5700 3850 0    50   ~ 0
b2
Text Label 5700 3750 0    50   ~ 0
b3
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 605442D5
P 9500 5200
F 0 "H1" V 9600 5150 50  0000 L CNN
F 1 "MountingHole_Pad" V 9600 5250 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 9500 5200 50  0001 C CNN
F 3 "~" H 9500 5200 50  0001 C CNN
	1    9500 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 5000 9400 5200
$Comp
L power:GND #PWR011
U 1 1 605791B2
P 9400 6000
F 0 "#PWR011" H 9400 5750 50  0001 C CNN
F 1 "GND" H 9405 5827 50  0000 C CNN
F 2 "" H 9400 6000 50  0001 C CNN
F 3 "" H 9400 6000 50  0001 C CNN
	1    9400 6000
	1    0    0    -1  
$EndComp
Connection ~ 750  4150
Connection ~ 750  3150
Wire Wire Line
	750  3650 750  4150
Connection ~ 750  3650
Wire Wire Line
	750  3150 750  3650
Wire Wire Line
	750  2650 750  3150
Connection ~ 4950 1450
Text Label 1300 3950 2    50   ~ 0
pio_b3
Text Label 1300 4050 2    50   ~ 0
pio_b2
Text Label 1300 4250 2    50   ~ 0
pio_b1
Text Label 1300 4350 2    50   ~ 0
pio_b0
Text Label 1300 3050 2    50   ~ 0
pio_g2
Text Label 1300 3350 2    50   ~ 0
pio_g0
Text Label 1300 3550 2    50   ~ 0
pio_r2
Text Label 1300 3850 2    50   ~ 0
pio_r0
Text Label 1300 2550 2    50   ~ 0
hsync
Text Label 1300 2850 2    50   ~ 0
rgb_oe
NoConn ~ 1900 2250
NoConn ~ 2000 2250
NoConn ~ 2100 2250
Wire Wire Line
	2950 2150 2950 3950
Wire Wire Line
	2700 2850 3250 2850
$Comp
L power:+3V3 #PWR03
U 1 1 602ADC59
P 2950 2150
F 0 "#PWR03" H 2950 2000 50  0001 C CNN
F 1 "+3V3" H 2965 2323 50  0000 C CNN
F 2 "" H 2950 2150 50  0001 C CNN
F 3 "" H 2950 2150 50  0001 C CNN
	1    2950 2150
	1    0    0    -1  
$EndComp
Text Label 3250 2850 0    50   ~ 0
vga_clk
Text Label 3250 2750 0    50   ~ 0
vga_data
Wire Wire Line
	2850 4150 2850 4550
$Comp
L power:GND #PWR02
U 1 1 6036D97A
P 2850 4550
F 0 "#PWR02" H 2850 4300 50  0001 C CNN
F 1 "GND" H 2855 4377 50  0000 C CNN
F 2 "" H 2850 4550 50  0001 C CNN
F 3 "" H 2850 4550 50  0001 C CNN
	1    2850 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3150 2850 2650
Wire Wire Line
	2850 3150 2700 3150
Connection ~ 2850 3150
Wire Wire Line
	2850 3650 2850 3150
Wire Wire Line
	2700 2650 2850 2650
Wire Wire Line
	2700 2750 3250 2750
Connection ~ 2850 4150
Connection ~ 2850 3650
Wire Wire Line
	2850 3650 2850 4150
Wire Wire Line
	2700 3650 2850 3650
Wire Wire Line
	2700 3950 2950 3950
Wire Wire Line
	2700 4150 2850 4150
$Comp
L pipico_vga-rescue:Pico-MCU_RaspberryPi_and_Boards U1
U 1 1 6020A685
P 2000 3400
F 0 "U1" H 2000 4615 50  0000 C CNN
F 1 "Pico" H 2000 4524 50  0000 C CNN
F 2 "MCU_RaspberryPi_and_Boards:RPi_Pico_SMD_TH" V 2000 3400 50  0001 C CNN
F 3 "" H 2000 3400 50  0001 C CNN
	1    2000 3400
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 602A996B
P 4400 5050
F 0 "#PWR04" H 4400 4800 50  0001 C CNN
F 1 "GND" H 4405 4877 50  0000 C CNN
F 2 "" H 4400 5050 50  0001 C CNN
F 3 "" H 4400 5050 50  0001 C CNN
	1    4400 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4950 4400 5050
Text Label 4500 4250 2    50   ~ 0
rgb_oe
Wire Wire Line
	4150 4950 4400 4950
Connection ~ 4400 4950
Text Notes 1700 1850 0    50   ~ 0
work with 16 bit words\n(order is not important)\nbit 0: ctrl\nbit 1: oe\nbit 2: hsync\nbit 3: vsync\nbit 4-7: r\nbit 8-11: g\nbit 12-15: b
Wire Wire Line
	750  4150 1300 4150
Wire Wire Line
	750  3650 1300 3650
Wire Wire Line
	750  3150 1300 3150
Wire Wire Line
	750  2650 1300 2650
Text Label 1300 2750 2    50   ~ 0
vsync
Text Label 1300 3750 2    50   ~ 0
pio_r1
Text Label 1300 3450 2    50   ~ 0
pio_r3
Text Label 1300 3250 2    50   ~ 0
pio_g1
Text Label 1300 2950 2    50   ~ 0
pio_g3
NoConn ~ 1300 2450
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 6133AA99
P 9500 5400
F 0 "H2" V 9600 5350 50  0000 L CNN
F 1 "MountingHole_Pad" V 9600 5450 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 9500 5400 50  0001 C CNN
F 3 "~" H 9500 5400 50  0001 C CNN
	1    9500 5400
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 6133AC71
P 9500 5600
F 0 "H3" V 9600 5550 50  0000 L CNN
F 1 "MountingHole_Pad" V 9600 5650 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 9500 5600 50  0001 C CNN
F 3 "~" H 9500 5600 50  0001 C CNN
	1    9500 5600
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 6133AE13
P 9500 5800
F 0 "H4" V 9600 5750 50  0000 L CNN
F 1 "MountingHole_Pad" V 9600 5850 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965_Pad" H 9500 5800 50  0001 C CNN
F 3 "~" H 9500 5800 50  0001 C CNN
	1    9500 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 5200 9400 5400
Connection ~ 9400 5200
Connection ~ 9400 5400
Wire Wire Line
	9400 5400 9400 5600
Connection ~ 9400 5600
Wire Wire Line
	9400 5600 9400 5800
Connection ~ 9400 5800
Wire Wire Line
	9400 5800 9400 6000
Text Label 10150 3900 2    50   ~ 0
hsync
Text Label 10150 4100 2    50   ~ 0
vsync
$Comp
L Connector:TestPoint TP1
U 1 1 6136635D
P 9400 3900
F 0 "TP1" V 9354 4088 50  0000 L CNN
F 1 "red" V 9445 4088 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 9600 3900 50  0001 C CNN
F 3 "~" H 9600 3900 50  0001 C CNN
	1    9400 3900
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 613710F7
P 9400 4100
F 0 "TP2" V 9354 4288 50  0000 L CNN
F 1 "green" V 9445 4288 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 9600 4100 50  0001 C CNN
F 3 "~" H 9600 4100 50  0001 C CNN
	1    9400 4100
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 613711C2
P 9400 4300
F 0 "TP3" V 9354 4488 50  0000 L CNN
F 1 "blue" V 9445 4488 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 9600 4300 50  0001 C CNN
F 3 "~" H 9600 4300 50  0001 C CNN
	1    9400 4300
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 61371283
P 10150 3900
F 0 "TP4" V 10104 4088 50  0000 L CNN
F 1 "hsync" V 10195 4088 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 10350 3900 50  0001 C CNN
F 3 "~" H 10350 3900 50  0001 C CNN
	1    10150 3900
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 613714AE
P 10150 4100
F 0 "TP5" V 10104 4288 50  0000 L CNN
F 1 "vsync" V 10195 4288 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 10350 4100 50  0001 C CNN
F 3 "~" H 10350 4100 50  0001 C CNN
	1    10150 4100
	0    1    1    0   
$EndComp
Connection ~ 4500 4450
Connection ~ 4500 4350
Wire Wire Line
	4500 4550 4500 4450
Wire Wire Line
	4400 4950 4750 4950
Wire Wire Line
	4750 4950 4850 4950
Wire Wire Line
	5050 2050 4950 2050
Wire Wire Line
	4850 4950 4950 4950
Wire Wire Line
	4950 4950 5050 4950
Wire Wire Line
	5150 2050 5050 2050
Wire Wire Line
	5250 2050 5150 2050
Wire Wire Line
	5050 4950 5150 4950
Wire Wire Line
	5150 4950 5250 4950
Wire Wire Line
	5250 4950 5350 4950
Wire Wire Line
	5350 4950 5450 4950
Connection ~ 4950 2050
Connection ~ 5150 2050
Connection ~ 5050 2050
Connection ~ 5350 4950
Connection ~ 5250 4950
Connection ~ 5150 4950
Connection ~ 5050 4950
Connection ~ 4950 4950
Connection ~ 4850 4950
Connection ~ 4750 4950
Wire Wire Line
	4950 1450 4950 2050
Wire Wire Line
	4500 4450 4500 4350
Wire Wire Line
	4500 4350 4500 4250
$Comp
L pipico_vga-rescue:74LVC162244ADGVJ-random_things U2
U 1 1 60279B05
P 5100 3450
F 0 "U2" H 5100 5031 50  0000 C CNN
F 1 "74LVC162244ADGVJ" H 5100 4940 50  0000 C CNN
F 2 "good_things:SOIC-48" H 5500 4350 50  0001 C CNN
F 3 "" H 5500 4350 50  0001 C CNN
	1    5100 3450
	1    0    0    -1  
$EndComp
Text Label 5700 3400 0    50   ~ 0
r2
Text Label 5700 3500 0    50   ~ 0
r1
Text Label 5700 3600 0    50   ~ 0
r0
Text Label 4500 2400 2    50   ~ 0
pio_g3
Text Label 4500 2500 2    50   ~ 0
pio_g2
Text Label 4500 2600 2    50   ~ 0
pio_g1
Text Label 4500 2700 2    50   ~ 0
pio_g0
Text Label 4500 3750 2    50   ~ 0
pio_b3
Text Label 4500 3850 2    50   ~ 0
pio_b2
Text Label 4500 3950 2    50   ~ 0
pio_b1
Text Label 4500 4050 2    50   ~ 0
pio_b0
Text Label 4500 3300 2    50   ~ 0
pio_r3
Text Label 4500 3500 2    50   ~ 0
pio_r1
Text Label 4500 3600 2    50   ~ 0
pio_r0
Text Label 4500 3400 2    50   ~ 0
pio_r2
Wire Wire Line
	4150 3150 4500 3150
Wire Wire Line
	4150 3150 4150 4950
Wire Wire Line
	4500 2850 4500 2950
Connection ~ 4500 3150
Connection ~ 4500 2950
Wire Wire Line
	4500 2950 4500 3050
Connection ~ 4500 3050
Wire Wire Line
	4500 3050 4500 3150
$Comp
L Connector:RJ45_LED_Shielded J1
U 1 1 6145D3A9
P 2350 5600
F 0 "J1" H 2350 6267 50  0000 C CNN
F 1 "RJ45_LED_Shielded" H 2350 6176 50  0000 C CNN
F 2 "Connector_RJ:RJ45_BEL_SS74301-00x_Vertical" V 2350 5625 50  0001 C CNN
F 3 "~" V 2350 5625 50  0001 C CNN
	1    2350 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q2
U 1 1 6146406F
P 1100 6000
F 0 "Q2" H 1304 6046 50  0000 L CNN
F 1 "2N7002P" H 1304 5955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 1300 6100 50  0001 C CNN
F 3 "~" H 1100 6000 50  0001 C CNN
	1    1100 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q1
U 1 1 614647C1
P 1100 5400
F 0 "Q1" H 1304 5446 50  0000 L CNN
F 1 "2N7002P" H 1304 5355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 1300 5500 50  0001 C CNN
F 3 "~" H 1100 5400 50  0001 C CNN
	1    1100 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R28
U 1 1 614664BF
P 1600 5800
F 0 "R28" V 1404 5800 50  0000 C CNN
F 1 "1k" V 1495 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1600 5800 50  0001 C CNN
F 3 "~" H 1600 5800 50  0001 C CNN
	1    1600 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R29
U 1 1 61466681
P 1650 5200
F 0 "R29" V 1454 5200 50  0000 C CNN
F 1 "1k" V 1545 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1650 5200 50  0001 C CNN
F 3 "~" H 1650 5200 50  0001 C CNN
	1    1650 5200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61466A62
P 1200 5600
F 0 "#PWR0101" H 1200 5350 50  0001 C CNN
F 1 "GND" H 1205 5427 50  0000 C CNN
F 2 "" H 1200 5600 50  0001 C CNN
F 3 "" H 1200 5600 50  0001 C CNN
	1    1200 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 614670FB
P 1200 6200
F 0 "#PWR0102" H 1200 5950 50  0001 C CNN
F 1 "GND" H 1205 6027 50  0000 C CNN
F 2 "" H 1200 6200 50  0001 C CNN
F 3 "" H 1200 6200 50  0001 C CNN
	1    1200 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 5800 1500 5800
Wire Wire Line
	1700 5800 1950 5800
Wire Wire Line
	1750 5200 1950 5200
Wire Wire Line
	1200 5200 1550 5200
Wire Wire Line
	900  5400 800  5400
Wire Wire Line
	900  6000 800  6000
Text Label 800  5400 0    50   ~ 0
led0
Text Label 800  6000 0    50   ~ 0
led1
Wire Wire Line
	1950 5900 1850 5900
Wire Wire Line
	1850 5900 1850 5300
Wire Wire Line
	1850 5300 1950 5300
Connection ~ 1850 5300
Wire Wire Line
	1850 5300 1850 5000
$Comp
L power:+3V3 #PWR0103
U 1 1 61489A8A
P 1850 5000
F 0 "#PWR0103" H 1850 4850 50  0001 C CNN
F 1 "+3V3" H 1865 5173 50  0000 C CNN
F 2 "" H 1850 5000 50  0001 C CNN
F 3 "" H 1850 5000 50  0001 C CNN
	1    1850 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5200 3400 5200
Wire Wire Line
	3400 5200 3400 6150
$Comp
L power:GND #PWR0104
U 1 1 6148F0CB
P 3400 6150
F 0 "#PWR0104" H 3400 5900 50  0001 C CNN
F 1 "GND" H 3405 5977 50  0000 C CNN
F 2 "" H 3400 6150 50  0001 C CNN
F 3 "" H 3400 6150 50  0001 C CNN
	1    3400 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0105
U 1 1 6148F739
P 3500 5100
F 0 "#PWR0105" H 3500 4950 50  0001 C CNN
F 1 "+3V3" H 3515 5273 50  0000 C CNN
F 2 "" H 3500 5100 50  0001 C CNN
F 3 "" H 3500 5100 50  0001 C CNN
	1    3500 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5100 3500 5700
Wire Wire Line
	3500 5700 2750 5700
Text GLabel 2750 5800 2    50   Input ~ 0
rx
Text GLabel 2750 5900 2    50   Input ~ 0
tx
Text GLabel 2750 5300 2    50   Input ~ 0
connected
NoConn ~ 2750 5400
NoConn ~ 2750 5500
NoConn ~ 2750 5600
Text GLabel 3250 2550 2    50   Input ~ 0
rx
Text GLabel 3250 2450 2    50   Input ~ 0
tx
Text GLabel 3250 2950 2    50   Input ~ 0
connected
Wire Wire Line
	3250 2950 2700 2950
Wire Wire Line
	3250 2450 2700 2450
Wire Wire Line
	2700 2550 3250 2550
Text Label 3250 3250 0    50   ~ 0
led0
Text Label 3250 3050 0    50   ~ 0
led1
Wire Wire Line
	3250 3250 2700 3250
Wire Wire Line
	3250 3050 2700 3050
$Comp
L power:GND #PWR0106
U 1 1 614F5313
P 2350 6100
F 0 "#PWR0106" H 2350 5850 50  0001 C CNN
F 1 "GND" H 2355 5927 50  0000 C CNN
F 2 "" H 2350 6100 50  0001 C CNN
F 3 "" H 2350 6100 50  0001 C CNN
	1    2350 6100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 61514010
P 850 7000
F 0 "J3" H 768 6675 50  0000 C CNN
F 1 "power" H 768 6766 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 850 7000 50  0001 C CNN
F 3 "~" H 850 7000 50  0001 C CNN
	1    850  7000
	-1   0    0    1   
$EndComp
$Comp
L Device:Q_PMOS_GSD Q3
U 1 1 615238EF
P 2100 7000
F 0 "Q3" V 2442 7000 50  0000 C CNN
F 1 "CPH3350-TL-W" V 2351 7000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2300 7100 50  0001 C CNN
F 3 "~" H 2100 7000 50  0001 C CNN
	1    2100 7000
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse_Small F1
U 1 1 61525103
P 1450 6900
F 0 "F1" H 1450 7085 50  0000 C CNN
F 1 "MC36232" H 1450 6994 50  0000 C CNN
F 2 "Fuse:Fuse_1812_4532Metric" H 1450 6900 50  0001 C CNN
F 3 "~" H 1450 6900 50  0001 C CNN
	1    1450 6900
	1    0    0    -1  
$EndComp
$Comp
L good_things:AP62250 U3
U 1 1 615255CC
P 4000 7050
F 0 "U3" H 4000 7425 50  0000 C CNN
F 1 "AP62250" H 4000 7334 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 4000 7050 50  0001 C CNN
F 3 "" H 4000 7050 50  0001 C CNN
	1    4000 7050
	1    0    0    -1  
$EndComp
NoConn ~ 3700 7000
$Comp
L Device:C_Small C5
U 1 1 61531463
P 3250 7000
F 0 "C5" H 3342 7046 50  0000 L CNN
F 1 "10u 18v" H 3342 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3250 7000 50  0001 C CNN
F 3 "~" H 3250 7000 50  0001 C CNN
	1    3250 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L1
U 1 1 61531899
P 5250 7000
F 0 "L1" V 5435 7000 50  0000 C CNN
F 1 "2u2" V 5344 7000 50  0000 C CNN
F 2 "good_things:smd_inductor_0806_2016metric" H 5250 7000 50  0001 C CNN
F 3 "~" H 5250 7000 50  0001 C CNN
	1    5250 7000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R31
U 1 1 61532681
P 5700 7100
F 0 "R31" H 5759 7146 50  0000 L CNN
F 1 "52k3" H 5759 7055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5700 7100 50  0001 C CNN
F 3 "~" H 5700 7100 50  0001 C CNN
	1    5700 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R32
U 1 1 61532F29
P 5700 7400
F 0 "R32" H 5759 7446 50  0000 L CNN
F 1 "10k" H 5759 7355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5700 7400 50  0001 C CNN
F 3 "~" H 5700 7400 50  0001 C CNN
	1    5700 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 61533A89
P 6100 7100
F 0 "C7" H 6192 7146 50  0000 L CNN
F 1 "22u 5v" H 6192 7055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6100 7100 50  0001 C CNN
F 3 "~" H 6100 7100 50  0001 C CNN
	1    6100 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 615344C3
P 6550 7100
F 0 "C8" H 6642 7146 50  0000 L CNN
F 1 "22u 5v" H 6642 7055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6550 7100 50  0001 C CNN
F 3 "~" H 6550 7100 50  0001 C CNN
	1    6550 7100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 61534F35
P 6550 6850
F 0 "TP6" H 6608 6968 50  0000 L CNN
F 1 "5v" H 6608 6877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 6750 6850 50  0001 C CNN
F 3 "~" H 6750 6850 50  0001 C CNN
	1    6550 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 6850 6550 7000
Wire Wire Line
	6550 7000 6300 7000
Connection ~ 6550 7000
Connection ~ 6100 7000
Wire Wire Line
	6100 7000 5700 7000
$Comp
L Device:C_Small C6
U 1 1 6155525A
P 4550 6900
F 0 "C6" H 4642 6946 50  0000 L CNN
F 1 "100n" H 4642 6855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4550 6900 50  0001 C CNN
F 3 "~" H 4550 6900 50  0001 C CNN
	1    4550 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6900 4300 6800
Wire Wire Line
	4300 6800 4550 6800
Wire Wire Line
	4300 7000 4550 7000
Connection ~ 4550 7000
Wire Wire Line
	4550 7000 5150 7000
Wire Wire Line
	5350 7000 5700 7000
Connection ~ 5700 7000
Text Label 4850 7000 0    50   ~ 0
vsys_sw
$Comp
L power:+5V #PWR0107
U 1 1 6158635C
P 6300 7000
F 0 "#PWR0107" H 6300 6850 50  0001 C CNN
F 1 "+5V" H 6315 7173 50  0000 C CNN
F 2 "" H 6300 7000 50  0001 C CNN
F 3 "" H 6300 7000 50  0001 C CNN
	1    6300 7000
	1    0    0    -1  
$EndComp
Connection ~ 6300 7000
Wire Wire Line
	6300 7000 6100 7000
$Comp
L power:GND #PWR0108
U 1 1 6158730D
P 6100 7200
F 0 "#PWR0108" H 6100 6950 50  0001 C CNN
F 1 "GND" H 6105 7027 50  0000 C CNN
F 2 "" H 6100 7200 50  0001 C CNN
F 3 "" H 6100 7200 50  0001 C CNN
	1    6100 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 61587C10
P 6550 7200
F 0 "#PWR0109" H 6550 6950 50  0001 C CNN
F 1 "GND" H 6555 7027 50  0000 C CNN
F 2 "" H 6550 7200 50  0001 C CNN
F 3 "" H 6550 7200 50  0001 C CNN
	1    6550 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 61587CE8
P 5700 7500
F 0 "#PWR0110" H 5700 7250 50  0001 C CNN
F 1 "GND" H 5705 7327 50  0000 C CNN
F 2 "" H 5700 7500 50  0001 C CNN
F 3 "" H 5700 7500 50  0001 C CNN
	1    5700 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 7300 5700 7250
Wire Wire Line
	4300 7100 4300 7250
Wire Wire Line
	4300 7250 5700 7250
Connection ~ 5700 7250
Wire Wire Line
	5700 7250 5700 7200
$Comp
L Device:R_Small R30
U 1 1 6159AD18
P 2100 7450
F 0 "R30" H 2159 7496 50  0000 L CNN
F 1 "10k" H 2159 7405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2100 7450 50  0001 C CNN
F 3 "~" H 2100 7450 50  0001 C CNN
	1    2100 7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 6159B112
P 3700 7100
F 0 "#PWR0111" H 3700 6850 50  0001 C CNN
F 1 "GND" H 3705 6927 50  0000 C CNN
F 2 "" H 3700 7100 50  0001 C CNN
F 3 "" H 3700 7100 50  0001 C CNN
	1    3700 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 615A1A44
P 3250 7100
F 0 "#PWR0112" H 3250 6850 50  0001 C CNN
F 1 "GND" H 3255 6927 50  0000 C CNN
F 2 "" H 3250 7100 50  0001 C CNN
F 3 "" H 3250 7100 50  0001 C CNN
	1    3250 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 615A1C17
P 2100 7550
F 0 "#PWR0113" H 2100 7300 50  0001 C CNN
F 1 "GND" H 2105 7377 50  0000 C CNN
F 2 "" H 2100 7550 50  0001 C CNN
F 3 "" H 2100 7550 50  0001 C CNN
	1    2100 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small D1
U 1 1 615A1FAF
P 2450 7000
F 0 "D1" V 2404 7068 50  0000 L CNN
F 1 "BZT52C5V1+" V 2495 7068 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" V 2450 7000 50  0001 C CNN
F 3 "~" V 2450 7000 50  0001 C CNN
	1    2450 7000
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 6900 1350 6900
Wire Wire Line
	1550 6900 1900 6900
Wire Wire Line
	2300 6900 2450 6900
Connection ~ 3250 6900
Wire Wire Line
	3250 6900 3700 6900
Connection ~ 2450 6900
Wire Wire Line
	2450 6900 3250 6900
Wire Wire Line
	2450 7100 2450 7250
Wire Wire Line
	2100 7200 2100 7250
Wire Wire Line
	2100 7250 2450 7250
Connection ~ 2100 7250
Wire Wire Line
	2100 7250 2100 7350
Text Label 1050 6900 0    50   ~ 0
vin_raw
Text Label 2750 6900 0    50   ~ 0
vin
Text Label 4600 7250 0    50   ~ 0
vsys_fb
$Comp
L power:GND #PWR0114
U 1 1 615FBA7F
P 1050 7000
F 0 "#PWR0114" H 1050 6750 50  0001 C CNN
F 1 "GND" H 1055 6827 50  0000 C CNN
F 2 "" H 1050 7000 50  0001 C CNN
F 3 "" H 1050 7000 50  0001 C CNN
	1    1050 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 6161F526
P 3150 4100
F 0 "D2" V 3196 4021 50  0000 R CNN
F 1 "RSX301L-30TE25" V 3105 4021 50  0000 R CNN
F 2 "good_things:SOD-106" H 3150 4100 50  0001 C CNN
F 3 "~" H 3150 4100 50  0001 C CNN
	1    3150 4100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3150 4250 2700 4250
$Comp
L power:+5V #PWR0115
U 1 1 61627A1D
P 3150 3950
F 0 "#PWR0115" H 3150 3800 50  0001 C CNN
F 1 "+5V" H 3165 4123 50  0000 C CNN
F 2 "" H 3150 3950 50  0001 C CNN
F 3 "" H 3150 3950 50  0001 C CNN
	1    3150 3950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
