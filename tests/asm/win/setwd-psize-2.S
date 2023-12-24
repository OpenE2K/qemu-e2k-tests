#include "test_start.S"

    {
        setwd wsz=16, nfx=1
        disp %ctpr1, 0f
    }
    {
        // psize = (16 - 4) * 2 = 24 regs
        call %ctpr1, wbs=4
    }

#include "test_end.S"

0:
    // psize = 24
    {
        // try to set wsz lower than psize
        setwd wsz=4, nfx=1
        return %ctpr3
    }
        ct %ctpr3
