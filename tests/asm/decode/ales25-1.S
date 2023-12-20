#include "test_start.S"

        min_version 4

    {
        setwd wsz=8, nfx=1
        adds,0 0, 0x40000000, %r0 // 2.0f
        adds,1 0, 0x40400000, %r1 // 3.0f
    }
        fadds,2 %r0, %r1, %r2
        fadds,5 %r0, %r1, %r3
    {
        fadds,2 %r0, %r1, %r4
        fadds,5 %r0, %r1, %r5
    }
    {
        fadds,2 %r0, %r1, %r6
        fdivs,5 %r1, %r0, %r7
    }
    {
        puttagd,2 %r0, 0, %r8
        fadds,5 %r1, %r0, %r9
    }
        assert_eq_i32(%r2, 0x40A00000)
        assert_eq_i32(%r3, 0x40A00000)
        assert_eq_i32(%r4, 0x40A00000)
        assert_eq_i32(%r5, 0x40A00000)
        assert_eq_i32(%r6, 0x40A00000)
        assert_eq_i32(%r7, 0x3FC00000)
        assert_eq_i32(%r8, 0x40000000)
        assert_eq_i32(%r9, 0x40A00000)

#include "test_end.S"
