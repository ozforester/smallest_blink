# tiny_blink
Very small blink program

avr-gcc -nostartfiles -nodefaultlibs -flto -no-pie -fno-stack-protector -fno-pic -Wall -Os -mmcu=attiny13 -o blink blink.S
/usr/libexec/gcc/avr/ld: warning: -z now ignored
avr-objcopy -O binary blink blink.bin
avr-objcopy -O ihex blink blink.hex
avr-size blink.hex
   text	   data	    bss	    dec	    hex	filename
      0	     26	      0	     26	     1a	blink.hex
