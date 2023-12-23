#include "test_start.S"

    {
        cmpesb,0 0, 0, %pred0
        cmpesb,1 0, 0, %pred1
        cmpesb,3 0, 0, %pred2
        cmpesb,4 0, 0, %pred3
    }
    {
        cmpesb,0 0, 1, %pred4
        cmpesb,1 0, 1, %pred5
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        pass %pred2, @p2
        pass %pred3, @p3
        landp @p0, @p1, @p4
        landp @p2, @p4, @p5
        pass @p5, %pred4
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        pass %pred2, @p2
        pass %pred3, @p3
        landp @p0, @p1, @p4
        landp @p2, @p3, @p5
        landp @p4, @p5, @p6
        pass @p6, %pred5
    }
        assert(%pred0)
        assert(%pred1)
        assert(%pred2)
        assert(%pred3)
        assert(%pred4)
        assert(%pred5)

#include "test_end.S"
