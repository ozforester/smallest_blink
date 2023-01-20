; Copyright (c) 2023 ozforester. All rights reserved.
; Use of this source code is goverened by a MIT license
; that can be found in the LICENSE file.
; blinking led
; ATtiny13 (H:0xFF, L:0x71)
#undef __SFR_OFFSET
#define __SFR_OFFSET 0
#include <avr/io.h>
.global main
.global watchdog
.section .vectors
vector_table:	ldi r21, (1<<PB1)
		out DDRB, r21
		rjmp main
		watchdog: in r16, PINB
        	ldi r17, (1<<PB1)
        	eor r16, r17
        	out PORTB, r16
		reti
rjmp watchdog
.section .text
main:   ldi r20, 0b11000100            ; sec/4
        out WDTCR, r20                 ;
	sei
	loop: rjmp loop
.end
