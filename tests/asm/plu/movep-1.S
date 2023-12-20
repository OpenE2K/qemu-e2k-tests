#include "test_start.S"

    {
        cmpbsb,0 0, 0, %pred0
        cmpesb,1 0, 0, %pred1
        cmpbsb,3 0, 0, %pred2
        cmpbsb,4 0, 0, %pred3
    }
    {
        cmpbsb,0 0, 0, %pred4
        cmpbsb,1 0, 0, %pred5
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        movep @p0, @p0, @p4
        pass @p4, %pred2

        movep @p0, @p1, @p5
        pass @p5, %pred3

        movep @p1, @p0, @p6
        pass @p6, %pred4
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        movep @p1, @p1, @p4
        pass @p4, %pred5
    }
    {
        cmpesb,0 0, 0, %pred6
        cmpesb,1 0, 0, %pred7
    }
    {
        cmpesb,0 0, 0, %pred8
        cmpesb,1 0, 0, %pred9
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        movep @p0, @p0, @p4
        pass @p4, %pred6

        movep @p0, @p1, @p5
        pass @p5, %pred7

        movep @p1, @p0, @p6
        pass @p6, %pred8
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        movep @p1, @p1, @p4
        pass @p4, %pred9
    }

        assert(~%pred0)
        assert( %pred1)
        assert(~%pred2)
        assert(~%pred3)
        assert(~%pred4)
        assert( %pred5)
        assert( %pred6)
        assert( %pred7)
        assert(~%pred8)
        assert( %pred9)

#include "test_end.S"
