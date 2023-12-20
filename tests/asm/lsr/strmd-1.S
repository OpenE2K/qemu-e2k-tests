#include "test_start.S"

    {
        setwd wsz=4, nfx=1
        addd,0 0, 0, %r0
        addd,1 0, 0, %r1
        addd,2 0, .Lmem, %r2
    }

    .macro strmd v=0, p=0, l=0, e=0, s=0
        rwd (\s << 53) | (\p << 48) | (\v << 37) | (\e << 32) | \l, %lsr
    {
        loop_mode
        stb %r0, [ %r2 ]
        stb %r1, [ %r2 ]
    }
        addd %r2, 1, %r2
    .endm

        strmd 0UL, 0UL, 0, 0UL, 0UL

        strmd 0UL, 0UL, 0, 0UL, 1UL
        strmd 0UL, 0UL, 0, 1UL, 0UL
        strmd 0UL, 0UL, 1, 0UL, 0UL
        strmd 0UL, 1UL, 0, 0UL, 0UL
        strmd 1UL, 0UL, 0, 0UL, 0UL

        strmd 0UL, 0UL, 0, 0UL, 1UL
        strmd 0UL, 0UL, 0, 1UL, 1UL
        strmd 0UL, 0UL, 1, 0UL, 1UL
        strmd 0UL, 1UL, 0, 0UL, 1UL
        strmd 1UL, 0UL, 0, 0UL, 1UL
        strmd 0UL, 0UL, 0, 0UL, 1UL

        strmd 1UL, 0UL, 0, 0UL, 1UL
        strmd 1UL, 0UL, 0, 1UL, 1UL
        strmd 1UL, 0UL, 1, 0UL, 1UL
        strmd 1UL, 1UL, 0, 0UL, 1UL

        strmd 1UL, 0UL, 0, 1UL, 1UL
        strmd 1UL, 0UL, 1, 1UL, 1UL
        strmd 1UL, 1UL, 0, 1UL, 1UL

        strmd 1UL, 1UL, 0, 0UL, 1UL
        strmd 1UL, 1UL, 1, 0UL, 1UL
        strmd 1UL, 1UL, 0, 1UL, 1UL

        strmd 1UL, 1UL, 1, 0UL, 1UL
        strmd 1UL, 1UL, 1, 1UL, 1UL

        assert_eq_i64(%r2, .Lmem + 0x18)

        {
            ldd,0 [ .Lmem + 0x00 ], %r0
            ldd,2 [ .Lmem + 0x08 ], %r1
        }
        {
            nop 1
            ldd,3 [ .Lmem + 0x10 ], %r2
        }

        assert_eq_i64(%r0, 0x0000ffff00000000)
        assert_eq_i64(%r1, 0xff0000000000ff00)
        assert_eq_i64(%r2, 0xffffffffffff0000)

#include "test_end.S"

    .data
.Lmem:
    .quad -1
    .quad -1
    .quad -1
