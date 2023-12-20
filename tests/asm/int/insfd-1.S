#include "test_start.S"

    {
        setwd wsz=8, nfx=1

        ldd,0,sm [ 0 ], %r1
        ldd,2,sm [ 0 ], %r2
    }
    {
        adds,0 0, 0x1cccccc0, %r1
        adds,1 0, 0x1ffffff0, %r2
    }
    {
        addd,0 0, 0x4afafafa1cccccc0, %r3
        addd,1 0, 0x4afafafa1ffffff0, %r4
    }
    {
        insfd,0 %r3, (0x0 << 12) | (32 << 6) | 8, %r4, %r5
        insfd,1 %r1, (0x2 << 12) | (32 << 6) | 8, %r4, %r6
        insfd,3 %r3, (0x8 << 12) | (32 << 6) | 8, %r2, %r7
        insfd,4 %r1, (0xa << 12) | (32 << 6) | 8, %r2, %r8
    }
        assert_eq_i32(%r1, 0x1cccccc0)
        assert_eq_i32(%r2, 0x1ffffff0)
        assert_eq_i64(%r3, 0x4afafafa1cccccc0)
        assert_eq_i64(%r4, 0x4afafafa1ffffff0)
        assert_eq_i64(%r5, 0xc04afafa1ffffff0)
        assert_eq_i64(%r6, 0xc04afafa1ffffff0)
        assert_eq_i64(%r7, 0xc04afafa1ffffff0)
        assert_eq_i64(%r8, 0xc04afafa1ffffff0)

#include "test_end.S"

