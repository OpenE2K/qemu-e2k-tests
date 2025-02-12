#include "test_start.S"

    {
        disp %ctpr1, 2f
        addd,0 0, 1f, %r0
    }
        movtd %r0, %ctpr1
        nop 7
    // bug in qemu-e2k
    // must jump to 1f, not to 2f
        ct %ctpr1
1:
        ibranch 3f
2:
        ldb,0 0, 0, %r0
3:

#include "test_end.S"
