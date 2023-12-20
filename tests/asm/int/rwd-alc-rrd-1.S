#include "test_start.S"

        rwd,0 10, %lsr
        rwd,0 5, %lsr
        alc alcf=1, alct=1
        rrd,0 %lsr, %g16
        assert_eq_i64(%g16, 4)

#include "test_end.S"
