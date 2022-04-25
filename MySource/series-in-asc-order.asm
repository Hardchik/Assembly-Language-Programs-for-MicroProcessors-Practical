data SEGMENT
    A db 025H, 026H, 035H, 042H, 00H, 0FFH, 0FEH
    B db 07H 
data ends 
Code SEGMENT
    ASSUME CS: Code
start: MOV AX, data
    MOV DS, AX
    MOV CH, 07H 
Bck2: lea SI, A
    MOV CL, 07H 
Bck1: MOV AX, [SI]
    CMP AH, AL 
    JNC Skip 
    XCHG AL, AH
    MOV [SI], AX 
Skip: INC SI
    DEC CL 
    JNZ Bck1 
    DEC CH 
    JNZ Bck2 
    mov Ah, 4ch
    int 21h 
Code ENDS
end start