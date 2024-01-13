#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        setbn rsz=3, rbs=4, rcur=0
    }
    {
        ldd,0 [ mem ], %empty
    }
    {
        addd,1 0, 0, %r8
        addd,2 0, 0, %r9
    }
    {
        ldd,0 [ mem ], %r8
        ldd,2 [ mem ], %r9
    }
    {
        addd,0 %b[0], 0, %r0
        addd,2 %b[1], 0, %r1
    }
        assert_eq_i64(%r0, 0xdeadbeef)
        assert_eq_i64(%r1, 0xdeadbeef)

#include "test_end.S"

    .section ".rodata"
mem:
    .quad 0xdeadbeef
