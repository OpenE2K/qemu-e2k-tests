#include "test_start.S"

        setwd wsz=8, nfx=1
        rrd,0 %pcsp.lo, %g16
        rrd,0 %pcsp.hi, %g17
    {
        andd,0 %g16, (1ULL << 48) - 1, %g16
        andd,1 %g17, (1ULL << 32) - 1, %g17
    }
        addd,0 %g16, %g17, %g16
        std,2 %g16, [ frame ]
        sys_access_hw_stacks GET_CHAIN_STACK_OFFSET, frame, 0, 0, offset
        assert_eq_i64(%r8, 0)

#include "test_end.S"

    .data
    .balign 8
frame:
    .quad 0
offset:
    .quad 0
