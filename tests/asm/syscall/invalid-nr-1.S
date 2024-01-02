#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        sdisp %ctpr1, 0x3
    }
        ldd,0,sm 0, 0, %r8
        subd,0,sm %r8, %r8, %r8
    {
        addd,0,sm %r8, NR_exit, %r8
        addd,1 0, 1, %r9
    }
        call %ctpr1, wbs=4

#include "test_end.S"
