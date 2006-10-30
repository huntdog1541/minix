# 
! sections

.sect .text; .sect .rom; .sect .data; .sect .bss

.define	_read_tsc	! read the cycle counter (Pentium and up)

.sect .text
!*===========================================================================*
! PUBLIC void read_tsc(unsigned long *high, unsigned long *low);
! Read the cycle counter of the CPU. Pentium and up. 
.align 16
_read_tsc:
.data1 0x0f		! this is the RDTSC instruction 
.data1 0x31		! it places the TSC in EDX:EAX
	push ebp
	mov ebp, 8(esp)
	mov (ebp), edx
	mov ebp, 12(esp)
	mov (ebp), eax
	pop ebp
	ret

