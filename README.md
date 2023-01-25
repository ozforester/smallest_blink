# tiny_blink
```sh
Really tiny blink (26 bytes only) and
blink2 (24 bytes) and
blink3 (22 bytes) and
blink4 (20 bytes) and
blink5 (18 bytes) and
blink6 (16 bytes) eah, the most tricky one (;
@tiny attiny13.
```
1. The most of registers stay untouched.
2. All free vector space except wdt is used as a part of text section.

```sh
avr-gcc -nostartfiles -nodefaultlibs -flto -no-pie -fno-stack-protector -fno-pic -Wall -Os -mmcu=attiny13 -o blink blink6.S
avr-objcopy -O ihex blink blink.hex
avr-size blink.hex
   text	   data	    bss	    dec	    hex	filename
      0	     16	      0	     16	     10	blink.hex
```
![screenshot](blink.png)

```sh
isassembly of section .sec1:

00000000 <.sec1>:
   0:	b9 9a       	sbi	0x17, 1	; 23
   2:	8f ef       	ldi	r24, 0xFF	; 255
   4:	98 2f       	mov	r25, r24
   6:	01 97       	sbiw	r24, 0x01	; 1
   8:	97 ff       	sbrs	r25, 7
   a:	88 bb       	out	0x18, r24	; 24
   c:	e1 f7       	brne	.-8      	;  0x6
   e:	f9 cf       	rjmp	.-14     	;  0x2
```
