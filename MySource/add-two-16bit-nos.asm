data segment
    A dw 1225h 
    B dw 4526h 
    Sum dw ?
    carry db 00h 
data ends 
code segment
    Assume CS:code, DS:data 
    start: mov AX, data
        mov DS,AX 
        mov BX, A 
        ADD BX, B 
        JNC skip
        mov Carry, 01h 
    skip: mov Sum, BX
        mov AH,4Ch
        int 21h 
code ends
end start