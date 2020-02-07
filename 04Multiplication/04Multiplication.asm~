;Write X86/64 ALP to perform multiplication of two 8-bit
;hexadecimal numbers. Use successive addition and add and shift
;method. (use of 64-bit registers is expected)

%macro print 2
	mov rax,01
	mov rdi,01
	mov rsi,%1
	mov rdx,%2
	syscall
%macro

%macro exit 0
	mov rax,60
	mov rdi,00
%endmacro

section.data
	msg1 : db "Enter first number",0xA
	len1 : equ $-msg1

	msg2 : db "Enter second number",0xA
	len2 : equ $-msg2
