#include "test_start.S"

    {
        setwd wsz=4, nfx=1
        disp %ctpr3, 0f
    }
        invalid64 %g16
        cmpedb,0,sm 0, %g16, %pred0
        call %ctpr3, wbs=4 ? %pred0

#include "test_end.S"

0:
        return %ctpr3
        ct %ctpr3
