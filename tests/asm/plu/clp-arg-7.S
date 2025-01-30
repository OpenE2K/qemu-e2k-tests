#include "test_start.S"

// XXX: Probably it is UB, but CPUs execute it as expected for user.
//        skip_test

        cmpesb,0 0, 0, %pred0
        .word 0x000c0010    // HS
        .word 0x00004160    // PLS2, landp @p0, @p5, @p6
        .word 0x60605020    // PLS1, landp @p4, @p0, @p5
        .word 0x60604020    // PLS0, landp @p0, @p0, @p4

#include "test_end.S"
