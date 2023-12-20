#include "test_start.S"

        setwd wsz=8, nfx=1
        addd,0 0, 0, %r8
        setwd wsz=4, nfx=1
        setwd wsz=8, nfx=1
        addd,0 %r8, 0, %empty

#include "test_end.S"
