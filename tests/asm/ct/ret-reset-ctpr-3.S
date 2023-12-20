#include "test_start.S"

    {
        setwd wsz=4, nfx=1
        disp %ctpr3, 1f
    }
        call %ctpr3, wbs=4
        ct %ctpr3

#include "test_end.S"

1:
        return %ctpr3
        ct %ctpr3
