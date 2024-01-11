#include "test_start.S"

    // TODO: related to system emulation
        skip_test

        sys_rt_sigaction SIGSEGV, act
    {
        setwd wsz=8, nfx=1
        rrd,0 %psp.lo, %g16
    }
    {
        rrd,0 %psp.hi, %g16
        std,2 %g16, 0, psp
    }
    {
        addd,0 0, 0, %r0
        addd,1 0, 0, %r1
        std,2 %g16, 8, psp
        addd,3 0, 0, %r2
    }
    {
        ldd,0 0, 0, %empty
        ldd,2 0, mem, %r0
        ldd,3 8, mem, %r1
        ldd,5 16, mem, %r2
    }
        sys_exit 1

#include "test_end.S"

sig_handler:
        cmpbdb,0 __iset__, 5, %pred0

        ldd,0 8, psp, %g16
        andd,0 %g16, (1ULL << 32) - 1, %g16
        std,2 %g16, [ frame ]
        sys_access_hw_stacks READ_PROCEDURE_STACK_EX, frame, buf, 64
    {
        ldd,0 [ mem ], %g16
        ldd,2 [ buf ], %g17
    }
        assert_eq_i64(%g16, %g17)
    {
        ldd,0 [ mem + 8 ], %g16
        ldd,2 8, buf, %g17 ? %pred0
        ldd,3 16, buf, %g17 ? ~%pred0
    }
        assert_eq_i64(%g16, %g17)
    {
        ldd,0 [ mem + 16 ], %g16
        ldd,2 [ buf + 32 ], %g17
    }
        assert_eq_i64(%g16, %g17)
        exit_with_code

    .section ".rodata"
act:
    init_sigaction sig_handler
mem:
    .quad 0xdeadbeef
    .quad 0xbeefdead
    .quad 0xaaaaaaaa

    .data
    .balign 8
buf:
    .fill 64, 1, 0
size:
    .quad 0
frame:
    .quad 0
psp:
    .quad 0
    .quad 0
