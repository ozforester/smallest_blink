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
; port
sbi DDRB, PB1 ; outs
loop:
; delay
ser r24
mov r25,r24
l1: sbiw r24,1
sbrs r25, 7
out PORTB, r24
brne l1
rjmp loop
.end
