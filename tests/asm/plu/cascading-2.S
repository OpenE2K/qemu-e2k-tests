#include "test_start.S"

// XXX: Probably it is UB, but CPUs execute it as expected for user.

    {
        cmpesb,0 0, 0, %pred0
        cmpesb,1 0, 0, %pred1
        cmpesb,3 0, 0, %pred2
        cmpesb,4 0, 0, %pred3
    }
        cmpesb,0 0, 1, %pred4
//     {
//         pass %pred0, @p0
//         pass %pred1, @p1
//         pass %pred2, @p2
//         pass %pred3, @p3
//         landp @p0, @p1, @p4
//         landp @p4, @p2, @p5
//         landp @p5, @p3, @p6
//         pass @p6, %pred4
//     }
        .word 0x000c0010
        .word 0x000054e4
        .word 0x62635080
        .word 0x60614040

        assert(%pred4)
        assert(%pred0)
        assert(%pred1)
        assert(%pred2)
        assert(%pred3)

#include "test_end.S"
