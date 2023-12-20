#include "test_start.S"

        setwd wsz=16, nfx=1
        addd,0 0, _f16s,_lts0lo 0x7fff, %r1
        addd,0 0, _f16s,_lts0hi 0x7fff, %r2
        addd,0 0, _f16s,_lts1lo 0x7fff, %r3
        addd,0 0, _f16s,_lts1hi 0x7fff, %r4
        addd,0 0, _f16s,_lts0lo 0xffff, %r5
        addd,0 0, _f16s,_lts0hi 0xffff, %r6
        addd,0 0, _f16s,_lts1lo 0xffff, %r7
        addd,0 0, _f16s,_lts1hi 0xffff, %r8
        addd,0 0, _f32s,_lts0 0x7fffffff, %r9
        addd,0 0, _f32s,_lts1 0x7fffffff, %r10
        addd,0 0, _f32s,_lts2 0x7fffffff, %r11
        addd,0 0, _f32s,_lts3 0x7fffffff, %r12
        addd,0 0, _f32s,_lts0 0xffffffff, %r13
        addd,0 0, _f32s,_lts1 0xffffffff, %r14
        addd,0 0, _f32s,_lts2 0xffffffff, %r15
        addd,0 0, _f32s,_lts3 0xffffffff, %r16
        addd,0 0, _f64,_lts0 0xffffffffffffffff, %r17
        addd,0 0, _f64,_lts1 0xffffffffffffffff, %r18
        addd,0 0, _f64,_lts2 0xffffffffffffffff, %r19
        addd,0 0, 0, %r20

        assert_eq_i64(%r1,  0x7fff)
        assert_eq_i64(%r2,  0x7fff)
        assert_eq_i64(%r3,  0x7fff)
        assert_eq_i64(%r4,  0x7fff)
        assert_eq_i64(%r5,  0xffffffffffffffff)
        assert_eq_i64(%r6,  0xffffffffffffffff)
        assert_eq_i64(%r7,  0xffffffffffffffff)
        assert_eq_i64(%r8,  0xffffffffffffffff)
        assert_eq_i64(%r9,  0x7fffffff)
        assert_eq_i64(%r10, 0x7fffffff)
        assert_eq_i64(%r11, 0x7fffffff)
        assert_eq_i64(%r12, 0x7fffffff)
        assert_eq_i64(%r13, 0xffffffffffffffff)
        assert_eq_i64(%r14, 0xffffffffffffffff)
        assert_eq_i64(%r15, 0xffffffffffffffff)
        assert_eq_i64(%r16, 0xffffffffffffffff)
        assert_eq_i64(%r17, 0xffffffffffffffff)
        assert_eq_i64(%r18, 0xffffffffffffffff)
        assert_eq_i64(%r19, 0xffffffffffffffff)
        assert_eq_i64(%r20, 0x0)
    
#include "test_end.S"
