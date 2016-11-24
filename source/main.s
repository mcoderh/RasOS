.section .init
.globl _start
_start:

b main

.section .text
main:
mov sp,#0x8000

pinNum .req r0
pinFunc .req r1
mov pinNum,#47
mov pinFunc, #1
bl SetGpioFunction
.unreq pinNum
.unreq pinFunc

ptrn .req r4
ldr ptrn, =pattern
ldr ptrn, [ptrn]
seq .req r5
mov seq,#0



loop$:
	mov r1, #1
	lsl r1, seq
	and r1, ptrn
	teq seq, #31
	moveq seq, #0
	addne seq, #1

	pinNum .req r0
	pinVal .req r1
	mov pinNum, #47
	bl SetGpio
	.unreq pinNum
	.unreq pinVal

	delay .req r0
	ldr delay, =250000
	bl Wait
	.unreq delay	

b loop$

.section .data
.align 2
pattern:
.int 0b11111111101010100010001000101010
