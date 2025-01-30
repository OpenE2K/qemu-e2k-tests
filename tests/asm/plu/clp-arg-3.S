#include "test_start.S"

// XXX: Probably it is UB, but CPUs execute it as expected for user.
//        skip_test

        cmpesb,0 0, 0, %pred0
        .word 0x00080010    // HS
        .word 0x00000000
        .word 0x60605420    // PLS1, landp @p5, @p0, @p5
        .word 0x60600000    // PLS0

#include "test_end.S"
