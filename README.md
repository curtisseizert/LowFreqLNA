# LowFreqLNA
A 0.01Hz-1+MHz low noise amplifier

![Amplifier assembled](https://github.com/curtisseizert/LowFreqLNA/assets/22351001/5cb4d507-83ab-44a3-b9a8-da4d0036aa29)

Current Status
--------------
I have made two of these and have done a fair amount of testing to nail down root causes of some of the issues (see later in this readme) that have proven to be a bit of a nuisance. I am also moving things around a bit on the battery and battery charger boards to allow a board-to-board connection of the two and increase the clearance between the battery board and the amplifier board.

Introduction
------------

This repository contains the complete design files for a low noise AC coupled amplifier intended especially for characterization of 1/f noise of voltage references, DACs, etc. For broader applicability, it also has a reasonably high bandwidth of 2.5 MHz (measured, -3dB) at 60 or 80 dB gain, and about 1 MHz at 100 dB gain. Consistent with my primary use case for this amplifier, it has exceptionally low 1/f noise itself (measured at 3.2 nVRMS from 0.01-10 Hz) and a low broadband noise density of around 0.6 nV/rtHz. The quiescent current draw for the amplifier is about 30 mA, giving it a battery life of >100 h with the 4S 21700 Li batteries used to power the device. The project includes five PCBs:
(1) The main amplifier board
(2) The BMS board
(3) The SW board
(4) The front panel board
(5) The rear panel board/battery charger.

At present, I have hand assembled these using a converted toaster oven, which is a semi-onerous but doable-in-a-weekend task. As such, the BOMs are incomplete in all cases, which I will aim to rectify going forward. It is my hope that this will serve the needs of others designing voltage references, DACs, power supplies, etc. I may try to fix a couple things about this that have been bugging me, such as the lack of prefiltering and the antenna-like properties of the PP caps used in HP filters in the signal train. There is also a bit of room for reducing current draw. A fully differential version has been suggested, but if I work on that, I will make a separate repository for it.

The input stage is formed from a 24uF/100M RC high pass filter feeding a hybrid amplifier. The hybrid amplifier consists of 16 parallel JFE2140 dual JFETs in a cascode differential amplifier configuration. This drives an OPA140 op amp, which provides feedback via a 1k/2R divider to the inverting gate of the differential pair. The DC offset of the input stage is removed with a 2.2uF/10M HP filter. A switched gain stage amplifies the signal, which is HP filtered again to remove offsets and set the high-pass cutoff of the amplifier. The switched low-pass filtering is provided by two fourth-order butterworth filters in Sallen-Key topology. Switches select either one of these outputs or the unfiltered amplified signal to feed to the output stage.

A common problem with low-frequency AC coupled amplifiers is very long settling times when switching inputs. This is addressed with the "SETTLE" and "IN PROT" (Input protection) switches on the front panel. The former shorts the resistors of both of the post-input stage HP filter outputs with low-leakage MMBF4117 JFETs, and the latter shorts the input AC coupling filter by shorting the 100M resistor with a relay. The "IN PROT" switch also places a 6k04 resistor in series with the AC coupling filter to avoid large transients when switching between sources with different DC biases. With these switches, it is possible to take valid measurements down to 0.1 Hz with a minute or so of settling time and measurements down to 0.01 Hz with 5-10 minutes of settling time. Saturation of the amplifiers prior to both HP filters is detected with window comparators, which drive warning lights on the front panel. These features are meant to make it reasonably convenient to make low-level measurements and be confident the result is valid.

Electrical Characteristics
--------------------------

The following characteristics are taken from the one of these that I have fully assembled. Characterization was performed with a Digilent Analog Discovery Pro ADP3450 for bandwidths >10 kHz, a Keysight 34465A, and an HP3458A. Noise captures with the ADP3450 were digitized in Waveforms, exported, and transformed to the frequency domain using the SciPy Signal Python library in Spyder IDE. Captures with the HP3458A were taken using the PyVISA Python library for low frequency (50 SPS) digitization. The HP3458A was used for most low frequency work due to its superior isolation and common mode immunity. Bandwidth characterization was performed with the network analyzer utility in Waveforms for the ADP3450 and a 60dB attenuator. Gain calibration was performed by measuring the noise of a 6k04 resistor (9.97 nV/rtHz Johnson-Nyquist voltage noise density at 298k) comparing the bandwidth-limited RMS amplitude of the output signal to the theoretical value at the ambient temperature outside the amplifier. Linearity was checked by obtaining bandwidth-limited RMS amplitudes for a 240R resistor and a short, accounting for the RMS addition of the amplifier's own noise floor and that of the 240R resistor. The calibration resistors were 0.1%, 10 ppm/K thin film types. Quiescent current was measured by powering the amplifier with a Rigol DP832A DC power supply at +/-8V.

<table>
  <tr><td><b>Parameter</td><td><b>Condition</td><td><b>Result</td><td><b>Comment</td></tr>
  <tr><td>Voltage Noise Density</td><td>1 MHz</td><td>0.6 nV/rtHz</td><td>A</td></tr>
  <tr><td> </td><td>1 kHz</td><td>0.64 nV/rtHz</td><td>A</td></tr>
  <tr><td> </td><td>10 Hz</td><td>0.75 nV/rtHz</td><td>B</td></tr>
  <tr><td> </td><td>1 Hz</td><td>1.2 nV/rtHz</td><td>C</td></tr>
  <tr><td> </td><td>0.1 Hz</td><td>3.1 nV/rtHz</td><td>C</td></tr>
  <tr><td> </td><td>0.01 Hz</td><td>13.4 nV/rtHz</td><td>C,D</td></tr>
  <tr><td>Voltage Noise</td><td>0.1 Hz - 10 Hz</td><td>15 nV p-p</td><td>C</td></tr>
  <tr><td></td><td>0.01 Hz - 10 Hz</td><td>20 nV p-p</td><td>C</td></tr>
  <tr><td>Current Noise Density</td><td>0.1-1 Hz</td><td><2 fA/rtHz</td><td>E</td></tr>
  <tr><td>Input stage bias current</td><td></td><td>2.7 pA</td><td>F</td></tr>
  <tr><td>Input stage offset voltage</td><td></td><td>-94 uV</td><td>G</td></tr>
  <tr><td>-3dB Bandwidth</td><td>0R source impedance</td><td>2.8 MHz</td><td></td></tr>
  <tr><td>Input Capacitance</td><td>6k04 source impedance</td><td>140 pF</td><td>H</td></tr>
  <tr><td>10 kHz Low pass filter</td><td></td><td>4th order Butterworth</td><td></td></tr>
  <tr><td>10 Hz Low pass filter</td><td></td><td>4th order Butterworth</td><td></td></tr>
  <tr><td>THD</td><td>5 kHz</td><td><-70dB</td><td></td></tr>
  <tr><td>Quiescent Current</td><td>shorted input</td><td>30 mA</td><td></td></tr>
  <tr><td>Battery Capacity</td><td>Samsung 50S cells</td><td>5000 mA/h</td><td>nominal</td></tr>
  <tr><td>i_chg</td><td></td><td>2.7A</td><td></td></tr>
  <tr><td>Charger efficiency</td><td>V_Batt = 15V</td><td>98%</td><td>I</td></tr>
</table>

A: Full bandwidth, ADP-3450; B: 0.1-10 kHz bandwidth, ADP-3450; C: 0.01-10 Hz bandwidth, HP3458A; D: calc'd from measured value (9.5 nV/rtHz) and 3dB attenuation from HP filter; E: Calculated from open input VSD (100M resistor). Resulting noise was <0.1% from calculated value; F: Calculated from difference in offset voltage between 0R and 100M resistance to GND for input gate; G: Input gate shorted to GND; H: -3dB point with 6k04 resistor is 190 kHz. Primarily from board parasitics and RC damper; I: Measured on board, does not include cable losses

Spectra
-------

![WB_Noisefloor](https://github.com/curtisseizert/LowFreqLNA/assets/22351001/6304908f-1c2c-4e94-bb2f-d1c79696a5cc)
![10kHz noisefloor loglog](https://github.com/curtisseizert/LowFreqLNA/assets/22351001/e9fd5cee-e98b-4792-a22c-dabd757939f8)
![10Hz noisefloor loglog](https://github.com/curtisseizert/LowFreqLNA/assets/22351001/554053f5-d099-43b1-b52d-b93f1d3d05b2)
![Calibration spectrum](https://github.com/curtisseizert/LowFreqLNA/assets/22351001/3797b6e6-a104-45f1-ae12-9feeeed68480)
![0 1-10HzNoise](https://github.com/curtisseizert/LowFreqLNA/assets/22351001/5cd0d9fb-89c3-40e6-9c49-0ae6daa91421)
![0 01-10HzNoise](https://github.com/curtisseizert/LowFreqLNA/assets/22351001/eedb229e-2893-4a41-8cd9-a697555fcee9)



Application: Measuring voltage noise of voltage references
----------------------------------------------------------
Due to the low noise floor of the preamplifier, it can be used to easily measure the voltage noise of even the quietest (room temperature) references without error due to its own noise floor. Additionally, the use of polypropylene AC coupling capacitors with low dielectric absorption and the inclusion of the "SETTLE" feature allow measurement down to 10 mHz without excessive settling time. The plot below shows the voltage noise spectral density of several ADR1000-based 10-V references. Due to the high input impedance at low frequency, increasing the source impedance does not measurably change the gain of the amplifier. This is not the case with common 1000 uF/1k AC-coupled LNAs, which give considerable gain errors at even moderate source impedances (e.g., a 100 Ohm source impedance would give a gain error of 9.1%).

![ADR1000 selection VSDs](https://github.com/curtisseizert/LowFreqLNA/assets/22351001/cc7fbcfa-f066-428e-9f77-fbd01bc140b9)

Issues
------

1. Input capacitance is higher than I'd like, which reduces the bandwidth with high impeddance sources. Some of the capacitance is from board parasitics (ca. 100 pF), and some is from the R-C damper that is necessary to damp out oscillations with inductive sources (including most precision op amps). My plan to deal with this in the next revision is to modify the layout to reduce the board parasitics and switch in the R-C damper with an additional relay. Very little of the input capacitance is due to large Ciss of the paralleld JFETs as most of this presents as common mode capacitance and is bootstrapped by feedback. My target for input capacitance (with no R-C damper switched in) is 50 pF, but this is a lower priority than stability.
2. Second order (mostly) harmonic distortion of the ADA4622-2 buffer following the final HP filter stage leads to a DC offset term in the output. This is worst around 2 MHz and gets considerably worse with increasing ammplitude of the high frequency tone (it varies directly with the fourth power of the amplitude). The JFET switches are not a major issue (when SETTLE is off), which I have tested by removing them from the board. When SETTLE is on, it is worse, which negatively impacts settling time. As such, a 1 MHz sine wave amplitude modulated at 0.1 Hz will appear after 10 Hz LP filtering as a 0.1 Hz signal and harmonics, which is bad. The approach to this will be twofold: prefiltering and a composite buffer. Prefiltering will be described in #3. The composite buffer is a solution to a problem of a difficult convergence of design constraints: this buffer must have low Ib and current noise, reasonable common mode range (>+/-2.5V with 5.5V and -4.3V rails), low distortion at high frequency, and ability to operate on 10V total supply voltage with low quiescent current. To my knowledge, there are no monolithic amplifiers that satisfy these constraints. Without the high frequency distortion issue, only the ADA4622, OPAx191, and OPAx192 were good choices to my knowledge, but all of these lead to the distortion-induced offset issue. In simulation, a dual JFET follower feeding an ADA4805 does well with a total quiescent current of about 1.1 mA and <0.1 dB peaking. I will prototype this block and test it before committing to the design for the next revision.
3. Amplifying signals at full bandwidth limits dynamic range for LF noise analyses. I will address this by filtering prior to the final gain stages, probably with a single-pole RC filter. Another solution would be to have the LP filter stages operate at gain >1, but I would prefer not to take this tack because it would mean the gain error of the amplifier is dependent on which LP filter stage is switched in.
4. Input protection switching is inconsistent due to contact bounce. I did not think this would be an issue with the one-shots used for relay switching, but it is. For now, connecting the K1_SW signal to bouth GND and 3V3 with 22k resistors does the trick, but this is not ideal, so I will implement a more robust dual-inverter debounce block for all the relay switches. In practice, however, only K1 seems to be affected by this issue due to it being switched differently on the front panel.
5. The 0804 (4x0402) resistor arrays are a PITA and almost always need to be fixed after reflow, so I'll replace those with 1206 (4x0603) arrays.
6. The 2.2 uF PP caps used in the HP filters seem to radiate, which requires shielding the input HP filter caps (these need to be PP for leakage). This shielding increases input capacitance, so I will replace the 2.2 uF caps with a few paralleled 470nF C0G capacitors, which have sufficiently low leakage to nullify the modest DC offsets following each stage, even with low frequency breakpoints.


