#include "test_start.S"

    {
        setwd wsz=8, nfx=1
        setbn rsz=0, rbs=7, rcur=0
    }
        addd,0 0, 0, %r8
        setbn rsz=3, rbs=4, rcur=0
        addd,0 %r8, 0, %empty

#include "test_end.S"
