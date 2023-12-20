#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
        movtd,0,sm %r0, %ctpr1

#include "test_end.S"
