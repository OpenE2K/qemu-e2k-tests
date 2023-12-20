#include "test_start.S"

        setwd wsz=8, nfx=1

        test_i64(getfd, 0x0000000000000000, F( 0, 0, 0, 0), 0x0000000000000000)

        test_i64(getfd, 0xfedcba9876543210, F( 0, 4, 0, 0), 0x0000000000000000)
        test_i64(getfd, 0xfedcba9876543210, F( 4, 4, 0, 0), 0x0000000000000001)
        test_i64(getfd, 0xfedcba9876543210, F( 8, 4, 0, 0), 0x0000000000000002)
        test_i64(getfd, 0xfedcba9876543210, F(12, 4, 0, 0), 0x0000000000000003)
        test_i64(getfd, 0xfedcba9876543210, F(16, 4, 0, 0), 0x0000000000000004)
        test_i64(getfd, 0xfedcba9876543210, F(20, 4, 0, 0), 0x0000000000000005)
        test_i64(getfd, 0xfedcba9876543210, F(24, 4, 0, 0), 0x0000000000000006)
        test_i64(getfd, 0xfedcba9876543210, F(28, 4, 0, 0), 0x0000000000000007)
        test_i64(getfd, 0xfedcba9876543210, F(32, 4, 0, 0), 0x0000000000000008)
        test_i64(getfd, 0xfedcba9876543210, F(36, 4, 0, 0), 0x0000000000000009)
        test_i64(getfd, 0xfedcba9876543210, F(40, 4, 0, 0), 0x000000000000000a)
        test_i64(getfd, 0xfedcba9876543210, F(44, 4, 0, 0), 0x000000000000000b)
        test_i64(getfd, 0xfedcba9876543210, F(48, 4, 0, 0), 0x000000000000000c)
        test_i64(getfd, 0xfedcba9876543210, F(52, 4, 0, 0), 0x000000000000000d)
        test_i64(getfd, 0xfedcba9876543210, F(56, 4, 0, 0), 0x000000000000000e)
        test_i64(getfd, 0xfedcba9876543210, F(60, 4, 0, 0), 0x000000000000000f)

        test_i64(getfd, 0xfedcba9876543210, F( 0, 4, 1, 0), 0x0000000000000000)
        test_i64(getfd, 0xfedcba9876543210, F( 4, 4, 1, 0), 0x0000000000000001)
        test_i64(getfd, 0xfedcba9876543210, F( 8, 4, 1, 1), 0x0000000000000002)
        test_i64(getfd, 0xfedcba9876543210, F(12, 4, 1, 1), 0x0000000000000003)
        test_i64(getfd, 0xfedcba9876543210, F(16, 4, 1, 2), 0x0000000000000004)
        test_i64(getfd, 0xfedcba9876543210, F(20, 4, 1, 2), 0x0000000000000005)
        test_i64(getfd, 0xfedcba9876543210, F(24, 4, 1, 3), 0x0000000000000006)
        test_i64(getfd, 0xfedcba9876543210, F(28, 4, 1, 3), 0x0000000000000007)
        test_i64(getfd, 0xfedcba9876543210, F(32, 4, 1, 4), 0xfffffffffffffff8)
        test_i64(getfd, 0xfedcba9876543210, F(36, 4, 1, 4), 0xfffffffffffffff9)
        test_i64(getfd, 0xfedcba9876543210, F(40, 4, 1, 5), 0xfffffffffffffffa)
        test_i64(getfd, 0xfedcba9876543210, F(44, 4, 1, 5), 0xfffffffffffffffb)
        test_i64(getfd, 0xfedcba9876543210, F(48, 4, 1, 6), 0xfffffffffffffffc)
        test_i64(getfd, 0xfedcba9876543210, F(52, 4, 1, 6), 0xfffffffffffffffd)
        test_i64(getfd, 0xfedcba9876543210, F(56, 4, 1, 7), 0xfffffffffffffffe)
        test_i64(getfd, 0xfedcba9876543210, F(60, 4, 1, 7), 0xffffffffffffffff)

        test_i64(getfd, 0xfedcba9876543210, F( 0, 8, 0, 0), 0x0000000000000010)
        test_i64(getfd, 0xfedcba9876543210, F( 8, 8, 0, 0), 0x0000000000000032)
        test_i64(getfd, 0xfedcba9876543210, F(16, 8, 0, 0), 0x0000000000000054)
        test_i64(getfd, 0xfedcba9876543210, F(24, 8, 0, 0), 0x0000000000000076)
        test_i64(getfd, 0xfedcba9876543210, F(32, 8, 0, 0), 0x0000000000000098)
        test_i64(getfd, 0xfedcba9876543210, F(40, 8, 0, 0), 0x00000000000000ba)
        test_i64(getfd, 0xfedcba9876543210, F(48, 8, 0, 0), 0x00000000000000dc)
        test_i64(getfd, 0xfedcba9876543210, F(56, 8, 0, 0), 0x00000000000000fe)

        test_i64(getfd, 0xfedcba9876543210, F( 0, 8, 1, 0), 0x0000000000000010)
        test_i64(getfd, 0xfedcba9876543210, F( 8, 8, 1, 1), 0x0000000000000032)
        test_i64(getfd, 0xfedcba9876543210, F(16, 8, 1, 2), 0x0000000000000054)
        test_i64(getfd, 0xfedcba9876543210, F(24, 8, 1, 3), 0x0000000000000076)
        test_i64(getfd, 0xfedcba9876543210, F(32, 8, 1, 4), 0xffffffffffffff98)
        test_i64(getfd, 0xfedcba9876543210, F(40, 8, 1, 5), 0xffffffffffffffba)
        test_i64(getfd, 0xfedcba9876543210, F(48, 8, 1, 6), 0xffffffffffffffdc)
        test_i64(getfd, 0xfedcba9876543210, F(56, 8, 1, 7), 0xfffffffffffffffe)

        test_i64(getfd, 0xfedcba9876543210, F( 0,16, 0, 0), 0x0000000000003210)
        test_i64(getfd, 0xfedcba9876543210, F(16,16, 0, 0), 0x0000000000007654)
        test_i64(getfd, 0xfedcba9876543210, F(32,16, 0, 0), 0x000000000000ba98)
        test_i64(getfd, 0xfedcba9876543210, F(48,16, 0, 0), 0x000000000000fedc)

        test_i64(getfd, 0xfedcba9876543210, F( 0,16, 1, 0), 0x0000000000003210)
        test_i64(getfd, 0xfedcba9876543210, F(16,16, 1, 2), 0x0000000000007654)
        test_i64(getfd, 0xfedcba9876543210, F(32,16, 1, 4), 0xffffffffffffba98)
        test_i64(getfd, 0xfedcba9876543210, F(48,16, 1, 6), 0xfffffffffffffedc)

        isa_version %r0
        cmpbdb,0 %r0, 5, %pred0
        ibranch 0f ? %pred0

        // v5+ does not follow older rules for src2[15:13]
        test_i64(getfd, 0x0000000000808080, F( 0,32, 1, 0), 0x0000000000808080)
        test_i64(getfd, 0x0000000000808080, F( 0,32, 1, 1), 0x0000000000808080)
        test_i64(getfd, 0x0000000000808080, F( 0,32, 1, 2), 0x0000000000808080)
        test_i64(getfd, 0x0000000000808080, F( 0,32, 1, 3), 0x0000000000808080)

        test_i64(getfd, 0x0000000000010101, F( 1,32, 1, 0), 0x0000000000008080)
        test_i64(getfd, 0x0000000000010101, F( 1,32, 1, 1), 0x0000000000008080)
        test_i64(getfd, 0x0000000000010101, F( 1,32, 1, 2), 0x0000000000008080)
        test_i64(getfd, 0x0000000000010101, F( 1,32, 1, 3), 0x0000000000008080)

        ibranch 1f

0:
        test_i64(getfd, 0x0000000000808080, F( 0,32, 1, 0), 0xffffffff00808080)
        test_i64(getfd, 0x0000000000808080, F( 0,32, 1, 1), 0xffffffff00808080)
        test_i64(getfd, 0x0000000000808080, F( 0,32, 1, 2), 0xffffffff00808080)
        test_i64(getfd, 0x0000000000808080, F( 0,32, 1, 3), 0x0000000000808080)

        test_i64(getfd, 0x0000000000010101, F( 1,32, 1, 0), 0xffffffff00008080)
        test_i64(getfd, 0x0000000000010101, F( 1,32, 1, 1), 0xffffffff00008080)
        test_i64(getfd, 0x0000000000010101, F( 1,32, 1, 2), 0xffffffff00008080)
        test_i64(getfd, 0x0000000000010101, F( 1,32, 1, 3), 0x0000000000008080)
1:

#include "test_end.S"
