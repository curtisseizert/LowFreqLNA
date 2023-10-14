# LowFreqLNA
A 0.01Hz-1+MHz low noise amplifier

![Amplifier assembled](https://github.com/curtisseizert/LowFreqLNA/assets/22351001/5cb4d507-83ab-44a3-b9a8-da4d0036aa29)


This repo contains the complete design files for a low noise AC coupled amplifier intended especially for characterization of 1/f noise of voltage references, DACs, etc. For broader applicability, it also has a reasonably high bandwidth of 2.5 MHz (measured, -3dB) at 60 or 80 dB gain, and about 1 MHz at 100 dB gain. Consistent with my primary use case for this amplifier, it has exceptionally low 1/f noise itself (measured at 3.2 nVRMS from 0.01-10 Hz) and a low broadband noise density of around 0.6 nV/rtHz. The quiescent current draw for the amplifier is about 30 mA, giving it a battery life of >100 h with the 4S 21700 Li batteries used to power the device. The project includes five PCBs:
(1) The main amplifier board
(2) The BMS board
(3) The SW board
(4) The front panel board
(5) The rear panel board/battery charger.

At present, I have hand assembled these using a converted toaster oven, which is a semi-onerous but doable-in-a-weekend task. As such, the BOMs are incomplete in all cases, which I will aim to rectify going forward. It is my hope that this will serve the needs of others designing voltage references, DACs, power supplies, etc. I may try to fix a couple things about this that have been bugging me, such as the lack of prefiltering and the antenna-like properties of the PP caps used in HP filters in the signal train. There is also a bit of room for reducing current draw. A fully differential version has been suggested, but if I work on that, I will make a separate repo for it.
