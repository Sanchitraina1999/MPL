section .data
	msg1 db 'What is your name? ',0xA
	len1 equ $ -msg1

	msg2 db 'Your name is: ',0xA
	len2 equ $ -msg2

section .bss
	name resb 50

section .text
	global _start

_start:
	mov	rax,1       
	mov rdi,1       
	mov	rsi,msg1     
	mov	rdx,len1   
	syscall       
	
	mov rax,0       
	mov rdi,0       
	mov	rsi,name     
	mov	rdx,15    
	syscall

	mov	rax,1       
	mov rdi,1       
	mov	rsi,msg2     
	mov	rdx,len2   
	syscall   

	mov	rax,1       
	mov rdi,1       
	mov	rsi,name     
	mov	rdx,15   
	syscall            
	

	mov rax,60       
	mov rdi,0h
	syscall       
