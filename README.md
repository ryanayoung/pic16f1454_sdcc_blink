# pic16f1454_sdcc_blink

Just getting back into PIC programming, wanted to make a low part count hid mouse so chose the pic16f1454.  
I also wanted to go FOSS, so set up my sdcc toolchain, but had to learn how to program with that.(mainly the lack of a delay function.)  
So this is the results of an evening doing that should anyone else be looking for something similar.  

A lot of information was pulled from these links.

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

twitter post showing it working    
https://twitter.com/darkharlequin/status/1282208011096698882
