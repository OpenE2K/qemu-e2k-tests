#include "test_start.S"

        addd,0 0, 0, %g16
    {
        ldb,0 0, mem, %empty
        ldb,2 2, mem, %empty
        ldb,3 3, mem, %empty
        ldb,5 5, mem, %empty
    }
    {
        ldb,0 0, mem, %empty
        stb,2 %g16, 2, mem
        ldb,5 5, mem, %empty
    }
    {
        ldb,2 2, mem, %empty
        ldb,3 3, mem, %empty
        stb,5 %g16, 5, mem
    }
    {
        stb,2 %g16, 2, mem
        stb,5 %g16, 5, mem
    }

#include "test_end.S"

    .data
mem:
    .fill 8, 1, 0
