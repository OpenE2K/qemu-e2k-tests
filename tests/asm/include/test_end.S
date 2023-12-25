#ifndef SRC_BASE_TEST_END_H
#define SRC_BASE_TEST_END_H

        exit_with_code
    .size _start, . - _start

    .pushsection ".data"
exit_code:
    .byte 0
    .popsection

#endif // SRC_BASE_TEST_END_H
