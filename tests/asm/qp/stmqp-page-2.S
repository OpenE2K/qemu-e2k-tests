#include "common/mmap.h"
#include "test_start.S"
#if __iset__ >= 5
        setwd wsz=8, nfx=0

        sys_mmap(%r0, 0, PAGE_SIZE * 3, PROT_READ, MAP_PRIVATE | MAP_ANONYMOUS)
        addd,0 %r0, PAGE_SIZE, %r0
        sys_mmap(%r0, %r0, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED)

        subd,0 0, 1, %r1
        stb,2 %r1, [ %r0 ]
        qppackdl,0 %r1, %r1, %r1

        subd,0 %r0, 8, %g16
        stmqp,2 %r1, %g16, 0xff00
#endif
#include "test_end.S"
