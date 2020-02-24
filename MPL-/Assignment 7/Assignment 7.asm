section .data

menu :   db "*******MENU*******",0x0A
		db "1.Ascending Order",0x0A
	        db "2.Descending Order",0x0A
		db "3.Exit",0x0A
lenM : equ $-menu

fname : db 'a.txt',0			;0 helps to find the file 
warn: db "Sorry file can't be opened",0x0A
len : equ $-warn
success : db "File is opened successfully",0x0A
lens : equ $-success



section .bss
fd_in : resb 8
buffer : resb 30
len1 : resb 8
	%macro mymacro 4
	mov rax,%1
	mov rdi,%2
	mov rsi,%3
	mov rdx,%4
	syscall
	%endmacro
choice: resb 2
cnt1: resb 2
cnt2: resb 2


section .text
global main
main:

;***************OPEN THE FILE******************

	mymacro 2,fname,2,0777
	
	;rax return the file descriptor
	mov qword[fd_in],rax
	BT rax,63
	jnc down
	mymacro 1,1,warn,len
	jmp exit
down:
	mymacro 1,1,success,lens
	mymacro 0,[fd_in],buffer,30

	
	;rax return the no of byte recievd..
	mov qword[len1],rax
	mymacro 1,1,menu,lenM
	mymacro 0,1,choice,2
	cmp byte[choice],31h
	je option1
	cmp byte[choice],32h
	je option2
	cmp byte[choice],33h
	jae exit

;*****Ascending order *****
option1:
	call ascending
	mymacro 1,[fd_in],buffer,qword[len1]
	jmp exit

;*****Descending order *****
option2:
	call descending
	mymacro 1,[fd_in],buffer,qword[len1]
	jmp exit	


;*****Procedure to sort the number in ascending order*****

ascending:	
	mov byte[cnt1],5
up2:
	mov ax,0
	mov dx,0
	mov byte[cnt2],4
	mov rsi,buffer
	mov rdi,buffer
up1:
	mov al,byte[rsi]
	add rsi,2
	cmp byte[rsi],al
	jnc down1
	; Do the Swapping of number...
	mov dl,byte[rsi]
	mov byte[rdi],dl
	mov byte[rsi],al
down1:
	add rdi,2
	dec byte[cnt2]
	jnz up1
	dec byte[cnt1]
	jnz up2
	ret

;*****Procedure to sort the number in descending  order*****
descending :	
	mov byte[cnt1],5
up4:
	mov ax,0
	mov dx,0
	mov byte[cnt2],4
	mov rsi,buffer
	mov rdi,buffer
up3:
	mov al,byte[rsi]
	add rsi,2
	cmp byte[rsi],al
	jc down3
	; Do the Swapping of number...
	mov dl,byte[rsi]
	mov byte[rdi],dl
	mov byte[rsi],al
down3:
	add rdi,2
	dec byte[cnt2]
	jnz up3
	dec byte[cnt1]
	jnz up4
	ret
	
	
	
;*************CLOSE THE FILE **********************	
exit:	
	mov rax,3
	mov rdi,[fd_in]


	mov rax,60
	mov rdi,0
	syscall	
	

	
	
	

