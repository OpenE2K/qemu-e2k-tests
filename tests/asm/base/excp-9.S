#include "test_start.S"

        sys_rt_sigaction SIGILL, act
        addd,0 0, 1, %g16
        invalid64 %g17
        cmpedb,0 %g17, 0, %pred0
    {
        stb,2 %g16, [ flag ]
        addd,0 0, 0, %empty ? %pred0
    }
        sys_exit 1

#include "test_end.S"

sig_handler:
        ldb,0 [ flag ], %g16
        assert_eq_i64(%g16, 0)
        exit_with_code

    .section ".rodata"
act:
    init_sigaction sig_handler

    .data
flag:
    .byte 0
