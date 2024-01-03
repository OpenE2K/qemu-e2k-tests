#include "test_start.S"

        disp %ctpr1, 0f
        rwd,0 (1 << 48) | (1UL << 37) | 1, %lsr
        invalid64 %g16
        cmpedb,0,sm 0, %g16, %pred0
        ct %ctpr1 ? %pred0 && #NOT_LOOP_END
0:

#include "test_end.S"
