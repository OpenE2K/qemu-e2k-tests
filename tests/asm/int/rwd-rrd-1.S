#include "test_start.S"

        rwd,0 0, %lsr
        rwd,0 1, %lsr
        rrd,0 %lsr, %g16
        assert_eq_i64(%g16, 1)

#include "test_end.S"
