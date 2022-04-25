data segment
    a dw 5678h, 1234h, 5 dup(0) 
    b dw 1111h, 1111h, 5 dup(0)
    c dw 4 dup(?) 
data ends 
code segment 
    assume cs:code segment, ds:data segment 
start: mov ax, data
        mov ds,ax 
        lea si, a 
        lea bx, b 
        lea di,c
        
        mov ax, word ptr [si] 
        mul word ptr [bx +0] 
        mov [di], ax 
        mov cx, dx

        mov ax, word ptr [si + 2] 
        mul word ptr [bx 91 
        add cx,ax 
        mov [di+2],cx 
        mov cx,dx
        
        mov ax, word ptr [si]
        mul word ptr [bx+2] 
        add word ptr [di + 2], ax 
        adc cx,dx
        mov [di +4], ax
        
        mov ax, word ptr [si 2] 
        mul word ptr [bx+2] 
        add cx,ax 
        mov word ptr [di+4],cx 
        adc dx,0000 
        mov [di+6],dx
        
        mov ah, 4ch 
        int 21h
end start