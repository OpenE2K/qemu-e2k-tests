#include "test_start.S"

// XXX: Probably it is UB, but CPUs execute it as expected for user.
//        skip_test

        cmpesb,0 0, 0, %pred0
        .word 0x00080010    // HS
        .word 0x00000000    // PLS2
        .word 0x60600000    // PLS1
        .word 0x60604820    // PLS0, landp @p2, @p0, @p4

#include "test_end.S"
