#ifndef SRC_BASE_TEST_END_H
#define SRC_BASE_TEST_END_H

#if !IS_SKIP
    {
        return %ctpr3
        nop 5
    }
        ct %ctpr3
#endif
    .size test_entry, . - test_entry

#endif // SRC_BASE_TEST_END_H
