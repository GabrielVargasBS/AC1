; Exemplo_1500.asm
; Autor    : Gabriel Vargas Bento de Souza
; Matricula: 778023
; Data     : 26 / 11 / 2022

LXI H,0100  ; HL = 0100
MOV A,M     ; A  = MEM[0100]
INX H       ; HL = HL+1
ADD M       ; A  = A + MEM[HL]
STA 0103    ; MEM[0103] = A
HLT         ; stop

; Test
;  Memory Adress   Value
;      0100         05
;      0101         02

;  Result
;  Memory Adress   Value
;      0103         07
