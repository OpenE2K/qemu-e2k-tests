#include "test_start.S"

        addd,0 0, 0, %g16
    {
        stb,2 %g16, 2, mem
        ldb,3 3, mem, %empty
    }

#include "test_end.S"

    .data
mem:
    .fill 8, 1, 0
