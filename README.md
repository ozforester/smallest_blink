# tiny_blink
Really tiny blink  on tiny attiny13.

1. The most default register values stays untouched.
2. All free vector space except WDT used as part of text section.

avr-gcc -nostartfiles -nodefaultlibs -flto -no-pie -fno-stack-protector -fno-pic -Wall -Os -mmcu=attiny13 -o blink blink.S<br>

avr-objcopy -O ihex blink blink.hex<br>

avr-size blink.hex<br>
   text	   data	    bss	    dec	    hex	filename<br>
      0	     26	      0	     26	     1a	blink.hex<br>

![screenshot](blink.png)
