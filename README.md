#Tiny blink code
```sh
blink  (26 bytes)
blink2 (24 bytes)
blink3 (22 bytes)
blink4 (20 bytes)
blink5 (18 bytes)
blink6 (16 bytes)
blink7 (14 bytes)
blink8 (10 bytes)
blink9 (6 bytes) LED between pins 3,4
@tiny attiny13.

avr-gcc -nostartfiles -nodefaultlibs -flto -no-pie -fno-stack-protector -fno-pic -Wall -Os -mmcu=attiny13 -o blink blink6.S
avr-objcopy -O ihex blink blink.hex
avr-size blink.hex
  text	   data	    bss	    dec	    hex	filename
      0	      6	      0	      6	      6	blink.hex
```
![screenshot](blink.png)

```sh
00000000 <.sec1>:
   0:	bc 9a       	sbi	0x17, 4	; 23
   2:	03 95       	inc	r16
   4:	08 bb       	out	0x18, r16	; 24
```
Use Linux utility xxd if the smallest compiler of yours is also preferred (;
```sh
$ xxd -r - blink.bin
bc9a039508bb
^D
avrdude -c usbasp -p attiny13 -B 500 -U lfuse:w:0x63:m -U hfuse:w:0xff:m  -U flash:w:blink.bin:r
```
That's all.
Blinking.
