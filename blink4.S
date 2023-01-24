; Copyright (c) 2023 ozforester. All rights reserved.
; Use of this source code is goverened by a MIT license
; that can be found in the LICENSE file.
; blinking led
; ATtiny13 (H:0xFF, L:0x71)
#undef __SFR_OFFSET
#define __SFR_OFFSET 0
#include <avr/io.h>
.global main
.section .text
main:		ldi r20, 0b11000100
		out WDTCR, r20
		sei
		ldi r20, 0x0f
		out DDRB, r20
		nop
loop:        	out PORTB, r20
		rjmp loop
swap r20
reti
.end
