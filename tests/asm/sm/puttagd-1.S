#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
    {
        puttagd,2 %r0, 0, %r1
        puttagd,5 0, 1, %r2
    }
    {
        puttagd,2 0, 4, %r3
        puttagd,5 0, 5, %r4
    }
    {
        addd,0 %r1, 0, %empty
        addd,1 %r2, 0, %empty
        addd,2 %r3, 0, %empty
        addd,3 %r4, 0, %empty
    }

#include "test_end.S"
