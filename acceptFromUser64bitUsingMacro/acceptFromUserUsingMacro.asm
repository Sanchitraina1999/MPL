%macro print 2

	mov	rax,1       
	mov rdi, 1       
	mov	rsi,%1     
	mov	rdx,%2   
	syscall   

%endmacro



section .data
	msg1 db 'What is your name? ',0xA
	len1 equ $ -msg1

	msg2 db 'Your name is: ',0xA
	len2 equ $ -msg2

	cnt db 5h
section .bss
	name resb 50

section .text
	global _start

_start:
	print msg1,len1       
	
	mov rax,0       
	mov rdi,0       
	mov	rsi,name     
	mov	rdx,15    
	syscall

	print msg2,len2

label1 :
	print name,15
	DEC  byte [cnt] ;decrement counter
	JNZ label1    ; Jump if non zero
	

	mov rax,60       
	mov rdi,0h
	syscall       
