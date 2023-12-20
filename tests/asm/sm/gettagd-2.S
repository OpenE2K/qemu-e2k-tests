#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
        gettagd,2 %r0, %r0
        addd,0 %r0, 0, %r0

#include "test_end.S"
