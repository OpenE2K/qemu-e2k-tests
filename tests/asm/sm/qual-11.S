#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
    {
        cmpedb,0,sm 0, %r0, %pred0
        addd,1 0, 1, %r1
    }
        std,2,sm %r1, [ mem ] ? %pred0
        ldd,0 [ mem ], %r2
        assert_eq_i64(%r2, 0x4000000040000001)

#include "test_end.S"

    .data
    .balign 8
mem:
    .quad 0
