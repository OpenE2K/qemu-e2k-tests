#include "test_start.S"

        sys_rt_sigaction SIGSEGV, act
        ldb,5 [ 0 ], %empty
        sys_exit 1

#include "test_end.S"

sig_handler:
        sys_exit 0

    .section ".rodata"
act:
    init_sigaction sig_handler
