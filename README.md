# jellyfish

## C= BASIC Many DOS Disk content show/edit

### This project idea is inspired from the many BAM readers and Sector Editors for the C=64.

I found that most reader/editors were for a specific drive type like the vanilla 1541 or 1581.
However, I was interested in seeing the BAM and sectors on my CMD 3.5 floppy.
In finding out how to read a sector and the BAM from a CMD formatted disk,
I found that there were ways to see the emulated partitions on the CMD and the RAW partition formats.

I want to create a BAM/Sector Display/Editor that will be able work on the 1541 **and** other drives as well.

####Goals:

A. Be able to identify and read from any connected device either IEC or IEEE488
  * SFD-1001
  * MSD SD1/SD2
  * VIC-1540
  * VIC-1541/1541/1541c/1541-II
  * EN-2000
  * Indus GT
  * OC-118N/Excelerator+Plus
  * 1551 (probably 264 class only)
  * 1570
  * 1571
  * 1581
  * CBM 2031
  * CBM 4040
  * CBM 8050
  * CBM 8250
  * CMD FD-2000/4000
  * CMD HD-4GB
  * SD2IEC
  * Others...
  
B. Try and make the code portable to as many C= computers as possible
  * PET 4000/8000 series
  * B128
  * VIC-20
    (22 columns will be hard to do, 40 columns is already compressed.)
  * C=16/Plus4
  * C=64/SX
  * C=128
  * Emulators?
