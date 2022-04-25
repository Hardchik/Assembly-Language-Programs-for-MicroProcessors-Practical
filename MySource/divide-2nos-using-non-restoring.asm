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
        MOV CX,0008H 
        MOV AL,00H 
        MOV BL,dividend 
        MOV DL,divisor 
        MOV DH,divisor 
        NEG DH
        CLC 

back: 
        JNC subtracting 
        JC adding 

subtracting :
        SHL AL, 1 
        SHL BL,1 
        JC one
        JNC zero 

one:
        OR AL,01H 

zero:
        ADD AL, DH 
        JS negative
        JNS positive 

negative:
        STC
        jmp next 

positive:
        CLC
        OR bL,01H 

next:
        loop back
        jmp exit 

adding:
        SHL AL,1 
        SHL BL,1 
        JC aone 
        JNC azero

aone:
        OR AL,01H 

azero:
        ADD AL, DL 
        JS anegative
        JNS apositive 

anegative:
        STC
        jmp anext 

apositive:
        CLC
        OR bL,01H 
anext:
        loop back 
        jmp exit

exit: 
        JNC nocarry 
        ADD AL,DL 

nocarry: MOV quotient, BL 
        MOV remainder, AL 
        HLT 
code ends 
end code