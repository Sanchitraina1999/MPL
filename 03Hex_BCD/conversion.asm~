	;Number Conversion
	;Write 64 bit ALP to convert 4-digit Hex number into its equivalent
	;BCD number and 5-digit BCD number into its equivalent HEX
	;number. Make your program user friendly to accept the choice from
	;user for:
	;a) HEX to BCD
	;b) BCD to HEX
	;c) EXIT

section .data
	msgMAIN :  db "MENU",0xA
		db "1. HEX to BCD", 0x0A
		db "2. BCD to HEX", 0x0A
		db "3. EXIT",0x0A
		db "   Select one of the following ",0xA
	lenMAIN:equ $-msgMAIN

	msgHEX : db "Enter the HEX Number", 0x0A
	lenHEX : equ $-msgHEX

	msgBCD : db "Enter the BCD Number", 0x0A
	lenBCD : equ $-msgBCD

	cnt : db 0
	enter : db 0xA

section .bss
	%macro scall 4         ;for scall 1,1,msg,len  --prints
		mov rax, %1    ;for scall 0,1,msg,len  -- accepts
		mov rdi, %2
		mov rsi, %3
		mov rdx, %4
		syscall
	%endmacro
	choice: resb 2
	num : resb 5
	num1 : resb 9
	ans : resb 1
	result : resb 5
	factor : resb 5

section .text
	global _start
_start:
	scall 1,1,msgMAIN,lenMAIN
	scall 0,1,choice,2
	cmp byte[choice],31h
	je option1
	cmp byte[choice],32h
	je option2
	cmp byte[choice],33h
	je exit
	
option1:
	;***************HEX to BCD conversion***************
	
	scall 1,1,msgHEX,lenHEX
	scall 0,1,num,5
	call A2H
	mov bx,0xA
	mov byte[cnt],00
up:
	mov dx,00
	div bx
	push ax
	inc byte[cnt]
	cmp ax,00
	jne up
print:
	pop ax
	cmp ax,09h
	jbe next2
	add ax,07h
next2:
	add ax,30h
	mov byte[ans],al
	scall 1,1,ans,1	
	dec byte[cnt]
	jnz print
	scall 1,1,enter,1
	jmp _start

	;**************ASCII to HEX (4 digit no )**************
A2H:
	mov rsi,num
	mov ax,00h
	mov byte[cnt],04h
up1:	rol ax,04
	mov bl,byte[rsi]
	cmp bl,39h
	jbe next
	sub bl,07h
next:
	sub bl,30h
	add al,bl
	inc rsi
	dec byte[cnt]
	jnz up1
	ret

	;*******************DISPLAY***********************
display:
	mov rsi,result+4
	mov byte[cnt],5
calc:
	mov cl,00h
	mov cl,bl
	and cl,0x0F
	cmp cl,09h
	jbe next4
	add cl,007h
next4:
	add cl,30h
	mov byte[rsi],cl
	ror ebx,4
	dec rsi
	dec byte[cnt]
	jnz calc
	scall 1,1,result,5
	ret

	;*******************BCD to HEX***********************	
option2:
	scall 1,1,msgBCD,lenBCD
	scall 0,1,num1,9
	mov rsi,num1+7
	mov byte[cnt],05
	mov ebx,00h
	mov dword[factor],1
up4:
	mov eax,0h
	mov al,byte[rsi]
	sub al,30h
	mul dword[factor]
	add ebx,eax
	mov ax,0x0A
	mul dword[factor]
	mov dword[factor],eax
	dec rsi
	dec byte[cnt]
	jnz up4
	call display
	scall 1,1,enter,1
	jmp _start	


	;*******************EXIT**************************
exit:
	mov rax,60
	mov rdi,0
	syscall
