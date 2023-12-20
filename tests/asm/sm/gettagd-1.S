#include "test_start.S"

        setwd wsz=8, nfx=1
        invalid64 %r0
    {
        gettagd,2 %r0, %r0
        gettagd,5,sm %r0, %r1
    }
    {
        adds,2 %r0, 0, %r0
        adds,5 %r1, 0, %r1
    }

#include "test_end.S"
