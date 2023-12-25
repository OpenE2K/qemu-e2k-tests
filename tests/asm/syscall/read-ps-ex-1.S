#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        disp %ctpr1, 0f
    }
    {
        addd,0 0, 0xdeadbeef, %r8
        addd,1 0, 8, %r9
        call %ctpr1, wbs=4
    }

#include "test_end.S"

0:
    {
        setwd wsz=8, nfx=1
        disp %ctpr1, 0b
    }
    {
        cmpedb,0 %r1, 0, %pred0
        addd,1 0, 0xdeadbeef, %r8
        subd,2 %r1, 1, %r9
    }
        call %ctpr1, wbs=4 ? ~%pred0
        ibranch 0f ? ~%pred0

        sys_access_hw_stacks GET_PROCEDURE_STACK_SIZE, 0, 0, 0, size
        ldd,0 [ size ], %g16
        subd,0 %g16, 128, %g16
        std,2 %g16, [ frame ]
        sys_access_hw_stacks READ_PROCEDURE_STACK_EX, frame, buf, 128
        ldd,0 0, buf, %g16
        assert_eq_i64(%g16, 0xdeadbeef)
0:
        return %ctpr3
        ct %ctpr3

    .data
    .balign 8
buf:
    .fill 64, 1, 0
size:
    .quad 0
frame:
    .quad 0
