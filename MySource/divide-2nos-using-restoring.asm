data segment
    dividend db 0007H 
    divisor db 0003H 
    quotient db 00H
    remainder db 00H 
data ends 
code segment 
    assume cs: code segment, ds : data segment    
start: mov ax, data              
    MOV ds, ax 
    MOV CX, 0008H 
    MOV AL, 00H 
    MOV BL, dividend 
    MOV DL, divisor 
    MOV DH, divisor
    NEG DH 

back:
    SHL AL,1 
    SHL BL, 1 
    JC one
    JNC zero 

one:
    OR AL, 01H 

zero:
    ADD AL, DH 
    JS negative
    JNS positive 
    
negative:
    ADD AL, DL
    jmp next 

positive:
    OR bL,01H 

next:
    loop back 
    mov quotient, BL 
    mov remainder, AL
    HLT 
    
code ends
end code