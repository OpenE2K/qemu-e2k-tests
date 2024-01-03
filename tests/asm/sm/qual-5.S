#include "test_start.S"

        rwd,0 (1 << 48) | (1UL << 37) | 1, %lsr
        invalid64 %g16
        cmpedb,0,sm 0, %g16, %pred0
    {
        loop_mode
        addd,0 0, 0, %empty ? %pred0, %pcnt0
    }

#include "test_end.S"
