# tiny_blink
```sh
Really tiny blink (26 bytes only) and
blink2 (24 bytes) and
blink3 (22 bytes) and
blink4 (20 bytes) and
blink5 (18 bytes) and
blink6 (16 bytes) eah, the most tricky one
blink7 (14 bytes) am sorry (;
@tiny attiny13.

avr-gcc -nostartfiles -nodefaultlibs -flto -no-pie -fno-stack-protector -fno-pic -Wall -Os -mmcu=attiny13 -o blink blink6.S
avr-objcopy -O ihex blink blink.hex
avr-size blink.hex
   text	   data	    bss	    dec	    hex	filename
      0	     14	      0	     14	      e	blink.hex
```
![screenshot](blink.png)

```sh
disassembly of section .sec1:
00000000 <.sec1>:
   0:	b9 9a       	sbi	0x17, 1	; 23
   2:	31 97       	sbiw	r30, 0x01	; 1
   4:	31 97       	sbiw	r30, 0x01	; 1
   6:	f7 ff       	sbrs	r31, 7
   8:	e8 bb       	out	0x18, r30	; 24
   a:	e1 f7       	brne	.-8      	;  0x4
   c:	fa cf       	rjmp	.-12     	;  0x2
```
