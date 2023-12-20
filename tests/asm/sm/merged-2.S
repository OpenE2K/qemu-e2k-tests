#include "test_start.S"

        invalid64 %g16
        cmpedb,0 0, 0, %pred0
        merged,0 0, %g16, %empty, %pred0

#include "test_end.S"
