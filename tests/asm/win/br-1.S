#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        setbn rsz=3, rbs=4, rcur=0

        addd,0 0, 0, %r0
        addd,1 0, 0, %r1
        addd,2 0, 0, %r2
        addd,3 0, 0, %r3
        addd,4 0, 0, %r4
        addd,5 0, 0, %r5
    }
    {
        addd,0 0, 0, %r6
        addd,1 0, 0, %r7
        addd,2 0, 0, %r8
        addd,3 0, 0, %r9
        addd,4 0, 0, %r10
        addd,5 0, 0, %r11
    }
    {
        addd,0 0, 0, %r12
        addd,1 0, 0, %r13
        addd,2 0, 0, %r14
        addd,3 0, 0, %r15
    }
    {
        addd,0 0, 1, %b[0]
        abn abnf=1, abnt=0
    }
    {
        addd,0 0, 1, %b[0]
        abn abnf=0, abnt=1
        ibranch 0f
    }
0:
    {
        addd,0 0, 2, %b[0]
        abn abnf=1, abnt=0
    }
    {
        addd,0 0, 3, %b[0]
        abn abnf=1, abnt=0
    }

        assert_eq_i64(%r0,      0)
        assert_eq_i64(%r1,      0)
        assert_eq_i64(%r2,      0)
        assert_eq_i64(%r3,      0)
        assert_eq_i64(%r4,      0)
        assert_eq_i64(%r5,      0)
        assert_eq_i64(%r6,      0)
        assert_eq_i64(%r7,      0)
        assert_eq_i64(%r8,      1)
        assert_eq_i64(%r9,      0)
        assert_eq_i64(%r10,     3)
        assert_eq_i64(%r11,     0)
        assert_eq_i64(%r12,     2)
        assert_eq_i64(%r13,     0)
        assert_eq_i64(%r14,     1)
        assert_eq_i64(%r15,     0)
        assert_eq_i64(%b[0],    1)
        assert_eq_i64(%b[1],    0)
        assert_eq_i64(%b[2],    3)
        assert_eq_i64(%b[3],    0)
        assert_eq_i64(%b[4],    2)
        assert_eq_i64(%b[5],    0)
        assert_eq_i64(%b[6],    1)
        assert_eq_i64(%b[7],    0)

#include "test_end.S"
