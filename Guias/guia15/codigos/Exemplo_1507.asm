; Exemplo_1507.asm
; Autor    : Gabriel Vargas Bento de Souza
; Matricula: 778023
; Data     : 26 / 11 / 2022

; dado1 % 2
LXI H,0100  ; HL = 0100
MOV A,M     ; A  = MEM[0100]
RAR         ; A >> 1 or A/2
ADD A       ; A = A + A or A = 2*A
STA 0102    ; MEM[0102] = A - 1
MOV A,M     ; A  = MEM[0100]
INX H       ; HL = HL+1
INX H       ; HL = HL+1
SUB M       ; A  = A - MEM[0102]
STA 0102    ; MEM[0102] = A

; dado2 /4
LXI H,0101  ; HL = 0101
MOV A,M     ; A  = MEM[0101]
RAR         ;  A >> 1 or A/2
RAR         ;  A >> 1 or A/2  -> A/4
INX H       ; HL = HL+1

; dado3 = dado1 % 2 + dado2 /4
ADD M       ; A = A + MEM[0102]
STA 0103    ; MEM[0103] = A
HLT         ; stop

; Test

;  Memory Adress   Value   Decimal
;      0100         25       37
;      0101         10       16

;  Result

;  Memory Adress   Value   Decimal
;      0103         05       05

