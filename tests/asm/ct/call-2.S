#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        disp %ctpr1, 0f
    }
        call %ctpr1, wbs=16

#include "test_end.S"

0:
        return %ctpr3
        ct %ctpr3
