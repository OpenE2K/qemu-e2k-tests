#include "test_start.S"

    {
        setwd wsz=16, nfx=1
        setbn rsz=7, rbs=8, rcur=0
        disp %ctpr1, 0f
    }
    {
        addd,0 0, 0xff, %b[0]
        addd,1 0, 16, %b[1]
        addd,2 0, 0, %b[2]
        call %ctpr1, wbs=8
    }
        assert_eq_i64(%b[0], 0xff)
        assert_eq_i64(%b[1], 0x10)
        assert_eq_i64(%b[2], 0xff0000)

#include "test_end.S"

0:
    {
        shls,0,sm %r0, %r1, %r2
        return %ctpr3
    }
        ct %ctpr3
