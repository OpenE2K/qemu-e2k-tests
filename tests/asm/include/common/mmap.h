#ifndef COMMON_MMAP_H
#define COMMON_MMAP_H

#include "common/syscall_nr.h"

#define MAP_SHARED              0x000001
#define MAP_PRIVATE             0x000002
#define MAP_SHARED_VALIDATE     0x000003
#define MAP_ANONYMOUS           0x000010 /* don't use a file */
#define MAP_FIXED               0x000100 /* Interpret addr exactly */
#define MAP_DENYWRITE           0x000800 /* ETXTBSY */
#define MAP_GROWSDOWN           0x001000 /* stack-like segment */
#define MAP_GROWSUP             0x002000 /* register stack-like segment */
#define MAP_EXECUTABLE          0x004000 /* mark it as an executable */
#define MAP_LOCKED              0x008000 /* pages are locked */
#define MAP_NORESERVE           0x010000 /* don't check for reservations */
#define MAP_POPULATE            0x020000 /* populate (prefault) pagetables */
#define MAP_NONBLOCK            0x040000 /* do not block on IO */
#define MAP_FIRST32             0x080000 /* in protected mode map in  */
/* first 2 ** 32 area */
#define MAP_WRITECOMBINED       0x100000 /* Write combine */
#define MAP_HUGETLB             0x200000 /* create a huge page mapping */
#define MAP_FIXED_NOREPLACE     0x400000 /* MAP_FIXED which doesn't unmap */
/* underlying mapping */
#define MAP_STACK MAP_GROWSDOWN

#define PROT_READ   0x1     /* page can be read */
#define PROT_WRITE  0x2     /* page can be written */
#define PROT_EXEC   0x4     /* page can be executed */
#define PROT_SEM    0x8     /* page may be used for atomic ops */
#define PROT_NONE   0x0     /* page can not be accessed */

#define sys_mmap(ret, addr, len, prot, flags) \
    { \
        disp %ctpr1, sys_mmap; \
        addd,0 0, addr, %b[0]; \
        addd,1 0, len, %b[1]; \
    } \
    { \
        addd,0 0, prot, %b[2]; \
        addd,1 0, flags, %b[3]; \
        subd,2 0, 1, %b[4]; \
        addd,3 0, 0, %b[5]; \
        nop 3 \
    } \
        call %ctpr1, wbs=4; \
        addd,0 0, %b[0], ret

#endif // COMMON_MMAP_H
