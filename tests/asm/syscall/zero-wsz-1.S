#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        sdisp %ctpr1, 0x3
    }
        call %ctpr1, wbs=8

#include "test_end.S"
