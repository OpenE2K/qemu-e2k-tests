#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
    {
        puttags,2 %r0, 0, %r1
        puttags,5 0, 1, %r2
    }
    {
        adds,2 %r1, 0, %empty
        adds,5 %r2, 0, %empty
    }

#include "test_end.S"
