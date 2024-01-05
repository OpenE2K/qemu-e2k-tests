#include "test_start.S"

        invalid64 %g16
    {
        cmpbsb,0 0, 0, %pred0
        cmpesb,1 0, 0, %pred1
    }
        cmpesb,3,sm 0, %g16, %pred4
    {
        pass %pred0, @p0
        pass %pred1, @p1
        movep @p0, @p1, @p4
        pass @p4, %pred4
    }
        addd,0 0, 0, %empty ? %pred4

#include "test_end.S"
