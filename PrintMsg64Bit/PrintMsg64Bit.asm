section	.data
	msg db 'Hello, world!', 0xA  ;string to be printed
	len equ $ -msg     ;length of the string

section	.text
	global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
	mov	rax,1       ;system call number (sys_write)
	mov rdi,1       ;file descriptor (stdout)
	mov	rsi,msg     ;message length
	mov	rdx,len     ;message to write
	syscall        ;call kernel

	mov	rax,60       ;system call number (sys_exit)
	mov rdi,0h
	syscall        ;call kernel
