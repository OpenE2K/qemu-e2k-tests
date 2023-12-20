#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
    {
        cmpedb,0,sm 0, %r0, %pred0
        cmpedb,1,sm 0, 0, %pred1
    }
    {
        pass %pred0, @p0
        pass %pred1, @p1
        landp @p0, @p1, @p4
        pass @p4, %pred2
    }
        addd,0 0, 1, %r0 ? %pred2

#include "test_end.S"
