#include "test_start.S"

        setwd wsz=8, nfx=1
    // sdisp %ctpr1, 0x7ffffff
    .word 0x00004001
    .word 0x67ffffff
    {
        addd,0 0, 1, %r8
        addd,1 0, 0, %r9
        call %ctpr1, wbs=4
    }

#include "test_end.S"
