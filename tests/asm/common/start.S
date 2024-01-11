#include "common.S"

    .global _start
    .type _start, #function
    .align 8
_start:
    {
        setwd wsz=8, nfx=1
        setbn rsz=3, rbs=4, rcur=0
        disp %ctpr1, test_entry
        nop 4
    }
        call %ctpr1, wbs=4
        exit_with_code
    .size _start, . - _start

    .section ".data"
    .global exit_code
    .type exit_code, #object
exit_code:
    .byte 0
    .size exit_code, . - exit_code
