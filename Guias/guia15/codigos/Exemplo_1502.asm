; Exemplo_1502.asm
; Autor    : Gabriel Vargas Bento de Souza
; Matricula: 778023
; Data     : 26 / 11 / 2022

LXI H,0100  ; HL = 0100
MOV A,M     ; A  = MEM[0100]
INX H       ; HL = HL+1
ADD M       ; A  = A + MEM[HL]
INX H       ; HL = HL+1
SUB M       ; A  = A - MEM[HL]
STA 0103    ; MEM[0103] = A
HLT         ; stop

; Test

;  Memory Adress   Value   Decimal
;      0100         05       05
;      0101         02       02
;      0102         01       01

;  Result

;  Memory Adress   Value   Decimal
;      0103         06       06

