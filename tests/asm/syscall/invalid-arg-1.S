#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        sdisp %ctpr1, 0x3
    }
        ldd,0,sm 0, 0, %r9
    {
        addd,0 0, NR_exit, %r8
        subd,1,sm %r9, %r9, %r9
    }
        call %ctpr1, wbs=4
        sys_exit 1

#include "test_end.S"
