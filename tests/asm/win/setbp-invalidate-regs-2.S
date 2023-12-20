#include "test_start.S"

        setbp psz=1
        invalid64 %g16
        cmpedb,0 %g16, 0, %pred1
        setbp psz=0
        setbp psz=1
        addd,0 0, 0, %empty ? %pred1

#include "test_end.S"
