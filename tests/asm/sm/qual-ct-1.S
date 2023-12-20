#include "test_start.S"

        disp %ctpr1, 0f
        invalid64 %g16
        cmpedb,0,sm 0, %g16, %pred0
        ct %ctpr1 ? %pred0
0:

#include "test_end.S"
