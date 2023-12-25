#include "test_start.S"

        setwd wsz=8, nfx=1
        sys_access_hw_stacks GET_PROCEDURE_STACK_SIZE, 0, 0, 0, size
        assert_eq_i64(%r8, 0)
        ldd,0 [ size ], %g16
        assert_ne_i64(%g16, 0)

#include "test_end.S"

    .data
    .balign 8
    .byte 0
size:
    .quad 0
