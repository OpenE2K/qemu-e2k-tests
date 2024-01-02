#include "test_start.S"

#if __iset__ >= 3
    {
        setwd wsz=4, nfx=1
        subd,0 0, 1, %r0
        subd,1 0, 1, %r1
        subd,2 0, 1, %g16
    }
    {
        setwd wsz=8, nfx=0, dbl=0
        adds,0 0, 0, %r0
    }
    {
        adds,0 0, 0, %r1
        adds,1 0, 0, %g16
    }
        assert_eq_i64(%r0, 0xffffffff00000000)
        assert_eq_i64(%r1, 0xffffffff00000000)
        assert_eq_i64(%g16, 0xffffffff00000000)

    {
        setwd wsz=4, nfx=1
        subd,0 0, 1, %r0
        subd,1 0, 1, %r1
        subd,2 0, 1, %g16
    }
    {
        setwd wsz=8, nfx=0, dbl=1
        adds,0 0, 0, %r0
    }
    {
        adds,0 0, 0, %r1
        adds,1 0, 0, %g16
    }
        assert_eq_i64(%r0, 0)
        assert_eq_i64(%r1, 0)
        assert_eq_i64(%g16, 0)
#else
        skip_test
#endif

#include "test_end.S"
