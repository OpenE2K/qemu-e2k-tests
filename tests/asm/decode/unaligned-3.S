#include "test_start.S"

#if __LCC__ < 120
        disp %ctpr1, 1f
        ct %ctpr1

#include "test_end.S"

    .balign 8
    .byte 0
1:
        ibranch 0b
#else
        skip_test
#include "test_end.S"
#endif
