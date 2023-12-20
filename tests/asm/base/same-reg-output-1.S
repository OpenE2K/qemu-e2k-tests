#include "test_start.S"

    {
        addd,0 0, 0, %g16
        addd,1 0, 1, %g16
        addd,2 0, 2, %g16
        addd,3 0, 3, %g16
        addd,4 0, 4, %g16
        addd,5 0, 5, %g16
    }
        assert_eq_i64(%g16, 5)
    {
        ldb,0,sm 0, 0, %g16
        addd,1 0, 1, %g16
        addd,2 0, 2, %g16
        addd,3 0, 3, %g16
        addd,4 0, 4, %g16
        addd,5 0, 5, %g16
    }
        assert_eq_i64(%g16, 5)
    {
        addd,0 0, 0, %g16
        addd,1 0, 1, %g16
        addd,2 0, 2, %g16
        addd,3 0, 3, %g16
        addd,4 0, 4, %g16
        udivd,5 5, 1, %g16
    }
        assert_eq_i64(%g16, 5)

#include "test_end.S"
