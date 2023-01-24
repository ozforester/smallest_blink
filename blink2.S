; Copyright (c) 2023 ozforester. All rights reserved.
; Use of this source code is goverened by a MIT license
; that can be found in the LICENSE file.
; blinking led (24 bytes/ 12 instructions)
; ATtiny13 (H:0xFF, L:0x61)
#undef __SFR_OFFSET
#define __SFR_OFFSET 0
#include <avr/io.h>
.global main
.section .text
main:
; toggle led
in r16, PINB
ldi r17, (1<<PB1)
out DDRB, r17
eor r16, r17
out PORTB, r16
; delay
ldi r16, 255
l1:
  ldi r17, 255
  l2: dec r17
  brne l2
dec r16
brne l1
rjmp main
.end
