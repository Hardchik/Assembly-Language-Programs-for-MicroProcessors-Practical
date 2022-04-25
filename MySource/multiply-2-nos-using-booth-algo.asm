data segment
    a db 06H
    b db 05H
    ans dw ?
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds,ax
    
    mov ah, 0000H
    mov al,a
    lea si,b
    mov cx,0008H
    
back: ror ax,1
    jnc zero
    rol ax,1
    add ah,[si]
    shr ax,1
    
zero: loop back
    mov ans,ax            
code ends
end start