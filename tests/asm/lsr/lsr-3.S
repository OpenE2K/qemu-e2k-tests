#include "test_start.S"

        rwd,0 0x4000400000000, %lsr
        alc alcf=1, alct=0
    {
        alc alcf=0, alct=1
        ibranch 0f
    }
0:
        rrd,0 %lsr, %r1
    {
        shrd,0 %r1, 32, %r1
        shrd,1 %r1, 48, %r2
    }
    {
        andd,0 %r1, 0x1f, %r1
        andd,1 %r2, 0x1f, %r2
    }
        assert_eq_i32m(%r1, 4, "ecnt")
        assert_eq_i32m(%r2, 2, "pcnt")

#include "test_end.S"
