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
@tiny attiny13.

avr-gcc -nostartfiles -nodefaultlibs -flto -no-pie -fno-stack-protector -fno-pic -Wall -Os -mmcu=attiny13 -o blink blink6.S
avr-objcopy -O ihex blink blink.hex
avr-size blink.hex
  text	   data	    bss	    dec	    hex	filename
      0	     10	      0	     10	      a	blink.hex
```
![screenshot](blink.png)

```sh
0000000 <.sec1>:
   0:	b9 9a       	sbi	0x17, 1	; 23
   2:	31 97       	sbiw	r30, 0x01	; 1
   4:	f7 ff       	sbrs	r31, 7
   6:	e8 bb       	out	0x18, r30	; 24
   8:	fc cf       	rjmp	.-8      	;  0x2
```
Use Linux utility xxd if the smallest compiler of yours is also preferred (;
```sh
$ xxd -r - blink.bin
b99a3197f7ffe8bbfccf
^D
(if code starts from bc9a you may move a led shield to 3,4 pins and remove its spare wires)

avrdude -c usbasp -p attiny13 -B 50 -U lfuse:w:0x61:m -U hfuse:w:0xff:m  -U flash:w:blink.bin:r
```
That's all.
Blinking.
