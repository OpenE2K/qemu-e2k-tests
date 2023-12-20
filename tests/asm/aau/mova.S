#include "test_start.S"

#define ARR glue(arr_, OP)

#ifndef FMT
# define FMT 4
#endif

#ifndef MRNG
# define MRNG 8
#endif

    {
        setwd wsz=4, nfx=1
        rwd,0 (1UL << 37) | 8, %lsr
        ldisp %ctpr2, aau
    }
    {
        addd,0 0, ARR, %r0
        disp %ctpr1, 0f
    }
        aaurwd,2 %r0, %aad0
    {
        bap
        nop 7
    }
    {
        addd,0 0, 0, %r0
        nop 7
    }
0:
        OP,0 area=0, ind=0, am=1, be=0, %r1
    {
        alc alcf=0, alct=1
        addd,0 %r0, %r1, %r0
        ct %ctpr1 ? #NOT_LOOP_END
    }
        eap
        assert_eq_i64(%r0, 28)

#include "test_end.S"

aau:
    {
        fapb ct=1, dcd=0, fmt=FMT, mrng=MRNG, d=0, incr=0, ind=0, asz=1, abs=0, disp=0
    }

    .section ".rodata"

arr_movab:
    .byte 0
    .byte 1
    .byte 2
    .byte 3
    .byte 4
    .byte 5
    .byte 6
    .byte 7

    .balign 2
arr_movah:
    .hword 0
    .hword 1
    .hword 2
    .hword 3
    .hword 4
    .hword 5
    .hword 6
    .hword 7

    .balign 4
arr_movaw:
    .word 0
    .word 1
    .word 2
    .word 3
    .word 4
    .word 5
    .word 6
    .word 7

    .balign 8
arr_movad:
    .quad 0
    .quad 1
    .quad 2
    .quad 3
    .quad 4
    .quad 5
    .quad 6
    .quad 7
