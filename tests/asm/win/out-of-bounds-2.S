#include "test_start.S"

    {
        setwd wsz=8, nfx=0
        setbn rsz=3, rbs=4, rcur=0
    }
        addd %b[8], 0, %empty

#include "test_end.S"
