.section .init
.global _start
_start:

ldr r0, =0x3f200000
mov r1, #1
lsl r1, #21
str r1, [r0, #16]

loop$:
	mov r1, #1
	lsl r1, #15
	str r1, [r0, #32]

	mov r2, #0x3F0000
	wait1$:
		sub r2, #1
		cmp r2, #0
	bne wait1$

	str r1, [r0, #44]

	mov r2, #0x3F0000
	wait2$:
		sub r2, #1
		cmp r2, #0
	bne wait2$	

b loop$
