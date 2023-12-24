#include "test_start.S"

        setwd wsz=8, nfx=1

        disp %ctpr1, 0f
        // psize = (8 - 4) * 2 = 8 regs
        call %ctpr1, wbs=4

        disp %ctpr1, 0f
        // psize = (8 - 8) * 2 = 0 regs
        call %ctpr1, wbs=8

#include "test_end.S"

0:
    {
        setwd wsz=4, nfx=1
        return %ctpr3
    }
        ct %ctpr3
