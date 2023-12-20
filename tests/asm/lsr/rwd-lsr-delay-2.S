#include "test_start.S"

    {
        disp %ctpr1, 0f
        rwd,0 (1UL << 37) | 1, %lsr
        nop 3
    }
    {
        rwd,0 (1UL << 37) | 2, %lsr
        nop 3 // must be visible for ct
    }
    {
        alc alcf=1, alct=1
        ct %ctpr1 ? #NOT_LOOP_END
    }

#include "test_end.S"

0:
        exit(1)
