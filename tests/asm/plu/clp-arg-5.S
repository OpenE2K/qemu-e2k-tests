#include "test_start.S"

// XXX: Probably it is UB, but CPUs execute it as expected for user.
//        skip_test

        cmpesb,0 0, 0, %pred0
        .word 0x000c0010    // HS
        .word 0x00005820    // PLS2, landp @p6, @p0, @p6
        .word 0x60600000    // PLS1
        .word 0x60600000    // PLS0

#include "test_end.S"
