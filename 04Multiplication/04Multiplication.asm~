
%macro	print 2
	mov	rax, 01h
	mov	rdi, 01h
	mov	rsi, %1
	mov	rdx, %2
	syscall
%endmacro

%macro	read 2
	mov	rax, 00h
	mov	rdi, 00h
	mov	rsi, %1
	mov	rdx, %2
	syscall
%endmacro



section .data
	msg:	db	0xA, "1.Succesive Addition", 0xA
		db	"2.Shift method", 0xA
		db	"3.EXIT", 0xA
	len:	equ	$-msg
	msg1:	db	"Enter the number", 0xA
	len1:	equ	$-msg1
	msg2:	db	"The Result is", 0xA
	len2:	equ	$-msg2


section .bss

	num:	resb 2
	number1:resb 3
	number2:resb 3
	num1:	resb 1
	num2:	resb 1
	result:	resb 4
	res:	resb 4
	cnt:	resb 2



section .text
global _start
_start:

	print	msg, len
	read	num, 2

	cmp byte[num], 31H
	je first

	cmp byte[num], 32H
	je second

	cmp byte[num], 33H
	je exit

first:  mov rax,00
	mov rbx,00
	mov rcx,00
	mov rdx,00

	print	msg1, len1
	read	number1, 3
	call atoh1
	mov dl,bl
	mov byte[num1],bl
	
	mov rbx,00

	print	msg1, len1
	read	number2, 3
	call atoh2
	mov cl,bl
	mov byte[num2],bl
	
	mov rax,00
	mov rbx,00
	mov rcx,00
	mov rdx,00

	
	mov cl,byte[num2]
	mov dl,byte[num1]
	cmp cl,00	
	je next	
up:	add ax,dx
	sub cl,01H
	jne up
next:	mov dx,ax

	call htoa
	call _start



second:
	mov rax,00
	mov rbx,00
	mov rcx,00
	mov rdx,00

	print	msg1, len1
	read	number1, 3
	call atoh1
	mov dl,bl
	mov byte[num1],bl
	
	mov rbx,00

	print	msg1, len1
	read	number2, 3
	call atoh2
	mov cl,bl
	mov byte[num2],bl
	
	mov rax,00
	mov rbx,00
	mov rcx,00
	mov rdx,00

	mov al,byte[num1]
	mov bl,byte[num2]
	mov cx,00
	mov dx,08
up4:	shr bx,01
	jnc flag
	add cx,ax
flag:	shl ax,01
	dec dx
	jnz up4
	mov dx,00
	mov dx,cx
	call htoa
	call _start
	
		
exit:	mov	rax, 60h
	mov	rdi, 00h
	syscall


atoh1: 	mov rsi,number1
	mov byte[cnt],2
	mov bx,00
up1:	rol bl,4
	mov dl,byte[rsi]
	cmp dl,39H
	jbe next1
	sub dl,07H
next1:	sub dl,30H
	add bl,dl
	inc rsi
	dec byte[cnt]
	jnz up1	
ret



atoh2: 	mov rsi,number2
	mov byte[cnt],2
	mov bx,00
up2:	rol bl,4
	mov dl,byte[rsi]
	cmp dl,39H
	jbe next2
	sub dl,07H
next2:	sub dl,30H
	add bl,dl
	inc rsi
	dec byte[cnt]
	jnz up2
ret


htoa:	mov rsi,result
	mov byte[cnt],4
upp:	rol dx,04
	mov cx,dx
	and cx,0FH
	cmp cx,09H
	jbe nextt
	add cx,07H
	
nextt:	add cx,30H
	mov word[rsi],cx
	inc rsi
	dec byte[cnt]
	jnz upp
	print	msg2, len2
	print	result, 4
ret
