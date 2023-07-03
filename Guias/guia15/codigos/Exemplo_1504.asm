; Exemplo_1504.asm
; Autor    : Gabriel Vargas Bento de Souza
; Matricula: 778023
; Data     : 26 / 11 / 2022

LXI H,0100  ; HL = 0100
MOV A,M     ; A  = MEM[0100]
RAR         ; A >> 1 or A/2
STA 0102    ; MEM[0102] = A/2
INX H       ; HL = HL+1
MOV A,M     ; A  = MEM[HL]
RAL         ; A << 1 or A*2
INX H       ; HL = HL+1
ADD M       ; A  = A + MEM[HL]
STA 0103    ; MEM[0103] = A
HLT         ; stop

; Test

;  Memory Adress   Value   Decimal
;      0100         FA       250
;      0101         1E        30

;  Result

;  Memory Adress   Value   Decimal
;      0102         7D       125
;      0103         B9       185

