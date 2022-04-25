data segment
    A db 05h, 15h, 25h, 35h, 45h,55h,65h, 75h, 85h, 95h 
    B db 0Ah 
    Sum dw 00h
    Carry db 00h 
data ends 
code segment
    assume cs:code, ds: data
start:
    mov ax, data 
    mov ds, ax 
    lea si, A 
    mov cl,B
    mov ax,0000h 
back:mov bl, [si]
    add al,bl
    jnc skip
    adc ah,00h 
skip:inc si
    loop back 
    mov Sum, ax 
    mov Carry, ah 
    mov ah, 4Ch 
    int 21h
code ends
end start