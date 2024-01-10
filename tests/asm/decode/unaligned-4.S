#include "test_start.S"

#if __LCC__ < 120
    {
        setwd wsz=4, nfx=1
        disp %ctpr1, 1f
    }
        call %ctpr1, wbs=4

#include "test_end.S"

    .balign 8
    .byte 0
1:
        return %ctpr3
        ct %ctpr3
#else
        skip_test
#include "test_end.S"
#endif
