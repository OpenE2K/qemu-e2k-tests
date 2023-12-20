#include "test_start.S"

    {
        setwd wsz=112, nfx=1
        setbn rsz=63, rbs=48, rcur=0
    }
        addd 0, 1, %r1
        addd 0, 2, %r63

        assert_eq_i64(%r1,      1)
        assert_eq_i64(%r63,     2)

#include "test_end.S"
