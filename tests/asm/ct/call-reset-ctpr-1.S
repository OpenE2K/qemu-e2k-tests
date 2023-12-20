#include "test_start.S"

    {
        setwd wsz=4, nfx=1
        disp %ctpr2, 1f
    }
        disp %ctpr1, 0f
        call %ctpr2, wbs=4
0:

#include "test_end.S"

1:
        ct %ctpr1
