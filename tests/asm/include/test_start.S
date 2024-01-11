#ifndef SRC_BASE_TEST_START_H
#define SRC_BASE_TEST_START_H

#include "common.S"

    .text
    .global test_entry
    .type test_entry, #function
    .align 8
test_entry:
#if IS_SKIP
        skip_test
#else
    {
        setwd wsz=8, nfx=1
        setbn rsz=3, rbs=4, rcur=0
    }
        addd,0 0, 0, %r0
#endif

#endif // SRC_BASE_TEST_START_H
