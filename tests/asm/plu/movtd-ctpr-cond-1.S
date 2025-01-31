#include "test_start.S"

        setwd wsz=8, nfx=1
        cmpedb,0 0, 0, %pred0
        movtd,0,sm 0, %ctpr1 ? %pred0

#include "test_end.S"
