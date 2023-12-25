#include "test_start.S"

#ifndef OP
# define OP andp
#endif

        invalid64 %g16
    {
        cmpesb,0,sm %g16, %g16, %pred0
        cmpesb,1 0, 1, %pred1
        cmpesb,3 0, 1, %pred2
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        OP @p0, @p1, @p4
        pass @p4, %pred2
    }
        addd,0 0, 0, %empty ? %pred2

#include "test_end.S"
