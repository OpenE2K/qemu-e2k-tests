#include "test_start.S"

#ifndef OP
# define OP andp
#endif

        invalid64 %g16
    {
        cmpesb,0,sm %g16, %g16, %pred0
        cmpesb,1,sm %g16, %g16, %pred1
        cmpesb,3 0, 0, %pred2
        cmpesb,4 0, 0, %pred3
    }
    {
        cmpesb,0 0, 1, %pred4
        cmpesb,1 0, 1, %pred5
        cmpesb,3 0, 1, %pred6
        cmpesb,4 0, 1, %pred7
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        pass %pred2, @p2
        pass %pred3, @p3
        landp ~@p0, ~@p1, @p4
        landp @p2, @p3, @p5
        OP @p4, @p5, @p6
        pass @p4, %pred4
        pass @p5, %pred5
        pass @p6, %pred6
    }
        addd,0 0, 0, %empty ? %pred6

#include "test_end.S"
