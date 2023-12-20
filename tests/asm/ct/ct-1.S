#include "test_start.S"

        disp %ctpr1, 1f
        disp %ctpr2, 2f
        disp %ctpr3, 3f
        ct %ctpr2
1:
    {
        addd,0 %r0, 1, %r1
        ct %ctpr3
    }
2:
    {
        addd,0 0, 0, %r0
        ct %ctpr1
    }
3:
        addd,0 %r1, 1, %r2

        assert_eq_i64(%r0, 0)
        assert_eq_i64(%r1, 1)
        assert_eq_i64(%r2, 2)

#include "test_end.S"
