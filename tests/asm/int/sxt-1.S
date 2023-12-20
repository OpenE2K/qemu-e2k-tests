#include "test_start.S"

        test_i64(sxt, 0, 0x7fff7f7f, 0x000000000000007f)
        test_i64(sxt, 1, 0x7fff7f7f, 0x0000000000007f7f)
        test_i64(sxt, 2, 0x7fff7f7f, 0x000000007fff7f7f)
        test_i64(sxt, 3, 0x7fff7f7f, 0x000000007fff7f7f)
        test_i64(sxt, 4, 0x7fff7f7f, 0x000000000000007f)
        test_i64(sxt, 5, 0x7fff7f7f, 0x0000000000007f7f)
        test_i64(sxt, 6, 0x7fff7f7f, 0x000000007fff7f7f)
        test_i64(sxt, 7, 0x7fff7f7f, 0x000000007fff7f7f)

        test_i64(sxt, 0, 0x80008080, 0xffffffffffffff80)
        test_i64(sxt, 1, 0x80008080, 0xffffffffffff8080)
        test_i64(sxt, 2, 0x80008080, 0xffffffff80008080)
        test_i64(sxt, 3, 0x80008080, 0xffffffff80008080)
        test_i64(sxt, 4, 0x80008080, 0x0000000000000080)
        test_i64(sxt, 5, 0x80008080, 0x0000000000008080)
        test_i64(sxt, 6, 0x80008080, 0x0000000080008080)
        test_i64(sxt, 7, 0x80008080, 0x0000000080008080)

#include "test_end.S"
