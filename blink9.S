; Copyright (c) 2023 ozforester. All rights reserved.
; Use of this source code is goverened by a MIT license
; that can be found in the LICENSE file.
; blinking led
; ATtiny13 (H:0xFF, L:0x63)
#undef __SFR_OFFSET
#define __SFR_OFFSET 0
#include <avr/io.h>
.global main
.section .text
main:
sbi DDRB, PB4
inc r16
out PORTB, r16
.end
