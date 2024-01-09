#include "test_start.S"

#if (defined(MAX_VER) && __iset__ <= MAX_VER) || \
    (defined(MIN_VER) && __iset__ >= MIN_VER)
    {
        setwd wsz=4, nfx=1
        addd,0 0, arr, %r0
        ldisp %ctpr2, aau
    }
        aaurwd,2 %r0, %aad0
        bap
        nop 7
        nop 7
        OP,0 area=0, ind=0, am=1, be=0, %r0
        addd,0 %r0, 0, %r0
#else
        skip_test
#endif

#include "test_end.S"

aau:
    {
        fapb ct=1, dcd=0, fmt=FMT, mrng=8, d=0, incr=0, ind=0, asz=1, abs=0, disp=0
    }

    .section ".rodata"
    .balign 2
    .byte 0
arr:
    .quad 0
