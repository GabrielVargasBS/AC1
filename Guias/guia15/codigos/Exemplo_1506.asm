; Exemplo_1506.asm
; Autor    : Gabriel Vargas Bento de Souza
; Matricula: 778023
; Data     : 26 / 11 / 2022

LXI H,0100  ; HL = 0100
MOV A,M     ; A  = MEM[0100]
ADD A       ; A  = A + A or A = A*2
INX H       ; HL = HL+1
SUB M       ; A  = A - MEM[HL]
SUB M       ; A  = A - MEM[HL]
SUB M       ; A  = A - MEM[HL]
STA 0103    ; MEM[0103] = A
HLT         ; stop

; Test

;  Memory Adress   Value   Decimal
;      0100         25       37
;      0101         08       08

;  Result

;  Memory Adress   Value   Decimal

;      0103         32       54
