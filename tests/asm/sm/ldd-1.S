#include "test_start.S"

        setwd wsz=4, nfx=1
        ldd,0,sm 0, 0, %r0
        addd,0 %r0, 1, %r0

#include "test_end.S"
