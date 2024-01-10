#include "common.S"

#if __LCC__ < 120
    .text
    .global _start
    .balign 8
    .byte 0
_start:
        nop
#include "test_end.S"
#else
#include "test_start.S"
        skip_test
#include "test_end.S"
#endif

