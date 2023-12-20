#include "test_start.S"

        disp %ctpr1, 1f
        ct %ctpr1
0:

#include "test_end.S"

    .balign 8
    .byte 0
1:
        ibranch 0b
