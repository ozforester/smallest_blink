; Copyright (c) 2023 ozforester. All rights reserved.
; Use of this source code is goverened by a MIT license
; that can be found in the LICENSE file.
; blinking led
; ATtiny13 (H:0xFF, L:0x61)
#undef __SFR_OFFSET
#define __SFR_OFFSET 0
#include <avr/io.h>
.global main
.section .text
main:
; toggle led
ldi r18, 0x0f
out DDRB, r18 ; outs
loop: swap r18
out PORTB, r18
; delay
ser r24
mov r25,r24
l1: sbiw r24,1
brne l1
rjmp loop
.end
