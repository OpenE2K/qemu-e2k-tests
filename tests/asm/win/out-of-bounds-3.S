#include "test_start.S"

    {
        setwd wsz=16, nfx=0
        setbn rsz=7, rbs=8, rcur=0

        addd %b[8], 0, %empty
    }

#include "test_end.S"
