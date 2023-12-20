#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
        subd,0 0, 1, %r1
        insfd,0 %r0, IF(0, 16, 0, 0), %r1, %empty

#include "test_end.S"
