%macro print 2

	mov rax,1       
	mov rdi, 1       
	mov rsi,%1     
	mov rdx,%2   
	syscall   

%endmacro

section .data
	msg db "Enter your name" ,0xA
	len equ $-msg

	cnt db 5h

section .bss
	name resb 10
	length resb 1

section .text
	global _start

_start:
	print msg,len

	mov rax, 00
	mov rdi, 00
	mov rsi, name
	mov rdx, 10
	syscall
	


	;calculating length of the string 

	dec al
	cmp al, 09h
	JBE l1
	add al, 07h
l1:	add al, 30h
	mov byte[length], al

	print length,1
	

label1:
	mov rax, 01
	mov rdi, 01
	mov rsi, name
	mov rdx, 10
	syscall
 	
	DEC byte[cnt]
	JNZ label1
	

exit:
	mov rax, 60
	mov rdi, 00
	syscall


