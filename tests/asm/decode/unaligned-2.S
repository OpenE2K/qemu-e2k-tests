#include "test_start.S"

#if __LCC__ < 120
        ibranch 1f
0:

#include "test_end.S"

    .balign 8
    .byte 0
1:
        ibranch 0b
#else
        skip_test
#include "test_end.S"
#endif
