#ifndef COMMON_SYSCALL_NR_H
#define COMMON_SYSCALL_NR_H

#define NR_exit                 1
#define NR_write                4
#define NR_gettimeofday         78
#define NR_mmap                 90
#define NR_rt_sigaction         174
#define NR_rt_sigreturn         173
#define NR_access_hw_stacks     254

#define NR_fast_sys_gettimeofday      0
#define NR_fast_sys_clock_gettime     1
#define NR_fast_sys_getcpu            2
#define NR_fast_sys_siggetmask        3
#define NR_fast_sys_getcontext        4
#define NR_fast_sys_set_return        5

#endif // COMMON_SYSCALL_NR_H
