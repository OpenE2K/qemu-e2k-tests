#include "test_start.S"

    {
        setwd wsz=4, nfx=1
        disp %ctpr1, 1f
    }
        disp %ctpr3, 0f
        call %ctpr1, wbs=4
0:

#include "test_end.S"

1:
        ct %ctpr3
