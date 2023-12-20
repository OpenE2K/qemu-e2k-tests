#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        setbn rsz=3, rbs=4, rcur=0
        disp %ctpr1, 0f
    }
    {
        cmpedb,0 0, 0, %pred0
        call %ctpr1, wbs=4
    }

#include "test_end.S"

0:
    {
        addd,0 0, 0, %r0 ? %pred0
        return %ctpr3
    }
        ct %ctpr3
