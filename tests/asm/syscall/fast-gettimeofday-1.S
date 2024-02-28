#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        setbn rsz=3, rbs=4, rcur=0
    }
    {
        addd,0 0, NR_fast_sys_gettimeofday, %b[0]
        sdisp %ctpr1, 0x6
    }
    {
        addd,1 0, tv, %b[1]
        addd,2 0, tz, %b[2]
        call %ctpr1, wbs=4
    }

#include "test_end.S"

    .data
    .balign 8
tv:
    .fill 16, 1, 0
tz:
    .fill 16, 1, 0

