#include "test_start.S"

        setwd wsz=8, nfx=0
        shld,0 1, 63, %r0
    {
        movif,0 %r0, 0x4000, %r0
        movif,1 %r0, 0x4001, %r1
    }
        fxmulxx,0 %r0, %r1, %r2
        movfi,0 %r2, %r3
        assert_eq_i64(%r2, 0x8000000000000000)
        assert_eq_i32(%r3, 0x4002)

#include "test_end.S"
