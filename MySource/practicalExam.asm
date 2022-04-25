code segment
    assume cs: code, ds: data
start:
    mov si, 2000h
    mov di, 3000h 
    mov ax, 0000h
    mov ds, ax
    mov cl, [si] 
    mov ch, 00h
    inc si

 
label:    mov ax,[si]
    xchg [di],ax 
    inc si  
    inc di
    dec cl
    jnz label
    hlt 
code ends    