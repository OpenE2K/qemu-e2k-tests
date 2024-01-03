#include "test_start.S"

    // TODO: related to system emulation
        skip_test

        sys_rt_sigaction SIGSEGV, act
        addd,0 0, 1, %g16
    {
        stb,2 %g16, [ flag ]
        ldb,5 [ 0 ], %empty
    }
        sys_exit 1

#include "test_end.S"

sig_handler:
        ldb,0 [ flag ], %g16
        assert_eq_i64(%g16, 1)
        exit_with_code

    .section ".rodata"
act:
    init_sigaction sig_handler

    .data
flag:
    .byte 0
