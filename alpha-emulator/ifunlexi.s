/************************************************************************
 * WARNING: DO NOT EDIT THIS FILE.  THIS FILE WAS AUTOMATICALLY GENERATED
 * FROM ../alpha-emulator/ifunlexi.as. ANY CHANGES MADE TO THIS FILE WILL BE LOST
 ************************************************************************/

/* Lexical variable accessors. */
.align 5
.globl DoPushLexicalVarN
.ent DoPushLexicalVarN 0
/* Halfword operand from stack instruction - DoPushLexicalVarN */
/* arg2 has the preloaded 8 bit operand. */
	.globl DoPushLexicalVarNFP
	.globl DoPushLexicalVarNSP
	.globl DoPushLexicalVarNLP
	.globl DoPushLexicalVarNIM
.align 3
DoPushLexicalVarN:
#ifdef TRACING
	.byte 0x88
	.asciiz "DoPushLexicalVarNSP"
#endif
.align 3
DoPushLexicalVarNSP:	# Entry point for SP relative
        bis	$20, $31, $16 	# Assume SP mode [1]
        cmoveq	$17, $12, $16 	# SP-pop mode [1]
        cmoveq	$17, $19, $12 	# Adjust SP if SP-pop mode [1]
#ifdef TRACING
        br	$31, beginDoPushLexicalVarN	# [0di]
	.byte 0x90
	.asciiz "DoPushLexicalVarNLP"
#endif
.align 3
DoPushLexicalVarNLP:	# Entry point for LP relative
#ifdef TRACING
        br	$31, beginDoPushLexicalVarN	# [1]
	.byte 0x84
	.asciiz "DoPushLexicalVarNFP"
#endif
.align 3
DoPushLexicalVarNFP:	# Entry point for FP relative
.align 3
beginDoPushLexicalVarN:
/* arg1 has the operand address. */
        s8addq	$17, $16, $16 	# Compute operand address [1-]
        srl	$18, 10, $4 	# Position the opcode [1]
        ldl	$1, 0($16)	#  [1-]
        ldl	$2, 4($16)	#  [1]
        and	$4, 7, $4 	# Get the lexical var number [1-]
        extll	$1, 0, $1 	# [1]
/* TagType. */
        and	$2, 63, $3 	# [1]
        subq	$3, TypeList, $3 	# [1]
        bic	$3, 4, $3 	# [1]
        addq	$1, $4, $1 	# Compute the address of the lexical variable. [1]
        bne	$3, PUSHLEXVARIOP	# [1-]
        ldq	$20, PROCESSORSTATE_STACKCACHEBASEVMA($14)	#  [0di]
        ldl	$21, PROCESSORSTATE_SCOVLIMIT($14)	# Size of the stack cache (words) [1]
/* Memory Read Internal */
G15406:
        addq	$1, $14, $6 	# [0di]
        s4addq	$6, $31, $3 	# [1]
        ldq_u	$2, 0($6)	#  [1di]
        subq	$1, $20, $4 	# Stack cache offset [1-]
        ldq	$7, PROCESSORSTATE_DATAREAD_MASK($14)	#  [0di]
        cmpult	$4, $21, $5 	# In range? [1-]
        ldl	$3, 0($3)	#  [0di]
        extbl	$2, $6, $2 	# [1-]
        bne	$5, G15408	# [0di]
G15407:
        lda	$6, 240	#  [1-]
        srl	$7, $2, $7 	# [1]
        srl	$6, $2, $6 	# [1]
        blbs	$7, G15410	# [1di]
G15417:
        ldq	$9, CACHELINE_NEXTPCDATA($13)	#  [1-]
        ldq	$13, CACHELINE_NEXTCP($13)	#  [1]
        and	$2, 63, $4 	# set CDR-NEXT [1-]
        stl	$3, 8($12)	#  [0di]
        stl	$4, 12($12)	# write the stack cache [1]
        addq	$12, 8, $12 	# [0di]
        br	$31, CACHEVALID	# [1-]
.align 3
PUSHLEXVARIOP:
        bis	$31, 0, $20 	# [1-]
        bis	$31, 82, $17 	# [1]
	br	$31, ILLEGALOPERAND	# Not a list or locative
.align 3
G15408:
        ldq	$5, PROCESSORSTATE_STACKCACHEDATA($14)	#  [1-]
        s8addq	$4, $5, $4 	# reconstruct SCA [3]
        ldl	$3, 0($4)	#  [2]
        ldl	$2, 4($4)	# Read from stack cache [1]
        br	$31, G15407	# [1]
.align 3
G15410:
        blbc	$6, G15409	# [1]
        extll	$3, 0, $1 	# Do the indirect thing [0di]
        br	$31, G15406	# [1-]
.align 3
G15409:
        ldq	$7, PROCESSORSTATE_DATAREAD($14)	# Load the memory action table for cycle [1]
/* TagType. */
        and	$2, 63, $6 	# Discard the CDR code [0di]
        stq	$1, PROCESSORSTATE_VMA($14)	# stash the VMA for the (likely) trap [1-]
        s4addq	$6, $7, $6 	# Adjust for a longword load [2di]
        ldl	$7, 0($6)	# Get the memory action [2]
.align 3
G15414:
        and	$7, MemoryActionTransform, $6 	# [3]
        beq	$6, G15413	# [1]
        bic	$2, 63, $2 	# [1-]
        bis	$2, TypeExternalValueCellPointer, $2 	# [1]
        br	$31, G15417	# [1-]
#ifndef MINIMA
G15413:
#endif
#ifdef MINIMA
.align 3
G15413:
        and	$7, MemoryActionBinding, $6 	# [1-]
        ldq	$5, PROCESSORSTATE_DBCMASK($14)	#  [0di]
        beq	$6, G15412	# [1-]
        sll	$1, 1, $4 	# [0di]
        ldq	$6, PROCESSORSTATE_DBCBASE($14)	#  [1-]
        and	$4, $5, $4 	# Hash index [1di]
        bis	$31, 1, $5 	# [1]
        sll	$5, IvoryMemoryData, $5 	# [1]
        addl	$4, $6, $4 	# [1]
        extll	$4, 0, $4 	# Clear sign-extension [1]
        s4addq	$4, $5, $5 	# [2]
        ldl	$4, 0($5)	# Fetch the key [2]
        ldl	$3, 4($5)	# Fetch value [1]
        subl	$1, $4, $6 	# Compare [2di]
        bne	$6, G15416	# Trap on miss [1]
        extll	$3, 0, $1 	# Extract the pointer, and indirect [0di]
        br	$31, G15406	# This is another memory read tailcall. [1-]
.align 3
G15416:
	br	$31, DBCACHEMISSTRAP
#endif
G15412:
/* Perform memory action */
        bis	$31, $7, $16 	# [1-]
        bis	$31, 0, $17 	# [1]
	br	$31, PERFORMMEMORYACTION
#ifdef TRACING
	.byte 0x82
	.asciiz "DoPushLexicalVarNIM"
#endif
DoPushLexicalVarNIM:	# Entry point for IMMEDIATE mode
	br	$31, DoIStageError	# IMMEDIATE mode not legal in DoPushLexicalVarN.
.end DoPushLexicalVarN
/* End of Halfword operand from stack instruction - DoPushLexicalVarN */
.align 5
.globl DoPopLexicalVarN
.ent DoPopLexicalVarN 0
/* Halfword operand from stack instruction - DoPopLexicalVarN */
/* arg2 has the preloaded 8 bit operand. */
	.globl DoPopLexicalVarNFP
	.globl DoPopLexicalVarNSP
	.globl DoPopLexicalVarNLP
	.globl DoPopLexicalVarNIM
.align 3
DoPopLexicalVarN:
#ifdef TRACING
	.byte 0x88
	.asciiz "DoPopLexicalVarNSP"
#endif
.align 3
DoPopLexicalVarNSP:	# Entry point for SP relative
        bis	$20, $31, $16 	# Assume SP mode [1]
        cmoveq	$17, $12, $16 	# SP-pop mode [1]
        cmoveq	$17, $19, $12 	# Adjust SP if SP-pop mode [1]
#ifdef TRACING
        br	$31, beginDoPopLexicalVarN	# [0di]
	.byte 0x90
	.asciiz "DoPopLexicalVarNLP"
#endif
.align 3
DoPopLexicalVarNLP:	# Entry point for LP relative
#ifdef TRACING
        br	$31, beginDoPopLexicalVarN	# [1]
	.byte 0x84
	.asciiz "DoPopLexicalVarNFP"
#endif
.align 3
DoPopLexicalVarNFP:	# Entry point for FP relative
.align 3
beginDoPopLexicalVarN:
/* arg1 has the operand address. */
        s8addq	$17, $16, $16 	# Compute operand address [1-]
        srl	$18, 10, $4 	# Position the opcode [1]
        ldl	$1, 0($16)	#  [1-]
        ldl	$2, 4($16)	#  [1]
        and	$4, 7, $4 	# Get the lexical var number [1-]
        extll	$1, 0, $1 	# [1]
/* TagType. */
        and	$2, 63, $3 	# [1]
        subq	$3, TypeList, $3 	# [1]
        bic	$3, 4, $3 	# [1]
        addq	$1, $4, $1 	# Compute the address of the lexical variable. [1]
        bne	$3, POPLEXVARIOP	# [1-]
        ldl	$3, 0($12)	#  [1]
        ldl	$2, 4($12)	#  [1]
        subq	$12, 8, $12 	# Pop Stack. [1]
        extll	$3, 0, $3 	# [1]
        ldq	$20, PROCESSORSTATE_STACKCACHEBASEVMA($14)	#  [0di]
        ldl	$21, PROCESSORSTATE_SCOVLIMIT($14)	# Size of the stack cache (words) [1]
/* Memory Read Internal */
G15418:
        addq	$1, $14, $8 	# [0di]
        s4addq	$8, $31, $5 	# [1]
        ldq_u	$4, 0($8)	#  [1di]
        subq	$1, $20, $6 	# Stack cache offset [1-]
        ldq	$22, PROCESSORSTATE_DATAWRITE_MASK($14)	#  [0di]
        cmpult	$6, $21, $7 	# In range? [1-]
        ldl	$5, 0($5)	#  [0di]
        extbl	$4, $8, $4 	# [1-]
        bne	$7, G15420	# [0di]
G15419:
        lda	$8, 240	#  [1-]
        srl	$22, $4, $22 	# [1]
        srl	$8, $4, $8 	# [1]
        blbs	$22, G15422	# [1di]
G15428:
/* Merge cdr-code */
        and	$2, 63, $5 	# [1-]
        and	$4, 192, $4 	# [1]
        bis	$4, $5, $4 	# [1]
        addq	$1, $14, $6 	# [1]
        s4addq	$6, $31, $5 	# [1]
        ldq_u	$8, 0($6)	#  [1di]
        subq	$1, $20, $7 	# Stack cache offset [1-]
        cmpult	$7, $21, $22 	# In range? [1]
        insbl	$4, $6, $7 	# [1]
        mskbl	$8, $6, $8 	# [1]
.align 3
G15430:
        bis	$8, $7, $8 	# [2]
        stq_u	$8, 0($6)	#  [0di]
        stl	$3, 0($5)	#  [1]
        bne	$22, G15429	# J. if in cache [1]
        br	$31, NEXTINSTRUCTION	# [1]
        br	$31, NEXTINSTRUCTION	# [1]
.align 3
POPLEXVARIOP:
        bis	$31, 0, $20 	# [1-]
        bis	$31, 17, $17 	# [1]
	br	$31, ILLEGALOPERAND	# Not a list or locative
.align 3
G15429:
        ldq	$6, PROCESSORSTATE_STACKCACHEDATA($14)	#  [1-]
        subq	$1, $20, $7 	# Stack cache offset [0di]
        s8addq	$7, $6, $6 	# reconstruct SCA [3]
        stl	$3, 0($6)	# Store in stack [2]
        stl	$4, 4($6)	# write the stack cache [1]
        br	$31, NEXTINSTRUCTION	# [1]
.align 3
G15420:
        ldq	$7, PROCESSORSTATE_STACKCACHEDATA($14)	#  [1]
        s8addq	$6, $7, $6 	# reconstruct SCA [3]
        ldl	$5, 0($6)	#  [2]
        ldl	$4, 4($6)	# Read from stack cache [1]
        br	$31, G15419	# [1]
.align 3
G15422:
        blbc	$8, G15421	# [1]
        extll	$5, 0, $1 	# Do the indirect thing [0di]
        br	$31, G15418	# [1-]
.align 3
G15421:
        ldq	$22, PROCESSORSTATE_DATAWRITE($14)	# Load the memory action table for cycle [1]
/* TagType. */
        and	$4, 63, $8 	# Discard the CDR code [0di]
        stq	$1, PROCESSORSTATE_VMA($14)	# stash the VMA for the (likely) trap [1-]
        s4addq	$8, $22, $8 	# Adjust for a longword load [2di]
        ldl	$22, 0($8)	# Get the memory action [2]
#ifndef MINIMA
G15425:
#endif
#ifdef MINIMA
.align 3
G15425:
        and	$22, MemoryActionBinding, $8 	# [3]
        ldq	$7, PROCESSORSTATE_DBCMASK($14)	#  [0di]
        beq	$8, G15424	# [1-]
        sll	$1, 1, $6 	# [0di]
        ldq	$8, PROCESSORSTATE_DBCBASE($14)	#  [1-]
        and	$6, $7, $6 	# Hash index [1di]
        bis	$31, 1, $7 	# [1]
        sll	$7, IvoryMemoryData, $7 	# [1]
        addl	$6, $8, $6 	# [1]
        extll	$6, 0, $6 	# Clear sign-extension [1]
        s4addq	$6, $7, $7 	# [2]
        ldl	$6, 0($7)	# Fetch the key [2]
        ldl	$5, 4($7)	# Fetch value [1]
        subl	$1, $6, $8 	# Compare [2di]
        bne	$8, G15427	# Trap on miss [1]
        extll	$5, 0, $1 	# Extract the pointer, and indirect [0di]
        br	$31, G15418	# This is another memory read tailcall. [1-]
.align 3
G15427:
	br	$31, DBCACHEMISSTRAP
#endif
G15424:
/* Perform memory action */
        bis	$31, $22, $16 	# [1-]
        bis	$31, 1, $17 	# [1]
	br	$31, PERFORMMEMORYACTION
#ifdef TRACING
	.byte 0x82
	.asciiz "DoPopLexicalVarNIM"
#endif
DoPopLexicalVarNIM:	# Entry point for IMMEDIATE mode
	br	$31, DoIStageError	# IMMEDIATE mode not legal in DoPopLexicalVarN.
.end DoPopLexicalVarN
/* End of Halfword operand from stack instruction - DoPopLexicalVarN */
.align 5
.globl DoMovemLexicalVarN
.ent DoMovemLexicalVarN 0
/* Halfword operand from stack instruction - DoMovemLexicalVarN */
/* arg2 has the preloaded 8 bit operand. */
	.globl DoMovemLexicalVarNFP
	.globl DoMovemLexicalVarNSP
	.globl DoMovemLexicalVarNLP
	.globl DoMovemLexicalVarNIM
.align 3
DoMovemLexicalVarN:
#ifdef TRACING
	.byte 0x88
	.asciiz "DoMovemLexicalVarNSP"
#endif
.align 3
DoMovemLexicalVarNSP:	# Entry point for SP relative
        bis	$20, $31, $16 	# Assume SP mode [1]
        cmoveq	$17, $12, $16 	# SP-pop mode [1]
        cmoveq	$17, $19, $12 	# Adjust SP if SP-pop mode [1]
#ifdef TRACING
        br	$31, beginDoMovemLexicalVarN	# [0di]
	.byte 0x90
	.asciiz "DoMovemLexicalVarNLP"
#endif
.align 3
DoMovemLexicalVarNLP:	# Entry point for LP relative
#ifdef TRACING
        br	$31, beginDoMovemLexicalVarN	# [1]
	.byte 0x84
	.asciiz "DoMovemLexicalVarNFP"
#endif
.align 3
DoMovemLexicalVarNFP:	# Entry point for FP relative
.align 3
beginDoMovemLexicalVarN:
/* arg1 has the operand address. */
        s8addq	$17, $16, $16 	# Compute operand address [1-]
        srl	$18, 10, $4 	# Position the opcode [1]
        ldl	$1, 0($16)	#  [1-]
        ldl	$2, 4($16)	#  [1]
        and	$4, 7, $4 	# Get the lexical var number [1-]
        extll	$1, 0, $1 	# [1]
/* TagType. */
        and	$2, 63, $3 	# [1]
        subq	$3, TypeList, $3 	# [1]
        bic	$3, 4, $3 	# [1]
        addq	$1, $4, $1 	# Compute the address of the lexical variable. [1]
        bne	$3, MOVEMLEXVARIOP	# [1-]
        ldl	$3, 0($12)	#  [1]
        ldl	$2, 4($12)	#  [1]
        extll	$3, 0, $3 	# [2di]
        ldq	$20, PROCESSORSTATE_STACKCACHEBASEVMA($14)	#  [1-]
        ldl	$21, PROCESSORSTATE_SCOVLIMIT($14)	# Size of the stack cache (words) [1]
/* Memory Read Internal */
G15431:
        addq	$1, $14, $8 	# [1-]
        s4addq	$8, $31, $5 	# [1]
        ldq_u	$4, 0($8)	#  [1-]
        subq	$1, $20, $6 	# Stack cache offset [0di]
        ldq	$22, PROCESSORSTATE_DATAWRITE_MASK($14)	#  [1-]
        cmpult	$6, $21, $7 	# In range? [0di]
        ldl	$5, 0($5)	#  [1-]
        extbl	$4, $8, $4 	# [1di]
        bne	$7, G15433	# [1-]
G15432:
        lda	$8, 240	#  [0di]
        srl	$22, $4, $22 	# [1]
        srl	$8, $4, $8 	# [1]
        blbs	$22, G15435	# [1-]
G15441:
/* Merge cdr-code */
        and	$2, 63, $5 	# [0di]
        and	$4, 192, $4 	# [1]
        bis	$4, $5, $4 	# [1]
        addq	$1, $14, $6 	# [1]
        s4addq	$6, $31, $5 	# [1]
        ldq_u	$8, 0($6)	#  [1-]
        subq	$1, $20, $7 	# Stack cache offset [0di]
        cmpult	$7, $21, $22 	# In range? [1]
        insbl	$4, $6, $7 	# [1]
        mskbl	$8, $6, $8 	# [1]
.align 3
G15443:
        bis	$8, $7, $8 	# [2]
        stq_u	$8, 0($6)	#  [0di]
        stl	$3, 0($5)	#  [1]
        bne	$22, G15442	# J. if in cache [1]
        br	$31, NEXTINSTRUCTION	# [1]
        br	$31, NEXTINSTRUCTION	# [1]
.align 3
MOVEMLEXVARIOP:
        bis	$31, 0, $20 	# [1-]
        bis	$31, 17, $17 	# [1]
	br	$31, ILLEGALOPERAND	# Not a list or locative
.align 3
G15442:
        ldq	$6, PROCESSORSTATE_STACKCACHEDATA($14)	#  [1-]
        subq	$1, $20, $7 	# Stack cache offset [0di]
        s8addq	$7, $6, $6 	# reconstruct SCA [3]
        stl	$3, 0($6)	# Store in stack [2]
        stl	$4, 4($6)	# write the stack cache [1]
        br	$31, NEXTINSTRUCTION	# [1]
.align 3
G15433:
        ldq	$7, PROCESSORSTATE_STACKCACHEDATA($14)	#  [1]
        s8addq	$6, $7, $6 	# reconstruct SCA [3]
        ldl	$5, 0($6)	#  [2]
        ldl	$4, 4($6)	# Read from stack cache [1]
        br	$31, G15432	# [1]
.align 3
G15435:
        blbc	$8, G15434	# [1]
        extll	$5, 0, $1 	# Do the indirect thing [0di]
        br	$31, G15431	# [1-]
.align 3
G15434:
        ldq	$22, PROCESSORSTATE_DATAWRITE($14)	# Load the memory action table for cycle [1]
/* TagType. */
        and	$4, 63, $8 	# Discard the CDR code [0di]
        stq	$1, PROCESSORSTATE_VMA($14)	# stash the VMA for the (likely) trap [1-]
        s4addq	$8, $22, $8 	# Adjust for a longword load [2di]
        ldl	$22, 0($8)	# Get the memory action [2]
#ifndef MINIMA
G15438:
#endif
#ifdef MINIMA
.align 3
G15438:
        and	$22, MemoryActionBinding, $8 	# [3]
        ldq	$7, PROCESSORSTATE_DBCMASK($14)	#  [0di]
        beq	$8, G15437	# [1-]
        sll	$1, 1, $6 	# [0di]
        ldq	$8, PROCESSORSTATE_DBCBASE($14)	#  [1-]
        and	$6, $7, $6 	# Hash index [1di]
        bis	$31, 1, $7 	# [1]
        sll	$7, IvoryMemoryData, $7 	# [1]
        addl	$6, $8, $6 	# [1]
        extll	$6, 0, $6 	# Clear sign-extension [1]
        s4addq	$6, $7, $7 	# [2]
        ldl	$6, 0($7)	# Fetch the key [2]
        ldl	$5, 4($7)	# Fetch value [1]
        subl	$1, $6, $8 	# Compare [2di]
        bne	$8, G15440	# Trap on miss [1]
        extll	$5, 0, $1 	# Extract the pointer, and indirect [0di]
        br	$31, G15431	# This is another memory read tailcall. [1-]
.align 3
G15440:
	br	$31, DBCACHEMISSTRAP
#endif
G15437:
/* Perform memory action */
        bis	$31, $22, $16 	# [1-]
        bis	$31, 1, $17 	# [1]
	br	$31, PERFORMMEMORYACTION
#ifdef TRACING
	.byte 0x82
	.asciiz "DoMovemLexicalVarNIM"
#endif
DoMovemLexicalVarNIM:	# Entry point for IMMEDIATE mode
	br	$31, DoIStageError	# IMMEDIATE mode not legal in DoMovemLexicalVarN.
.end DoMovemLexicalVarN
/* End of Halfword operand from stack instruction - DoMovemLexicalVarN */
/* Fin. */


/* End of file automatically generated from ../alpha-emulator/ifunlexi.as */
