# pic16f1454_sdcc_blink

Just getting back into PIC programming, wanted to make a low part count hid mouse so chose the pic16f1454(but before we can usb hid, first we gotta blink).   
I also wanted to go FOSS, so set up my sdcc toolchain, but had to learn how to program with that.(mainly the lack of a delay function.)  
So this is the results of an evening doing that should anyone else be looking for something similar.  

twitter post showing it working    
https://twitter.com/darkharlequin/status/1282208011096698882


A lot of information was pulled from these links.
=========================================

Information on the delay function  
https://electronics.stackexchange.com/questions/226658/is-there-delay-ms-active-waiting-in-sdccstm8-mcu  
and an alternate   
https://sourceforge.net/p/sdcc/discussion/1865/thread/06684379/  

Getting started with sdcc  
https://youtu.be/PIixkvWPucw  

sdcc provided examples(except none of the configuration info was correct so had to google it and read the header file)  
https://github.com/diegoherranz/sdcc-examples  

some info on the sdcc configuration stuff  
https://sourceforge.net/p/sdcc/discussion/1865/thread/d65685a2/  
as well as "section 4.6.4 Configuration Bits" in the sdcc users guide  
http://sdcc.sourceforge.net/doc/sdccman.pdf  


Things learned setting up the tool chain:
=========================================

when installing sdcc and gputils, make sure to install them to a path without spaces in it.  By default it wanted to install to "C:\Program Files\sdcc" but mplab gets lost at that space.  I was able to install it on my second hard drive fine, but just put it at the root directory(D:\sdcc).  same for gputils.


Things learned using the pic16f1454 in a zif pic adaptor programming board
=========================================

I've got one of those zif socket universal adapter boards for pic programming, but they don't come with any instructions, and "universal" is pretty arguable.  Mainly for the pic16f1454 as it's high voltage and low voltage programming pins are in weird spots.  Basically you put it in the dip14 spot like normal, but when flashing you have to enable the low voltage programming pins.(other wise just abandon the zif socket and manually jumper the thing. it's honestly probably the easier solution.  
https://www.youtube.com/watch?v=hSkmPyhopRk
