#include "test_start.S"

#ifndef MIN_VER
#define MIN_VER 5
#endif

#ifndef MAX_VER
# define MAX_VER 99
#endif

#if __iset__ >= MIN_VER && __iset__ < MAX_VER
    {
        setwd wsz=8, nfx=0
    }
        qppackdl,0 0, 0, %g16
        addd,1 0, [ mem ], %g17
        stmqp,2 %g16, %g17, 0xaa55
#else
        skip_test
#endif

#include "test_end.S"

    .data
    .balign 16
    .fill 8, 1, 0
mem:
    .fill 16, 1, 0
