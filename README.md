# tiny_blink
Very small blink program

avr-gcc -nostartfiles -nodefaultlibs -flto -no-pie -fno-stack-protector -fno-pic -Wall -Os -mmcu=attiny13 -o blink blink.S<br>
/usr/libexec/gcc/avr/ld: warning: -z now ignored<br>
avr-objcopy -O binary blink blink.bin<br>
avr-objcopy -O ihex blink blink.hex<br>
avr-size blink.hex<br>
   text	   data	    bss	    dec	    hex	filename<br>
      0	     26	      0	     26	     1a	blink.hex<br>
