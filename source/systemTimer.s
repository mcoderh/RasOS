.globl GetTimerBase
GetTimerBase:
ldr r0,=0x3f003000
mov pc, lr

.globl GetTimeStamp
GetTimeStamp:
push {lr}
bl GetTimerBase
ldr r0, [r0, #4]
pop {pc}

.globl Wait
Wait:
delay .req r2
mov delay,r0
push {lr}
bl GetTimeStamp
start .req r3
mov start, r0

loop$:
	bl GetTimeStamp
	elapsed .req r1
	sub elapsed, r0, start
	cmp elapsed, delay
	.unreq elapsed
	bls loop$
.unreq delay
.unreq start
pop {pc}
