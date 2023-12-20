#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
        cmpedb,0,sm 0, %r0, %pred0
        addd,0,sm 0, 0, %r0 ? %pred0
    {
        puttagd,2 %r0, 0, %r0
        gettagd,5 %r0, %r1
    }
        assert_eq_i64(%r0, 0x4000000040000000)
        assert_eq_i32(%r1, 0x5)

#include "test_end.S"
