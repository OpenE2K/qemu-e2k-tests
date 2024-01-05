#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
        cmpedb,0,sm 0, %r0, %pred0
        addd,1 0, 0, %r0
        addd,0,sm 0, 1, %r0 ? %pred0
        addd,0 %r0, 1, %r0

#include "test_end.S"
