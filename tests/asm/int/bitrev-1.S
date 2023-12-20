#include "test_start.S"

        setwd wsz=8, nfx=1
    {
        bitrevs,0 0x12345678, %r1
        bitrevs,1 0xdeadbeef, %r2
        bitrevs,3 0x0a0a0a0a, %r3
        bitrevs,4 0xdeadc0de, %r4
    }
    {
        bitrevd,0 0x123456789abcdef0, %r5
        bitrevd,1 0x00cafefeedcaca00, %r6
    }
    {
        bitrevd,3 0xa0a0a0a0a0a0a0a0, %r7
        bitrevd,4 0xbeeffacefa11baad, %r8
    }
        assert_eq_i32(%r1, 0x1e6a2c48)
        assert_eq_i32(%r2, 0xf77db57b)
        assert_eq_i32(%r3, 0x50505050)
        assert_eq_i32(%r4, 0x7b03b57b)
        assert_eq_i64(%r5, 0x00f7b3d591e6a2c48)
        assert_eq_i64(%r6, 0x0005353b77f7f5300)
        assert_eq_i64(%r7, 0x00505050505050505)
        assert_eq_i64(%r8, 0x0b55d885f735ff77d)

#include "test_end.S"
