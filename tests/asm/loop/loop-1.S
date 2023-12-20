#include "test_start.S"

    {
        setwd wsz=12, nfx=1
        setbn rsz=7, rbs=4, rcur=0

        rwd,0 LSR_LCNT(8) | LSR_VLC | LSR_PCNT(5) | LSR_ECNT(6), %lsr

        disp %ctpr1, 0f
    }
    {
        addd,0 0, 0, %b[2]
        subd,1 0, buffer, %b[4]
        subd,2 0, buffer, %b[6]
        subd,3 0, buffer, %b[8]
        subd,4 0, buffer, %b[10]
        subd,5 0, buffer, %b[12]
    }
0:
    {
        loop_mode

        alc alcf=0, alct=1
        abn abnf=0, abnt=1

        addd,1 %b[2], 1, %b[0]
        ldb,0,sm %b[2], buffer, %b[3]
        addd,3,sm %b[9], %b[8], %b[9]
        // store must not be executed in prologue
        stb,2 %b[13], [ %b[12] + buffer ]

        ct %ctpr1 ? #NOT_LOOP_END
    }
    {
        ldd,0 0, [ buffer + 0 ], %r0
        ldd,2 0, [ buffer + 8 ], %r1
    }
        assert_eq_i64(%r0, 0x0706050403020100)
        assert_eq_i64(%r1, 0x0000000000000000)

#include "test_end.S"

    .data
buffer:
    .fill 16, 1, 0
