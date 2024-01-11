#ifndef SRC_COMMON_H
#define SRC_COMMON_H

#if !defined(__iset__)
# define __iset__ 1
#endif

#define PAGE_SIZE 4096

#include "common/syscall_nr.h"

#define SCRATCH_REG0 %g23
#define SCRATCH_REG1 %g22
#define SCRATCH_REG2 %g21
#define SCRATCH_REG3 %g20
#define SCRATCH_REG4 %g29
#define SCRATCH_REG5 %g18
#define SCRATCH_REG6 %g17
#define SCRATCH_REG7 %g16

#define SCRATCH_PREG0 %pred31
#define SCRATCH_PREG1 %pred30
#define SCRATCH_PREG2 %pred29
#define SCRATCH_PREG3 %pred28
#define SCRATCH_PREG4 %pred27
#define SCRATCH_PREG5 %pred26
#define SCRATCH_PREG6 %pred25
#define SCRATCH_PREG7 %pred24
#define SCRATCH_PREG8 %pred23

#define str_HELPER(X) #X
#define str(X) str_HELPER(X)

#define glue_helper(A, B) A ## B
#define glue(A, B) glue_helper(A, B)
#define glue3(A, B, C) glue(glue(A, B), C)
#define glue4(A, B, C, D) glue(glue(A, B), glue(C, D))
#define local(LABEL) glue3(.L, LABEL, __LINE__)

// Selector for getf{s,d}.
#define F(O, L, S, B) ((O) | ((L) << 6) | ((S) << 12) | ((B) << 13))

// Selector for insfd.
#define IF(O, L, S1_HT, S3_HT) ((O) | ((L) << 6) | ((S1_HT) << 13) | ((S3_HT) << 15))

    .macro sys_exit, code=0
    {
        setwd wsz=8, nfx=1
        sdisp %ctpr1, 0x3
        nop 4
    }
    {
        addd,0 0, NR_exit, %r8
        addd,1 0, \code, %r9
        call %ctpr1, wbs=4
    }
    .endm

#define exit(code) sys_exit code

    .macro set_exit_code code=0
        addd,0 0, \code, SCRATCH_REG3; \
        stb,2 SCRATCH_REG3, [ exit_code ]; \
    .endm

    .macro sys_write msg, len, fd=1
    {
        setwd wsz=8, nfx=1
        sdisp %ctpr1, 0x3
        nop 4
    }
    {
        addd,0 0, NR_write, %r8
        addd,1 0, \fd, %r9
        addd,2 0, \msg, %r10
        addd,3 0, \len, %r11
        call %ctpr1, wbs=4
    }
    .endm

    .macro exit_with_code
        ldb,0 [ exit_code ], SCRATCH_REG3
        sys_exit SCRATCH_REG3
    .endm

    .macro skip_test
        sys_exit 77
    .endm

#define write(MSG) \
        .pushsection ".rodata"; \
    local(str):; \
        .ascii MSG; \
    local(len) = . - local(str); \
        .popsection; \
        sys_write local(str), local(len)

#define writeln(MSG) write(MSG "\n")

#define SIGHUP           1
#define SIGINT           2
#define SIGQUIT          3
#define SIGILL           4
#define SIGTRAP          5
#define SIGABRT          6
#define SIGIOT           6
#define SIGBUS           7
#define SIGFPE           8
#define SIGKILL          9
#define SIGUSR1         10
#define SIGSEGV         11
#define SIGUSR2         12
#define SIGPIPE         13
#define SIGALRM         14
#define SIGTERM         15
#define SIGSTKFLT       16
#define SIGCHLD         17
#define SIGCONT         18
#define SIGSTOP         19
#define SIGTSTP         20
#define SIGTTIN         21
#define SIGTTOU         22
#define SIGURG          23
#define SIGXCPU         24
#define SIGXFSZ         25
#define SIGVTALRM       26
#define SIGPROF         27
#define SIGWINCH        28
#define SIGIO           29
#define SIGPWR          30
#define SIGSYS          31
#define SIGRTMIN        32

#define SA_SIGINFO       0x00000004

    .macro init_sigaction handler=0, flags=0, restorer=0, mask=0
        .quad \handler
        .quad \flags
        .quad \restorer
        .quad \mask
    .endm

    .macro sys_rt_sigaction sig, acc=0, oldacc=0
    {
        setwd wsz=8, nfx=1
        addd,0 0, NR_rt_sigaction, %r8
        addd,1 0, \sig, %r9
        sdisp %ctpr1, 0x3
        nop 4
    }
    {
        addd,0 0, \acc, %r10
        addd,1 0, \oldacc, %r11
        addd,2 0, 8, %r12
        call %ctpr1, wbs=4
    }
    .endm

    .macro sys_rt_sigreturn
        {
            setwd wsz=8, nfx=1
            sdisp %ctpr1, 0x3
        }
        {
            addd,0 0, NR_rt_sigreturn, %r8
            addd,1 0, 0, %r9
            call %ctpr1, wbs=4
        }
    .endm

#define READ_CHAIN_STACK            0
#define READ_PROCEDURE_STACK        1
#define WRITE_PROCEDURE_STACK       2
#define GET_CHAIN_STACK_OFFSET      3
#define GET_CHAIN_STACK_SIZE        4
#define GET_PROCEDURE_STACK_SIZE    5
#define READ_CHAIN_STACK_EX         6
#define READ_PROCEDURE_STACK_EX     7
#define WRITE_PROCEDURE_STACK_EX    8
#define WRITE_CHAIN_STACK_EX        9

    .macro sys_access_hw_stacks mode, frame_addr=0, buf_addr=0, buf_size=0, size_addr=0
    {
        setwd wsz=8, nfx=1
        sdisp %ctpr1, 0x3
    }
    {
        addd,0 0, NR_access_hw_stacks, %r8
        addd,1 0, \mode, %r9
    }
    {
        nop 2
        addd,0 0, \frame_addr, %r10
        addd,1 0, \buf_addr, %r11
    }
    {
        addd,0 0, \buf_size, %r12
        addd,1 0, \size_addr, %r13
        call %ctpr1, wbs=4
    }
    .endm

#define assert_(PRED, MSG) \
            ibranch local(ok) ? PRED; \
            write("assert at " __FILE__ ":" str(__LINE__) ":\n" \
                  "assertion `" str(PRED) "` failed" MSG "\n"); \
            set_exit_code 1; \
    local(ok):

#define assert(PRED) assert_(PRED, "")
#define assertm(PRED, MSG) assert_(PRED, ", " MSG)

#define test_cmp_helper_false ~
#define test_cmp_helper_true
#define test_cmp_helper(X) glue(test_cmp_helper_, X)
#define test_cmp(OP, S1, S2, EXPECTED) \
        { \
            addd,0 0, S1, SCRATCH_REG0; \
            addd,1 0, S2, SCRATCH_REG1; \
        } \
        { \
            OP SCRATCH_REG0, SCRATCH_REG1, SCRATCH_PREG0; \
            nop 2; \
        } \
                ibranch local(ok) ? test_cmp_helper(EXPECTED) SCRATCH_PREG0; \
                write("test_cmp at " __FILE__ ":" str(__LINE__) ":\n" \
                      "assertion `" str(OP) " " str(S1) ", " str(S2) " == " str(EXPECTED) "` failed\n"); \
                set_exit_code 1; \
        local(ok):

#define assert_eq(OP, LEFT, RIGHT, MSG) \
        { \
            OP LEFT, RIGHT, SCRATCH_PREG0; \
            nop 2; \
        } \
            ibranch local(ok) ? SCRATCH_PREG0; \
            write("assert_eq at " __FILE__ ":" str(__LINE__) ":\n" \
                  "assertion `left == right` failed" MSG "\n" \
                  "  left: " #LEFT "\n" \
                  " right: " #RIGHT "\n"); \
            set_exit_code 1; \
    local(ok):

#define assert_eq_i32(LEFT, RIGHT) assert_eq(cmpesb, LEFT, RIGHT, "")
#define assert_eq_i64(LEFT, RIGHT) assert_eq(cmpedb, LEFT, RIGHT, "")

#define assert_eq_i32m(LEFT, RIGHT, MSG) assert_eq(cmpesb, LEFT, RIGHT, ", " MSG)
#define assert_eq_i64m(LEFT, RIGHT, MSG) assert_eq(cmpedb, LEFT, RIGHT, ", " MSG)

#define assert_ne(OP, LEFT, RIGHT, MSG) \
        { \
            nop 2; \
            OP LEFT, RIGHT, SCRATCH_PREG0; \
        } \
            ibranch local(ok) ? ~SCRATCH_PREG0; \
            write("assert_ne at " __FILE__ ":" str(__LINE__) ":\n" \
                  "assertion `left != right` failed, " MSG "\n" \
                  "  left: " #LEFT "\n" \
                  " right: " #RIGHT "\n"); \
            set_exit_code 1; \
    local(ok):

#define assert_ne_i32(LEFT, RIGHT) assert_ne(cmpesb, LEFT, RIGHT, "")
#define assert_ne_i64(LEFT, RIGHT) assert_ne(cmpedb, LEFT, RIGHT, "")

#define assert_ne_i32m(LEFT, RIGHT, MSG) assert_ne(cmpesb, LEFT, RIGHT, MSG)
#define assert_ne_i64m(LEFT, RIGHT, MSG) assert_ne(cmpedb, LEFT, RIGHT, MSG)

#define test_helper(OP, CMP, S1, S2, EXPECTED) \
        { \
            addd,0 0, S1, SCRATCH_REG1; \
            addd,1 0, S2, SCRATCH_REG2; \
        } \
            OP SCRATCH_REG1, SCRATCH_REG2, SCRATCH_REG0; \
        { \
            nop 2; \
            CMP SCRATCH_REG0, EXPECTED, SCRATCH_PREG0; \
        } \
            ibranch local(ok) ? SCRATCH_PREG0; \
            write("test at " __FILE__ ":" str(__LINE__) ":\n" \
                  "assertion `" str(OP) " " str(S1) ", " str(S2) " == " str(EXPECTED) "` failed\n"); \
            set_exit_code 1; \
    local(ok):

#define test_i32(OP, S1, S2, EXPECTED) test_helper(OP, cmpesb, S1, S2, EXPECTED)
#define test_i64(OP, S1, S2, EXPECTED) test_helper(OP, cmpedb, S1, S2, EXPECTED)

#define MDL_E4S         3   /* Elbrus-4S  */
#define MDL_E2S         4   /* Elbrus-2S+ */
#define MDL_E2SM        6   /* Elbrus-2SM */
#define MDL_E8S         7   /* Elbrus-8S  */
#define MDL_E1SP        8   /* Elbrus-1S+ */
#define MDL_E8S2        9   /* Elbrus-8S2 */
#define MDL_E12S        10  /* Elbrus-12S */
#define MDL_E16S        11  /* Elbrus-16S */
#define MDL_E2S3        12  /* Elbrus-2S3 */

#define LSR_LCNT(X)         ((X) & 0xffffffff)
#define LSR_ECNT(X)         (((X) & 0x1f) << 32)
#define LSR_VLC             (1 << 37)
#define LSR_OVERFLOW        (1 << 38)
#define LSR_LDMC            (1 << 39)
#define LSR_LDOVL(X)        (((X) & 0x7f) << 40)
#define LSR_PCNT(X)         (((X) & 0x1f) << 48)
#define LSR_STRRM(X)        (((X) & 0x7f) << 53)
#define LSR_SEMC            (1 << 60)

#define LSR_LCNT_F          F(0, 32, 0, 0)
#define LSR_ECNT_F          F(32, 5, 0, 0)
#define LSR_VLC_F           F(37, 1, 0, 0)
#define LSR_OVERFLOW_F      F(38, 1, 0, 0)
#define LSR_LDMC_F          F(39, 1, 0, 0)
#define LSR_LDOVL_F         F(40, 8, 0, 0)
#define LSR_PCNT_F          F(48, 5, 0, 0)
#define LSR_STRRM_F         F(53, 7, 0, 0)
#define LSR_SEMC_F          F(60, 1, 0, 0)

    .macro invalid32 dst
        udivs,5,sm 0, 0, \dst
    .endm

    .macro invalid64 dst
        udivd,5,sm 0, 0, \dst
    .endm

    .macro invalid_preg dst, scratch=SCRATCH_REG3
        invalid64 \scratch
        cmpedb,0 0, \scratch, \dst
    .endm

#endif // SRC_COMMON_H
