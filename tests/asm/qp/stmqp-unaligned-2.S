#include "test_start.S"
#if __iset__ >= 5
    {
        setwd wsz=8, nfx=0
    }
        qppackdl,0 0, 0, %g16
        addd,1 0, [ mem ], %g17
        stmqp,2 %g16, %g17, 0xaa55
#endif
#include "test_end.S"

    .data
    .balign 16
    .fill 1, 1, 0
mem:
    .fill 16, 1, 0
