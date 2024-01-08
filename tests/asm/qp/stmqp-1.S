#include "test_start.S"

#if __iset__ >= 5
    {
        setwd wsz=8, nfx=0
    }
    {
        addd,0 0, 0xffeeddccbbaa9988, %g16
        addd,1 0, [ mem ], %g17
    }
        qppackdl,0 %g16, 0x7766554433221100, %g16
        stmqp,2 %g16, %g17, 0xaa55
        ldqp,0 %g17, 0, %g18
        qpswitchd,0 %g18, %g19
        assert_eq_i64(%g18, 0x0066004400220000)
        assert_eq_i64(%g19, 0xff00dd00bb009900)

        stmqp,2 %g16, %g17, 0x55aa
        ldqp,0 %g17, 0, %g18
        qpswitchd,0 %g18, %g19
        assert_eq_i64(%g18, 0x7766554433221100)
        assert_eq_i64(%g19, 0xffeeddccbbaa9988)
#else
        skip_test
#endif

#include "test_end.S"

    .data
    .balign 16
mem:
    .fill 16, 1, 0
