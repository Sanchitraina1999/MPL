section .data
array: dq 0x4325798012654213,0xA32574801B652210,0x332A19801C654F17,0x83AB698012654E16,0x1E37357980A65421,0xF325798012656219,0x8323798012694215,0xC3857920126F4213,0x632A798012B5431A,0xC325795014654819

msg: db "Array is 0x4325798012654213,0xA32574801B652210,0x332A19801C654F17,0x83AB698012654E16,0x1E37357980A654218,0xF325798012656219,0x8323798012694215,0xC3857920126F4213,0x632A798012B5431A,0xC325795014654819",0x0A,
len: equ $-msg

msg1: db "No. of positive numbers are: "
len1: equ $-msg1

msg2: db 0x0A,"No. of negative numbers are: "
len2: equ $-msg2

d: db 0x0A

pos: db 0
neg: db 0
count: db 10

section .text
global main
main:

mov rax,1
mov rdi,1
mov rsi,msg
mov rdx,len
syscall

mov rsi,array

up:
mov rax,qword[rsi]
BT rax,63
jc next
inc byte[pos]
add rsi,8
dec byte[count]
jnz up
jmp next2

next:
inc byte[neg]
add rsi,8
dec byte[count]
jnz up

next2:
cmp byte[pos],9
jbe next3
add byte[pos],7

next3:
add byte[pos],30H

cmp byte[neg],9
jbe next4
add byte[neg],7

next4:
add byte[neg],30H

mov rax,1
mov rdi,1
mov rsi,msg1
mov rdx,len1
syscall

mov rax,1
mov rdi,1
mov rsi,pos
mov rdx,1
syscall

mov rax,1
mov rdi,1
mov rsi,msg2
mov rdx,len2
syscall

mov rax,1
mov rdi,1
mov rsi,neg
mov rdx,1
syscall

mov rax,1
mov rdi,1
mov rsi,d
mov rdx,1
syscall

mov rax,60
mov rdi,0
syscall
