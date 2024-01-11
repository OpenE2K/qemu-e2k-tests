#include "common/mmap.h"

// Arguments:
//  %r0 addr
//  %r1 len
//  %r2 prot
//  %r3 flags
//  %r4 fd
//  %r5 offset
    .global sys_mmap
    .type sys_mmap, #function
    .align 8
sys_mmap:
    {
        setwd wsz=8, nfx=1
        setbn rsz=3, rbs=4, rcur=0
        sdisp %ctpr1, 0x3
        nop 2
    }
    {
        addd,0 0, NR_mmap, %b[0]
        addd,1 0, %r0, %b[1]
        addd,2 0, %r1, %b[2]
        addd,3 0, %r2, %b[3]
        addd,4 0, %r3, %b[4]
        addd,5 0, %r4, %b[5]
    }
    {
        addd,1 0, %r5, %b[6]
        call %ctpr1, wbs=4
    }
    {
        return %ctpr3
        addd,0 0, %b[0], %r0
        nop 5
    }
    {
        ct %ctpr3
    }
    .size sys_mmap, . - sys_mmap
