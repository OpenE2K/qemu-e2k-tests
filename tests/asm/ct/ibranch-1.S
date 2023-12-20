#include "test_start.S"

    {
        ibranch 3f
    }
0:
    {
        addd,0 %r0, 1, %r1
        ibranch 2f
    }
1:
    {
        addd,0 %r2, 1, %r3
        ibranch 4f
    }
2:
    {
        addd,0 %r1, 1, %r2
        ibranch 1b
    }
3:
    {
        addd,0 0, 0, %r0
        ibranch 0b
    }
4:
        assert_eq_i64(%r0, 0)
        assert_eq_i64(%r1, 1)
        assert_eq_i64(%r2, 2)
        assert_eq_i64(%r3, 3)

#include "test_end.S"
