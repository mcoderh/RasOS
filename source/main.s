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


loop$:
	pinNum .req r0
	pinVal .req r1
	mov pinNum, #47
	mov pinVal, #0
	bl SetGpio
	.unreq pinNum
	.unreq pinVal

	delay .req r0
	ldr delay, =100000
	bl Wait
	.unreq delay

	pinNum .req r0
	pinVal .req r1
	mov pinNum, #47
	mov pinVal, #1
	bl SetGpio
	.unreq pinNum
	.unreq pinVal

	delay .req r0
	ldr delay, =100000
	bl Wait
	.unreq delay

b loop$
