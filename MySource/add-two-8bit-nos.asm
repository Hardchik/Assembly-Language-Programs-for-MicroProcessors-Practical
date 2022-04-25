data segment
    A db 25h 
    B db 26h 
    Sum db ?
    carry db 00h 
data ends 
code segment
    Assume CS:code ,DS:data 
    start: mov AX, data
        mov DS, AX 
        mov BL, A 
        ADD BL,B 
        JNC skip
        mov Carry,01h 
    skip: mov Sum, BL
        mov AH, 4Ch
        int 21h 
Code ends
end start