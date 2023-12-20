#include "test_start.S"

        min_version 3

        setwd wsz=4, nfx=1, dbl=1
        invalid64 %r0
        adds,0 0, 0, %r0
        addd,0 %r0, 0, %r0

#include "test_end.S"
