#ifndef SRC_BASE_TEST_END_H
#define SRC_BASE_TEST_END_H

        ldb,0 [ exit_code ], SCRATCH_REG3
        exit(SCRATCH_REG3)
    .size _start, . - _start

    .pushsection ".data"
exit_code:
    .byte 0
    .popsection

#endif // SRC_BASE_TEST_END_H
