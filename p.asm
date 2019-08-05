TITLE SOMA_PONTO
.MODEL SMALL
.STACK 100H
.DATA
LABIRINTO DB 9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,1,1,1,1,1,1,1,1,1,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,1,9,9,9,1,1,1,1,1,9,9,9,1,1,1,1,1,9,9,9,9,9,9,9,1,1,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1,8,9,9,1,1,9,1,1,1,9,9,0,0,0,0,9,9,9,1,1,1,1,1,9,1,9,9,1,1,9,1,9,1,9,4,0,4,0,4,0,4,9,1,1,9,9,9,9,1,9,9,1,1,9,1,9,1,9,9,9,9,9,9,9,9,9,1,1,1,1,1,1,1,9,9,1,1,9,1,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,9,9,9,9,1,1,9,1,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,1,1,9,1,9,1,1,1,1,1,3,1,1,1,1,1,9,9,9,9,9,9,9,9,8,1,9,1,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9	
POSICAO   DB 170
PONTOS    DB 0
VIDAS     DB 3
SUPERPAC  DB 0 ;COMEU A FRUTINHA?
MSG_PERDEU DB "VC PERDEU O JOGO :C",0DH,0AH,'$'
;12x24
;9 -> PAREDE
;8 -> FRUTA
;1 -> PONTOS
;3 -> PACMAN
;4 -> FANTASMAS
.CODE

MOV AX,@DATA
MOV DS,AX

teclado:
        mov     AH,00h
        int     016h
        cmp     AH,048h
        je      up
        cmp     AH,04Bh
        je      left
        cmp     AH,04Dh
        je      right
        cmp     AH,050h
        je      down
        cmp     AH,01h
        jne     teclado
        jmp     teclado_fim

up:
        jmp     teclado
left:
		XOR BH,BH
		MOV BL,POSICAO
		SUB BL,1
		CMP 1,LABIRINTO[BX]
		JE SOMA
		CMP 4,LABIRINTO[BX]
		JE PERDEU
		CMP 8,LABIRINTO[BX]
		JE PERDEU
        jmp     teclado
right:
        jmp     teclado
down:
        jmp     teclado

teclado_fim:
        ret

;SOMA PONTO
SOMA:
MOV AL,PONTOS
ADD AL,1
MOV PONTOS,AL
JMP TECLADO

;DECREMENTA VIDA, SE VIDA FOR 0 ACABA JOGO
PERDEU:
DEC VIDAS
CMP VIDAS,0
JNE INICIO

;PRINTA MSG
MOV AH,09H
LEA DX,MSG_PERDEU
INT 21H

MOV AH,4CH
INT 21H

END