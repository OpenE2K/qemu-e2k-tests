#include "test_start.S"

        setwd wsz=8, nfx=0
        addd,0 0, 0xaaaaaaaa, %g16
        movif %g16, 0xbeef, %g17
        movfi %g17, %g18
        assert_eq_i64(%g17, 0xaaaaaaaa)
        assert_eq_i32(%g18, 0xbeef)

#include "test_end.S"
