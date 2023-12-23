#include "test_start.S"

// XXX: Probably it is UB, but CPUs execute it as expected for user.

    {
        cmpesb,0 0, 0, %pred0
        cmpesb,1 0, 1, %pred1
    }
//    {
//        pass %pred0, @p2
//        pass %pred0, @p3
//        landp @p2, @p3, @p4
//        pass @p4, %pred4
//    }
        .word 0x00080010
        .word 0x00000000
        .word 0x60600000
        .word 0x000008e1
        assert(%pred0)
        assert(%pred1)

#include "test_end.S"
