/************************************************************************
 * WARNING: DO NOT EDIT THIS FILE.  THIS FILE WAS AUTOMATICALLY GENERATED
 * FROM ../alpha-emulator/ifunbnum.as. ANY CHANGES MADE TO THIS FILE WILL BE LOST
 ************************************************************************/

/* Bignums. */
.align 5
.globl DoAddBignumStep
.ent DoAddBignumStep 0
/* Halfword operand from stack instruction - DoAddBignumStep */
/* arg2 has the preloaded 8 bit operand. */
	.globl DoAddBignumStepFP
	.globl DoAddBignumStepSP
	.globl DoAddBignumStepLP
	.globl DoAddBignumStepIM
.align 3
DoAddBignumStep:
#ifdef TRACING
	.byte 0x82
	.asciiz "DoAddBignumStepIM"
#endif
.align 3
DoAddBignumStepIM:	# Entry point for IMMEDIATE mode
/* This sequence is lukewarm */
        stl	$17, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [1]
        ldq	$16, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [1]
        br	$31, beginDoAddBignumStep	# [1]
#ifdef TRACING
	.byte 0x88
	.asciiz "DoAddBignumStepSP"
#endif
.align 3
DoAddBignumStepSP:	# Entry point for SP relative
        bis	$20, $31, $16 	# Assume SP mode [1-]
        cmoveq	$17, $12, $16 	# SP-pop mode [1]
        cmoveq	$17, $19, $12 	# Adjust SP if SP-pop mode [1]
#ifdef TRACING
        br	$31, headDoAddBignumStep	# [0di]
	.byte 0x90
	.asciiz "DoAddBignumStepLP"
#endif
.align 3
DoAddBignumStepLP:	# Entry point for LP relative
#ifdef TRACING
        br	$31, headDoAddBignumStep	# [1]
	.byte 0x84
	.asciiz "DoAddBignumStepFP"
#endif
.align 3
DoAddBignumStepFP:	# Entry point for FP relative
.align 3
headDoAddBignumStep:
        s8addq	$17, $16, $16 	# Compute operand address [1-]
        ldq	$16, 0($16)	# Get the operand [2]
.align 3
beginDoAddBignumStep:
/* arg1 has the operand, not sign extended if immediate. */
        ldl	$17, 0($12)	# Get arg2 [1]
        ldl	$2, 4($12)	# and its tag [1]
        srl	$16, 32, $3 	# [1-]
        extll	$16, 0, $16 	# Strip type from arg3 [1]
        subq	$3, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, ADDBIGNUMSTEPLOSE	# [1]
        ldl	$18, -8($12)	# Get arg1 [0di]
        ldl	$1, -4($12)	# and its tag [1]
        extll	$17, 0, $17 	# Clear sign extension from arg2 [0di]
        subq	$2, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, ADDBIGNUMSTEPLOSE	# [1]
        extll	$18, 0, $18 	# Clear sign extension [0di]
        subq	$1, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, ADDBIGNUMSTEPLOSE	# [1]
        addq	$16, $17, $19 	# [0di]
        addq	$18, $19, $20 	# [1]
        srl	$20, 32, $21 	# Shift the carry into arg6 [1]
        ldq	$9, CACHELINE_NEXTPCDATA($13)	#  [1-]
        ldq	$13, CACHELINE_NEXTCP($13)	#  [1]
        stl	$20, -8($12)	# Store fixnum result [1]
        stl	$1, -4($12)	# write the stack cache [1]
        stl	$21, 0($12)	# Store the carry if any [1]
        stl	$1, 4($12)	# write the stack cache [1]
        br	$31, CACHEVALID	# [1]
.align 3
ADDBIGNUMSTEPLOSE:
        bis	$31, 0, $20 	# [1-]
        bis	$31, 76, $17 	# [1]
	br	$31, ILLEGALOPERAND
.end DoAddBignumStep
/* End of Halfword operand from stack instruction - DoAddBignumStep */
.align 5
.globl DoSubBignumStep
.ent DoSubBignumStep 0
/* Halfword operand from stack instruction - DoSubBignumStep */
/* arg2 has the preloaded 8 bit operand. */
	.globl DoSubBignumStepFP
	.globl DoSubBignumStepSP
	.globl DoSubBignumStepLP
	.globl DoSubBignumStepIM
.align 3
DoSubBignumStep:
#ifdef TRACING
	.byte 0x82
	.asciiz "DoSubBignumStepIM"
#endif
.align 3
DoSubBignumStepIM:	# Entry point for IMMEDIATE mode
/* This sequence is lukewarm */
        stl	$17, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [1-]
        ldq	$16, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [1]
        br	$31, beginDoSubBignumStep	# [1]
#ifdef TRACING
	.byte 0x88
	.asciiz "DoSubBignumStepSP"
#endif
.align 3
DoSubBignumStepSP:	# Entry point for SP relative
        bis	$20, $31, $16 	# Assume SP mode [1-]
        cmoveq	$17, $12, $16 	# SP-pop mode [1]
        cmoveq	$17, $19, $12 	# Adjust SP if SP-pop mode [1]
#ifdef TRACING
        br	$31, headDoSubBignumStep	# [0di]
	.byte 0x90
	.asciiz "DoSubBignumStepLP"
#endif
.align 3
DoSubBignumStepLP:	# Entry point for LP relative
#ifdef TRACING
        br	$31, headDoSubBignumStep	# [1]
	.byte 0x84
	.asciiz "DoSubBignumStepFP"
#endif
.align 3
DoSubBignumStepFP:	# Entry point for FP relative
.align 3
headDoSubBignumStep:
        s8addq	$17, $16, $16 	# Compute operand address [1-]
        ldq	$16, 0($16)	# Get the operand [2]
.align 3
beginDoSubBignumStep:
/* arg1 has the operand, not sign extended if immediate. */
        ldl	$17, 0($12)	# Get arg2 [1]
        ldl	$2, 4($12)	# and its tag [1]
        srl	$16, 32, $3 	# [1-]
        extll	$16, 0, $16 	# Strip type from arg3 [1]
        subq	$3, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, SUBBIGNUMSTEPLOSE	# [1]
        ldl	$18, -8($12)	# Get arg1 [0di]
        ldl	$1, -4($12)	# and its tag [1]
        extll	$17, 0, $17 	# Clear sign extension from arg2 [0di]
        subq	$2, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, SUBBIGNUMSTEPLOSE	# [1]
        extll	$18, 0, $18 	# Clear sign extension [0di]
        subq	$1, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, SUBBIGNUMSTEPLOSE	# [1]
        subq	$18, $17, $19 	# arg1-arg2 [0di]
        cmplt	$19, $31, $21 	# arg6=1 if we borrowed in 1st step [1]
        extll	$19, 0, $19 	# Truncate 1st step to 32-bits [1]
        subq	$19, $16, $20 	# (arg1-arg2)-arg3 [2]
        cmplt	$20, $31, $6 	# t6=1 if we borrowed in 2nd step [1]
        ldq	$9, CACHELINE_NEXTPCDATA($13)	#  [1-]
        ldq	$13, CACHELINE_NEXTCP($13)	#  [1]
        stl	$20, -8($12)	# Store fixnum result [1]
        stl	$1, -4($12)	# write the stack cache [1]
        addq	$21, $6, $21 	# Compute borrow [1-]
        stl	$21, 0($12)	# Store the borrow if any [0di]
        stl	$1, 4($12)	# write the stack cache [1]
        br	$31, CACHEVALID	# [1]
.align 3
SUBBIGNUMSTEPLOSE:
        bis	$31, 0, $20 	# [1-]
        bis	$31, 76, $17 	# [1]
	br	$31, ILLEGALOPERAND
.end DoSubBignumStep
/* End of Halfword operand from stack instruction - DoSubBignumStep */
.align 5
.globl DoMultiplyBignumStep
.ent DoMultiplyBignumStep 0
/* Halfword operand from stack instruction - DoMultiplyBignumStep */
/* arg2 has the preloaded 8 bit operand. */
	.globl DoMultiplyBignumStepFP
	.globl DoMultiplyBignumStepSP
	.globl DoMultiplyBignumStepLP
	.globl DoMultiplyBignumStepIM
.align 3
DoMultiplyBignumStep:
#ifdef TRACING
	.byte 0x82
	.asciiz "DoMultiplyBignumStepIM"
#endif
.align 3
DoMultiplyBignumStepIM:	# Entry point for IMMEDIATE mode
/* This sequence is lukewarm */
        stl	$17, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [1-]
        ldq	$16, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [1]
        br	$31, beginDoMultiplyBignumStep	# [1]
#ifdef TRACING
	.byte 0x88
	.asciiz "DoMultiplyBignumStepSP"
#endif
.align 3
DoMultiplyBignumStepSP:	# Entry point for SP relative
        bis	$20, $31, $16 	# Assume SP mode [1-]
        cmoveq	$17, $12, $16 	# SP-pop mode [1]
        cmoveq	$17, $19, $12 	# Adjust SP if SP-pop mode [1]
#ifdef TRACING
        br	$31, headDoMultiplyBignumStep	# [0di]
	.byte 0x90
	.asciiz "DoMultiplyBignumStepLP"
#endif
.align 3
DoMultiplyBignumStepLP:	# Entry point for LP relative
#ifdef TRACING
        br	$31, headDoMultiplyBignumStep	# [1]
	.byte 0x84
	.asciiz "DoMultiplyBignumStepFP"
#endif
.align 3
DoMultiplyBignumStepFP:	# Entry point for FP relative
.align 3
headDoMultiplyBignumStep:
        s8addq	$17, $16, $16 	# Compute operand address [1-]
        ldq	$16, 0($16)	# Get the operand [2]
.align 3
beginDoMultiplyBignumStep:
/* arg1 has the operand, not sign extended if immediate. */
        ldl	$17, 0($12)	# Get arg1 [1]
        ldl	$1, 4($12)	#  [1]
        srl	$16, 32, $2 	# [1-]
        extll	$16, 0, $16 	# Strip type from arg2 [1]
        subq	$2, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, MULTBIGNUMSTEPLOSE	# [1]
        extll	$17, 0, $17 	# [0di]
        subq	$1, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, MULTBIGNUMSTEPLOSE	# [1]
        mulq	$17, $16, $18 	# arg1*arg2 [0di]
        extll	$18, 4, $21 	# arg6=high order word [23]
        ldq	$9, CACHELINE_NEXTPCDATA($13)	#  [0di]
        ldq	$13, CACHELINE_NEXTCP($13)	#  [1]
        stl	$18, 0($12)	# Store fixnum result ls word [1]
        stl	$1, 4($12)	# write the stack cache [1]
        stl	$21, 8($12)	# Store ms word [1]
        stl	$1, 12($12)	# write the stack cache [1]
        addq	$12, 8, $12 	# [0di]
        br	$31, CACHEVALID	# [1-]
.align 3
MULTBIGNUMSTEPLOSE:
        bis	$31, 0, $20 	# [1-]
        bis	$31, 80, $17 	# [1]
	br	$31, ILLEGALOPERAND
.end DoMultiplyBignumStep
/* End of Halfword operand from stack instruction - DoMultiplyBignumStep */
.align 5
.globl DoDivideBignumStep
.ent DoDivideBignumStep 0
/* Halfword operand from stack instruction - DoDivideBignumStep */
/* arg2 has the preloaded 8 bit operand. */
	.globl DoDivideBignumStepFP
	.globl DoDivideBignumStepSP
	.globl DoDivideBignumStepLP
	.globl DoDivideBignumStepIM
.align 3
DoDivideBignumStep:
#ifdef TRACING
	.byte 0x82
	.asciiz "DoDivideBignumStepIM"
#endif
.align 3
DoDivideBignumStepIM:	# Entry point for IMMEDIATE mode
/* This sequence is lukewarm */
        stl	$17, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [1-]
        ldq	$16, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [1]
        br	$31, beginDoDivideBignumStep	# [1]
#ifdef TRACING
	.byte 0x88
	.asciiz "DoDivideBignumStepSP"
#endif
.align 3
DoDivideBignumStepSP:	# Entry point for SP relative
        bis	$20, $31, $16 	# Assume SP mode [1-]
        cmoveq	$17, $12, $16 	# SP-pop mode [1]
        cmoveq	$17, $19, $12 	# Adjust SP if SP-pop mode [1]
#ifdef TRACING
        br	$31, headDoDivideBignumStep	# [0di]
	.byte 0x90
	.asciiz "DoDivideBignumStepLP"
#endif
.align 3
DoDivideBignumStepLP:	# Entry point for LP relative
#ifdef TRACING
        br	$31, headDoDivideBignumStep	# [1]
	.byte 0x84
	.asciiz "DoDivideBignumStepFP"
#endif
.align 3
DoDivideBignumStepFP:	# Entry point for FP relative
.align 3
headDoDivideBignumStep:
        s8addq	$17, $16, $16 	# Compute operand address [1-]
        ldq	$16, 0($16)	# Get the operand [2]
.align 3
beginDoDivideBignumStep:
/* arg1 has the operand, not sign extended if immediate. */
        ldl	$17, 0($12)	# Get arg2 [1]
        ldl	$1, 4($12)	#  [1]
        srl	$16, 32, $2 	# [1-]
        extll	$16, 0, $16 	# [1]
        subq	$2, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, DIVBIGNUMSTEPLOSE1	# [1]
        beq	$16, DIVBIGNUMSTEPLOSE2	# J. if division by zero [1]
        extll	$17, 0, $17 	# [1-]
        ldl	$18, -8($12)	# Get arg1 [0di]
        ldl	$3, -4($12)	#  [1]
        subq	$1, TypeFixnum, $4 	# [0di]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, DIVBIGNUMSTEPLOSE1	# [1]
        sll	$17, 32, $17 	# arg2=(ash arg2 32) [1-]
        extll	$18, 0, $18 	# [1]
        subq	$3, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, DIVBIGNUMSTEPLOSE1	# [1]
        bis	$18, $17, $19 	# arg1+(ash arg2 32) [0di]
	divqu	$19, $16, $1	# t1 is now the quotient
        mulq	$1, $16, $2 	# [1]
        subq	$19, $2, $2 	# t2 is now the remainder [23]
        stl	$1, -8($12)	# store quotient (already fixnum) [1-]
        stl	$2, 0($12)	# store remainder (already fixnum) [1]
        br	$31, NEXTINSTRUCTION	# [1]
.align 3
DIVBIGNUMSTEPLOSE1:
        bis	$31, 0, $20 	# [1-]
        bis	$31, 76, $17 	# [1]
	br	$31, ILLEGALOPERAND
.align 3
DIVBIGNUMSTEPLOSE2:
        bis	$31, 0, $20 	# [1]
        bis	$31, 2, $17 	# [1]
	br	$31, ILLEGALOPERAND
.end DoDivideBignumStep
/* End of Halfword operand from stack instruction - DoDivideBignumStep */
.align 5
.globl DoLshcBignumStep
.ent DoLshcBignumStep 0
/* Halfword operand from stack instruction - DoLshcBignumStep */
	.globl DoLshcBignumStepFP
	.globl DoLshcBignumStepSP
	.globl DoLshcBignumStepLP
	.globl DoLshcBignumStepIM
.align 3
DoLshcBignumStep:
/* arg2 has the preloaded 8 bit operand. */
#ifdef TRACING
	.byte 0x83
	.asciiz "DoLshcBignumStepIM"
#endif
.align 3
DoLshcBignumStepIM:	# Entry point for IMMEDIATE mode
/* This sequence only sucks a moderate amount */
        sll	$17, 56, $17 	# sign extend the byte argument. [1]
.align 3
G15863:
        sra	$17, 56, $17 	# Rest of sign extension [2]
        stl	$17, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [0di]
        ldq	$16, PROCESSORSTATE_IMMEDIATE_ARG($14)	#  [1]
        br	$31, beginDoLshcBignumStep	# [1]
#ifdef TRACING
	.byte 0x88
	.asciiz "DoLshcBignumStepSP"
#endif
.align 3
DoLshcBignumStepSP:	# Entry point for SP relative
        bis	$20, $31, $16 	# Assume SP mode [1-]
        cmoveq	$17, $12, $16 	# SP-pop mode [1]
        cmoveq	$17, $19, $12 	# Adjust SP if SP-pop mode [1]
#ifdef TRACING
        br	$31, headDoLshcBignumStep	# [0di]
	.byte 0x90
	.asciiz "DoLshcBignumStepLP"
#endif
.align 3
DoLshcBignumStepLP:	# Entry point for LP relative
#ifdef TRACING
        br	$31, headDoLshcBignumStep	# [1]
	.byte 0x84
	.asciiz "DoLshcBignumStepFP"
#endif
.align 3
DoLshcBignumStepFP:	# Entry point for FP relative
.align 3
headDoLshcBignumStep:
        s8addq	$17, $16, $16 	# Compute operand address [1-]
        ldq	$16, 0($16)	# Get the operand [2]
.align 3
beginDoLshcBignumStep:
/* arg1 has the operand, sign extended if immediate. */
        ldl	$17, 0($12)	# Get arg2 [1]
        ldl	$2, 4($12)	#  [1]
        subq	$12, 8, $12 	# Pop Stack [1]
        srl	$16, 32, $3 	# [1]
        extll	$16, 0, $16 	# Strip type from arg3 [1]
        subq	$3, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, LSHCBIGNUMSTEPLOSE	# [1]
        extll	$17, 0, $17 	# [1-]
        ldl	$18, 0($12)	# Get arg1 [0di]
        ldl	$1, 4($12)	#  [1]
        subq	$2, TypeFixnum, $4 	# [0di]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, LSHCBIGNUMSTEPLOSE	# [1]
        sll	$17, 32, $17 	# arg2=(ash arg2 32) [1-]
        extll	$18, 0, $18 	# [1]
        subq	$1, TypeFixnum, $4 	# [1]
        and	$4, 63, $4 	# Strip CDR code [1]
        bne	$4, LSHCBIGNUMSTEPLOSE	# [1]
        bis	$18, $17, $19 	# arg1+(ash arg2 32) [0di]
        sll	$19, $16, $20 	# [1]
        sra	$20, 32, $21 	# Extract the result [2]
        ldq	$9, CACHELINE_NEXTPCDATA($13)	#  [1-]
        ldq	$13, CACHELINE_NEXTCP($13)	#  [1]
        stl	$21, 0($12)	# Store the result as a fixnum [1]
        stl	$1, 4($12)	# write the stack cache [1]
        br	$31, CACHEVALID	# [1]
.align 3
LSHCBIGNUMSTEPLOSE:
        bis	$31, 0, $20 	# [1-]
        bis	$31, 76, $17 	# [1]
	br	$31, ILLEGALOPERAND
.end DoLshcBignumStep
/* End of Halfword operand from stack instruction - DoLshcBignumStep */
/* Fin. */


/* End of file automatically generated from ../alpha-emulator/ifunbnum.as */
