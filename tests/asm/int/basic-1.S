#include "test_start.S"

        test_i32(ands, 0, 0, 0)
        test_i32(ands, 1, 0, 0)
        test_i32(ands, 0, 1, 0)
        test_i32(ands, 1, 1, 1)

        test_i32(ors, 0, 0, 0)
        test_i32(ors, 1, 0, 1)
        test_i32(ors, 0, 1, 1)
        test_i32(ors, 1, 1, 1)

        test_i32(xors, 0, 0, 0)
        test_i32(xors, 1, 0, 1)
        test_i32(xors, 0, 1, 1)
        test_i32(xors, 1, 1, 0)

        test_i32(andns, 0, 0, 0)
        test_i32(andns, 1, 0, 1)
        test_i32(andns, 0, 1, 0)
        test_i32(andns, 1, 1, 0)

        test_i32(orns, 0, 0, 0xffffffff)
        test_i32(orns, 1, 0, 0xffffffff)
        test_i32(orns, 0, 1, 0xfffffffe)
        test_i32(orns, 1, 1, 0xffffffff)

        test_i32(xorns, 0, 0, 0xffffffff)
        test_i32(xorns, 1, 0, 0xfffffffe)
        test_i32(xorns, 0, 1, 0xfffffffe)
        test_i32(xorns, 1, 1, 0xffffffff)

        test_i32(shls, 1,  0, 1)
        test_i32(shls, 1,  1, 2)
        test_i32(shls, 1,  2, 4)
        test_i32(shls, 1, 32, 1)

        test_i32(shrs, 8,  0, 8)
        test_i32(shrs, 8,  1, 4)
        test_i32(shrs, 8,  2, 2)
        test_i32(shrs, 8, 32, 8)

        test_i32(sars, 0x80000000,  0, 0x80000000)
        test_i32(sars, 0x80000000,  1, 0xc0000000)
        test_i32(sars, 0x80000000,  2, 0xe0000000)
        test_i32(sars, 0x80000000, 31, 0xffffffff)
        test_i32(sars, 0x80000000, 32, 0x80000000)

        test_i32(scls, 0x80000001,  0, 0x80000001)
        test_i32(scls, 0x80000001,  1, 0x00000003)
        test_i32(scls, 0x80000001,  2, 0x00000006)
        test_i32(scls, 0x80000001, 31, 0xc0000000)
        test_i32(scls, 0x80000001, 32, 0x80000001)

        test_i32(scrs, 0x80000001,  0, 0x80000001)
        test_i32(scrs, 0x80000001,  1, 0xc0000000)
        test_i32(scrs, 0x80000001,  2, 0x60000000)
        test_i32(scrs, 0x80000001, 31, 0x00000003)
        test_i32(scrs, 0x80000001, 32, 0x80000001)

        test_i32(adds, 0, 0, 0)
        test_i32(adds, 1, 0, 1)
        test_i32(adds, 0, 1, 1)
        test_i32(adds, 1, 1, 2)

        test_i32(subs, 0, 0, 0)
        test_i32(subs, 1, 0, 1)
        test_i32(subs, 0, 1, -1)
        test_i32(subs, 1, 1, 0)

        test_i32(muls, 0, 0, 0)
        test_i32(muls, 1, 0, 0)
        test_i32(muls, 0, 1, 0)
        test_i32(muls, 1, 1, 1)
        test_i32(muls, 2, 3, 6)

        test_i64(andd, 0, 0, 0)
        test_i64(andd, 1, 0, 0)
        test_i64(andd, 0, 1, 0)
        test_i64(andd, 1, 1, 1)

        test_i64(ord, 0, 0, 0)
        test_i64(ord, 1, 0, 1)
        test_i64(ord, 0, 1, 1)
        test_i64(ord, 1, 1, 1)

        test_i64(xord, 0, 0, 0)
        test_i64(xord, 1, 0, 1)
        test_i64(xord, 0, 1, 1)
        test_i64(xord, 1, 1, 0)

        test_i64(andnd, 0, 0, 0)
        test_i64(andnd, 1, 0, 1)
        test_i64(andnd, 0, 1, 0)
        test_i64(andnd, 1, 1, 0)

        test_i64(ornd, 0, 0, 0xffffffffffffffff)
        test_i64(ornd, 1, 0, 0xffffffffffffffff)
        test_i64(ornd, 0, 1, 0xfffffffffffffffe)
        test_i64(ornd, 1, 1, 0xffffffffffffffff)

        test_i64(xornd, 0, 0, 0xffffffffffffffff)
        test_i64(xornd, 1, 0, 0xfffffffffffffffe)
        test_i64(xornd, 0, 1, 0xfffffffffffffffe)
        test_i64(xornd, 1, 1, 0xffffffffffffffff)

        test_i64(shld, 1,  0, 1)
        test_i64(shld, 1,  1, 2)
        test_i64(shld, 1,  2, 4)
        test_i64(shld, 1, 64, 1)

        test_i64(shrd, 8,  0, 8)
        test_i64(shrd, 8,  1, 4)
        test_i64(shrd, 8,  2, 2)
        test_i64(shrd, 8, 64, 8)

        test_i64(sard, 0x8000000000000000,  0, 0x8000000000000000)
        test_i64(sard, 0x8000000000000000,  1, 0xc000000000000000)
        test_i64(sard, 0x8000000000000000,  2, 0xe000000000000000)
        test_i64(sard, 0x8000000000000000, 63, 0xffffffffffffffff)
        test_i64(sard, 0x8000000000000000, 64, 0x8000000000000000)

        test_i64(scld, 0x8000000000000001,  0, 0x8000000000000001)
        test_i64(scld, 0x8000000000000001,  1, 0x0000000000000003)
        test_i64(scld, 0x8000000000000001,  2, 0x0000000000000006)
        test_i64(scld, 0x8000000000000001, 63, 0xc000000000000000)
        test_i64(scld, 0x8000000000000001, 64, 0x8000000000000001)

        test_i64(scrd, 0x8000000000000001,  0, 0x8000000000000001)
        test_i64(scrd, 0x8000000000000001,  1, 0xc000000000000000)
        test_i64(scrd, 0x8000000000000001,  2, 0x6000000000000000)
        test_i64(scrd, 0x8000000000000001, 63, 0x0000000000000003)
        test_i64(scrd, 0x8000000000000001, 64, 0x8000000000000001)

        test_i64(addd, 0, 0, 0)
        test_i64(addd, 1, 0, 1)
        test_i64(addd, 0, 1, 1)
        test_i64(addd, 1, 1, 2)

        test_i64(subd, 0, 0, 0)
        test_i64(subd, 1, 0, 1)
        test_i64(subd, 0, 1, -1)
        test_i64(subd, 1, 1, 0)

        test_i64(muld, 0, 0, 0)
        test_i64(muld, 1, 0, 0)
        test_i64(muld, 0, 1, 0)
        test_i64(muld, 1, 1, 1)
        test_i64(muld, 2, 3, 6)

#include "test_end.S"
