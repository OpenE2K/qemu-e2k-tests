#include "test_start.S"

    {
        setwd wsz=4, nfx=1
        disp %ctpr1, 0f
        addd,0 0, 0, %r0
    }
    {
        addd,0 0, out8, %r4
        addd,1 0, out16, %r5
        aaurwd,2 %r0, %aasti0
        aaurwd,5 %r0, %aasti1
    }
    {
        addd,0 0, out32, %r6
        addd,1 0, out64, %r7
        aaurwd,2 %r0, %aasti2
        aaurwd,5 %r0, %aasti3
    }
    {
        aaurwd,2 %r4, %aad0
        aaurwd,5 %r5, %aad1
    }
    {
        aaurwd,2 %r6, %aad2
        aaurwd,5 %r7, %aad3
    }
        rwd,0 ((1UL << 37) | 8), %lsr
0:
    {
        staab,2 %r0, %aad0 [ %aasti0 ]
        incr,2 %aaincr0
        staah,5 %r0, %aad1 [ %aasti1 ]
        incr,5 %aaincr0
    }
    {
        addd,0 %r0, 1, %r0
        staaw,2 %r0, %aad2 [ %aasti2 ]
        incr,2 %aaincr0
        staad,5 %r0, %aad3 [ %aasti3 ]
        incr,5 %aaincr0
        alc alcf=1, alct=1
        ct %ctpr1 ? #NOT_LOOP_END
    }

        assert_eq_i64(%r0, 8)

        ldd,0 [ out8 ], %r0
        assert_eq_i64(%r0, 0x0706050403020100)

    {
        ldd,0 [ out16 + 0x00 ], %r0
        ldd,2 [ out16 + 0x08 ], %r1
    }
        assert_eq_i64(%r0, 0x0003000200010000)
        assert_eq_i64(%r1, 0x0007000600050004)

    {
        ldd,0 [ out32 + 0x00 ], %r0
        ldd,2 [ out32 + 0x08 ], %r1
    }
    {
        ldd,0 [ out32 + 0x10 ], %r2
        ldd,2 [ out32 + 0x18 ], %r3
    }
        assert_eq_i64(%r0, 0x0000000100000000)
        assert_eq_i64(%r1, 0x0000000300000002)
        assert_eq_i64(%r2, 0x0000000500000004)
        assert_eq_i64(%r3, 0x0000000700000006)

    {
        ldd,0 [ out64 + 0x00 ], %r0
        ldd,2 [ out64 + 0x08 ], %r1
    }
    {
        ldd,0 [ out64 + 0x10 ], %r2
        ldd,2 [ out64 + 0x18 ], %r3
    }
    {
        ldd,0 [ out64 + 0x20 ], %r4
        ldd,2 [ out64 + 0x28 ], %r5
    }
    {
        ldd,0 [ out64 + 0x30 ], %r6
        ldd,2 [ out64 + 0x38 ], %r7
    }
        assert_eq_i64(%r0, 0x0000000000000000)
        assert_eq_i64(%r1, 0x0000000000000001)
        assert_eq_i64(%r2, 0x0000000000000002)
        assert_eq_i64(%r3, 0x0000000000000003)
        assert_eq_i64(%r4, 0x0000000000000004)
        assert_eq_i64(%r5, 0x0000000000000005)
        assert_eq_i64(%r6, 0x0000000000000006)
        assert_eq_i64(%r7, 0x0000000000000007)

#include "test_end.S"

    .section ".data"
out8:
    .fill 8, 1, -1
out16:
    .fill 8, 2, -1
out32:
    .fill 8, 4, -1
out64:
    .fill 8, 8, -1
