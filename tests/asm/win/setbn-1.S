#include "test_start.S"

    {
        setwd wsz=112, nfx=1
        setbn rsz=63, rbs=48, rcur=0
    }

        addd 0, 3, %b[0]
        addd 0, 4, %b[127]

        assert_eq_i64(%b[0],    3)
        assert_eq_i64(%b[127],  4)

        abn abnf=1, abnt=0

        assert_eq_i64(%b[2],    3)
        assert_eq_i64(%b[1],    4)

        abn abnf=1, abnt=0

        assert_eq_i64(%b[4],    3)
        assert_eq_i64(%b[3],    4)

#include "test_end.S"
