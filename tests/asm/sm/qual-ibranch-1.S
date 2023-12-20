#include "test_start.S"

        invalid64 %g16
        cmpedb,0,sm 0, %g16, %pred0
        ibranch 0f ? %pred0
0:

#include "test_end.S"
