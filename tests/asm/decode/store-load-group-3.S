#include "test_start.S"

        addd,0 0, 0, %g16
    {
        ldb,0 0, mem, %empty
        stb,5 %g16, 5, mem
    }

#include "test_end.S"

    .data
mem:
    .fill 8, 1, 0
