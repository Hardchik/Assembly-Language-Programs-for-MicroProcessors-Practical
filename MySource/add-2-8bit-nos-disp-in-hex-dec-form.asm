DATA SEGMENT
    A DW 1222H 
    B DW 1222H 
    SUM DW ? 
    DSUM DB 10 DUP ('$')
    CARRY DB 00H 
DATA ENDS  

CODE SEGMENT
    ASSUME CS:CODE, DS : DATA 
START: MOV AX,DATA 
        MOV DS,AX 
        MOV AX,A 
        ADD AX,B 
        JNC SKIP 
        INC CARRY
         
SKIP: MOV SUM, AX 
        LEA SI,DSUM 
        CALL HEX2DEC
        
        LEA DX,DSUM 
        MOV AH,9 
        INT 21H

        MOV AH, 4CH
        INT 21H 
CODE ENDS  

HEX2DEC PROC NEAR
        MOV CX,0
        MOV BX,10 
        
LOOP1 : MOV DX,0
        DIV BX 
        ADD DL,30H 
        PUSH DX 
        INC CX 
        CMP AX,9 
        JG LOOP1
         
        ADD AL,30H
        MOV [SI],AL 

LOOP2: POP AX
        INC SI 
        MOV [SI],AL 
        LOOP LOOP2
        RET 
HEX2DEC ENDP 

END START