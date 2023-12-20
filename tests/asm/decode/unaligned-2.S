#include "test_start.S"

        ibranch 1f
0:

#include "test_end.S"

    .balign 8
    .byte 0
1:
        ibranch 0b
