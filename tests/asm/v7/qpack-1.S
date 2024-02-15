#include "test_start.S"

#if __iset__ >= 7
        setwd wsz=4, nfx=1
    {
        addd,0 0, 0x0706050403020100, %g16
        addd,1 0, 0x0f0e0d0c0b0a0908, %g17
    }
    {
        addd,0 0, 0x7060504030201000, %g18
        addd,1 0, 0xf0e0d0c0b0a09080, %g19
    }
    {
        qppackdl,0 %g17, %g16, %g16
        qppackdl,1 %g19, %g18, %g17
    }
    {
        qpackhbss,0 %g16, %g17, %r0
        qpackhbus,1 %g16, %g17, %r1
        qpackwhss,3 %g16, %g17, %r2
        qpackwhus,4 %g16, %g17, %r3
    }
    {
        qpacksshb,1 %g16, %g17, %r4
        qpackushb,4 %g16, %g17, %r5
    }
    {
        qpacksswh,1 %g16, %g17, %r6
        qpackuswh,4 %g16, %g17, %r7
    }
        assert_eq_i64(%r0, %r4)
        assert_eq_i64(%r1, %r5)
        assert_eq_i64(%r2, %r6)
        assert_eq_i64(%r3, %r7)
    {
        qpswitchd,0 %r0, %r0
        qpswitchd,1 %r1, %r1
        qpswitchd,3 %r2, %r2
        qpswitchd,4 %r3, %r3
    }
    {
        qpswitchd,0 %r4, %r4
        qpswitchd,1 %r5, %r5
        qpswitchd,3 %r6, %r6
        qpswitchd,4 %r7, %r7
    }
        assert_eq_i64(%r0, %r4)
        assert_eq_i64(%r1, %r5)
        assert_eq_i64(%r2, %r6)
        assert_eq_i64(%r3, %r7)
#endif

#include "test_end.S"
