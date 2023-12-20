#include "test_start.S"

        setwd wsz=8, nfx=1
        puttagd,2 0, 10, %r0
        addd,0 %r0, 0, %empty

#include "test_end.S"
