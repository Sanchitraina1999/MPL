section	.data

	msg1 db 30h, 0xA  ;string to be printed  30h is the ASCII value of 0 
	len1 equ $ -msg1     ;length of the string

	msg2 db 31h, 0xA  ;string to be printed  31h is the ASCII value of 1
	len2 equ $ -msg2     ;length of the string


section	.text
	global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
	mov	rax,1       ;system call number (sys_write)
	mov rdi,1       ;file descriptor (stdout)
	mov	rsi,msg1     ;message length
	mov	rdx,len1    ;message to write
	syscall        ;call kernel

	mov	rax,1       ;system call number (sys_write)
	mov rdi,1       ;file descriptor (stdout)
	mov	rsi,msg2     ;message length
	mov	rdx,len2   ;message to write
	syscall        ;call kernel

	mov	rax,60       ;system call number (sys_exit)
	mov rdi,0h
	syscall        ;call kernel
