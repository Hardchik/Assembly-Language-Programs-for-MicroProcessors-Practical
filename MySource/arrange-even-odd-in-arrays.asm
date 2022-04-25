Data segment
    A db 025H, 026H, 035H, 042H, 00H, 0FFH, 0FEH
    B db 07H 
    A_even db 07H dup<?>
    A_odd db 07H dup(?) 
Data ends 
Code segment
    assume CS: Code, DS: Data 
start: mov AX, Data 
        mov DS, AX 
        lea SI, A 
        mov CL, B 
        lea DI, A_even
        lea BX, A_odd 
back: mov AL, [SI]
        mov DL, [SI] 
        ror AL, 01H 
        jnc path 
        mov [BX], DL 
        inc BX
        jmp path2 
path: mov [DI], DL
        inc DI 
path2:inc SI
        loop back 
        mov AH, 4CH
        int 21H 
code ends 
end start