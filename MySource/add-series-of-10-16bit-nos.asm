data segment
    a dw 2322H,144FH, 127FH,54FH, 1556H, 2785H,7456H, 7111H,2536H, 74FFH 
    b db 0AH 
    sum dw ?
    carry db 00H 
data ends 
code segment
    assume cs:code,ds:data 
start: mov ax, data 
        mov ds, ax 
        lea si, a 
        mov cl,b 
        mov ax, 0000H 
back: add ax,[si] 
        jnc skip 
        adc bh, 00H 
skip: inc si 
        loop back 
        mov sum, ax 
        mov carry,bh 
        mov ah, 4CH
        int 21H 
end code