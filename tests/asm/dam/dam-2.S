#include "test_start.S"

        setwd wsz=4, nfx=1
    {
        // Force page fault
        ldd,0,sm [ mem + 0 ], %empty
    }
    {
        ldd,0,sm [ mem ], %r0, mas=0x4
        addd,1 0, 0, %r1
    }
    {
        std,2 %r1, [ mem ]
        ldd,5 [ mem ], %r0, mas=0x3

        rbranch 1f
    }
0:
        assert_eq_i64(%r0, 0xdeadbeef)

#include "test_end.S"

1:
    {
        addd,0 0, 0xdeadbeef, %r0
        ibranch 0b
    }

    .data
    .balign 8
mem:
    .fill 8, 1, -1
