#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
        invalid64 %r1
    {
        adds,0 0, 0, %r0
        subs,1 0, 1, %r1
        addd,2 0, 0, %r2
        subd,3 0, 1, %r3
    }
    {
        insfd,0 %r0, IF(0, 32, 1, 1), %r1, %empty
        insfd,1 %r2, IF(0, 32, 0, 1), %r1, %empty
        insfd,3 %r0, IF(0, 32, 1, 0), %r3, %empty
    }

#include "test_end.S"
