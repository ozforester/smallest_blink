# tiny_blink
Really tiny blink (26 bytes only) 
blink2 (24 bytes)
blink3 (22 bytes)
blink4 (20 bytes)
blink5 (18 bytes)
@tiny attiny13.

1. The most of registers stay untouched.
2. All free vector space except wdt is used as a part of text section.

```sh
avr-gcc -nostartfiles -nodefaultlibs -flto -no-pie -fno-stack-protector -fno-pic -Wall -Os -mmcu=attiny13 -o blink blink.S

avr-objcopy -O ihex blink blink.hex

avr-size blink.hex
   text	   data	    bss	    dec	    hex	filename
      0	     26	      0	     26	     1a	blink.hex

```
![screenshot](blink.png)

```sh
avr-objdump -m avr -D blink.hex

blink.hex:     file format ihex


Disassembly of section .sec1:

00000000 <.sec1>:
   0:	52 e0       	ldi	r21, 0x02	; 2
   2:	57 bb       	out	0x17, r21	; 23
   4:	06 c0       	rjmp	.+12     	;  0x12
   6:	06 b3       	in	r16, 0x16	; 22
   8:	12 e0       	ldi	r17, 0x02	; 2
   a:	01 27       	eor	r16, r17
   c:	08 bb       	out	0x18, r16	; 24
   e:	18 95       	reti
  10:	fa cf       	rjmp	.-12     	;  0x6
  12:	44 ec       	ldi	r20, 0xC4	; 196
  14:	41 bd       	out	0x21, r20	; 33
  16:	78 94       	sei
  18:	ff cf       	rjmp	.-2      	;  0x18

```
