#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
        cmpedb,0,sm 0, %r0, %pred0
        movtd,0,sm 0f, %ctpr1 ? %pred0
0:

#include "test_end.S"
