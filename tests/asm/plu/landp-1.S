#include "test_start.S"

    {
        cmpbsb,0 0, 0, %pred0
        cmpesb,1 0, 0, %pred1
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        landp @p0, @p0, @p4
        pass @p4, %pred2

        landp @p0, @p1, @p5
        pass @p5, %pred3

        landp @p1, @p0, @p6
        pass @p6, %pred4
    }
    {
        nop 2
        pass %pred0, @p0
        pass %pred1, @p1
        landp @p1, @p1, @p4
        pass @p4, %pred5
    }

        assert(~%pred0)
        assert( %pred1)
        assert(~%pred2)
        assert(~%pred3)
        assert(~%pred4)
        assert( %pred5)

#include "test_end.S"
