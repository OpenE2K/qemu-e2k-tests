#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        disp %ctpr1, 0f
    }
    {
        addd,0 0, 0, %r0
        call %ctpr1, wbs=4
    }
        assert_eq_i64(%r0, 0xdeadbeef)

#include "test_end.S"

0:
        setwd wsz=8, nfx=1
        sys_access_hw_stacks GET_PROCEDURE_STACK_SIZE, 0, 0, 0, size
        ldd,0 [ size ], %g16
        subd,0 %g16, 256, %g16
        std,2 %g16, [ frame ]
        sys_access_hw_stacks WRITE_PROCEDURE_STACK_EX, frame, buf, 8
        assert_eq_i64(%r8, 0)
        return %ctpr3
        ct %ctpr3

    .data
    .balign 8
buf:
    .quad 0xdeadbeef
size:
    .quad 0
frame:
    .quad 0
