#include "test_start.S"

        setwd wsz=8, nfx=1

    .macro loop r, p=0, l=0, e=0, s=0
    {
        rwd,0 (\s << 53) | (\p << 48) | (1UL << 37) | (\e << 32) | \l, %lsr
        addd,1 0, 0, \r
        disp %ctpr1, 0f
        nop 4
    }
0:
        addd,0 \r, 1, \r
        alc alcf=1, alct=1
        ct %ctpr1 ? #NOT_LOOP_END
    .endm

        loop %r1, 0UL, 0, 0UL
        loop %r2, 0UL, 1, 0UL
        loop %r3, 0UL, 2, 0UL
        loop %r4, 0UL, 3, 0UL
        loop %r5, 4UL, 8, 0UL
        loop %r6, 8UL, 2, 0UL
        loop %r7, 4UL, 8, 2UL
        loop %r8, 4UL, 0, 8UL

        assert_eq_i64(%r1, 0x1)
        assert_eq_i64(%r2, 0x1)
        assert_eq_i64(%r3, 0x1)
        assert_eq_i64(%r4, 0x2)
        assert_eq_i64(%r5, 0x7)
        assert_eq_i64(%r6, 0x1)
        assert_eq_i64(%r7, 0x9)
        assert_eq_i64(%r8, 0x8)

#include "test_end.S"
