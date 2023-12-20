#ifndef SRC_BASE_TEST_START_H
#define SRC_BASE_TEST_START_H

#include "common.S"

    .text
    .global _start
    .type _start, #function
    .balign 8
_start:
#ifdef MAX_VER
        max_version MAX_VER
#endif
#ifdef MIN_VER
        min_version MIN_VER
#endif

#endif // SRC_BASE_TEST_START_H
