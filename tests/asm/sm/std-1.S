#include "test_start.S"

        invalid64 %g16
        std,2,sm %g16, [ mem ]
        ldd,2 [ mem ], %g17
        addd,0 0, 0, %g18
        gettagd,2 %g17, %g18
        assert_eq_i32(%g18, 0)

#include "test_end.S"

    .data
    .balign 8
mem:
    .quad 0
