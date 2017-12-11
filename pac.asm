TITLE PACMAN
.MODEL HUGE
.STACK 00F00h
;------------------------------------------------------------------------------------------------------------------
.DATA
        matriz  db 400 dup (00h)
;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
        level0  db 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h
                db 09h, 02h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 02h, 09h
                db 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h
                db 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h
                db 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h
                db 09h, 01h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 01h, 09h
                db 09h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 09h, 09h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 09h
                db 09h, 09h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 09h, 09h
                db 00h, 00h, 00h, 09h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 01h, 09h, 00h, 00h, 00h
                db 00h, 00h, 00h, 09h, 01h, 09h, 00h, 09h, 09h, 0Ah, 0Ah, 09h, 09h, 00h, 09h, 01h, 09h, 00h, 00h, 00h
                db 00h, 00h, 00h, 09h, 01h, 01h, 00h, 09h, 04h, 05h, 06h, 07h, 09h, 00h, 01h, 01h, 09h, 00h, 00h, 00h
                db 00h, 00h, 00h, 09h, 01h, 09h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 00h, 09h, 01h, 09h, 00h, 00h, 00h
                db 00h, 00h, 00h, 09h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 01h, 09h, 00h, 00h, 00h
                db 09h, 09h, 09h, 09h, 01h, 01h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 01h, 01h, 09h, 09h, 09h, 09h
                db 09h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 09h, 09h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 09h
                db 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h
                db 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 03h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h
                db 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h
                db 09h, 02h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 02h, 09h
                db 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h
;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
        level1  db 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h 
		db 09h, 02h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 02h, 09h 
		db 09h, 01h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 01h, 09h 
		db 09h, 01h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 01h, 09h 
		db 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h 
		db 09h, 09h, 01h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 01h, 09h, 00h 
		db 00h, 09h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 09h, 09h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 09h, 00h
		db 00h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 00h
		db 00h, 09h, 01h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 09h, 00h
		db 00h, 09h, 01h, 09h, 09h, 09h, 00h, 09h, 09h, 0Ah, 0Ah, 09h, 09h, 00h, 09h, 09h, 09h, 01h, 09h, 00h
		db 00h, 09h, 01h, 09h, 01h, 01h, 00h, 09h, 04h, 05h, 06h, 07h, 09h, 00h, 01h, 01h, 09h, 01h, 09h, 00h
		db 09h, 09h, 01h, 09h, 01h, 09h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 00h, 09h, 01h, 09h, 01h, 09h, 09h 
		db 09h, 01h, 01h, 01h, 01h, 09h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 01h, 01h, 01h, 01h, 09h 
		db 09h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 00h, 09h, 09h, 00h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 09h 
		db 00h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h, 03h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 00h
		db 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h 
		db 09h, 01h, 01h, 02h, 09h, 01h, 01h, 01h, 01h, 09h, 09h, 01h, 01h, 01h, 01h, 09h, 02h, 01h, 01h, 09h 
		db 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h 
		db 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h 
		db 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h 
;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
        level2  db 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h
	        db 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h 
		db 09h, 01h, 09h, 01h, 09h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 09h, 01h, 09h, 01h, 09h 
	        db 09h, 02h, 09h, 01h, 01h, 01h, 01h, 09h, 01h, 09h, 09h, 01h, 09h, 01h, 01h, 01h, 01h, 09h, 02h, 09h 
	        db 09h, 01h, 09h, 01h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 01h, 09h, 01h, 09h 
	        db 09h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 09h 
	        db 09h, 09h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 09h, 09h 
	        db 09h, 00h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 00h, 09h 
	        db 09h, 09h, 09h, 01h, 09h, 09h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 09h, 01h, 09h, 09h, 09h 
	        db 09h, 01h, 01h, 01h, 09h, 09h, 00h, 09h, 09h, 0Ah, 0Ah, 09h, 09h, 00h, 09h, 09h, 01h, 01h, 01h, 09h 
	        db 09h, 09h, 09h, 01h, 09h, 09h, 00h, 09h, 04h, 05h, 06h, 07h, 09h, 00h, 09h, 09h, 01h, 09h, 09h, 09h 
	        db 00h, 00h, 09h, 01h, 01h, 01h, 00h, 09h, 09h, 09h, 09h, 09h, 09h, 00h, 01h, 01h, 01h, 09h, 00h, 00h
	        db 00h, 09h, 09h, 01h, 09h, 09h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 09h, 09h, 01h, 09h, 09h, 00h 
	        db 00h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 00h
	        db 00h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 00h
	        db 00h, 09h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 00h, 03h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 09h, 00h 
	        db 09h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 01h, 09h, 09h, 01h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 09h 
	        db 09h, 02h, 09h, 01h, 09h, 09h, 09h, 01h, 01h, 09h, 09h, 01h, 01h, 09h, 09h, 09h, 01h, 09h, 02h, 09h 
	        db 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h 
	        db 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h 
;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
        


;~~~~~~menu0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
menu0_title     db 'PACMAN OCLM T2$'
menu0_1         db 'Digite um nickname:$'
menu0_easy      db ' EASY$'
menu0_medium    db 'MEDIUM$'
menu0_hard      db ' HARD$'
menu0_vector    db 014d,015d,015d
menu0_selected  db 00h
menu0_key       db 00h
playerNAME      db 06h, 01h, 5 dup (' '), 00h
highestNAME     db 06h, 01h, 5 dup (' '), 00h
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
LEVEL db ?
        

PACMAN_DIRECTION db 00h

GHOST_STATUS db 00h,00h,00h,00h;;0=normal, 1=comestivel, 2=morto
movimento_ghost db 00h,00h,00h,00h ; 0=parado, 1=sai da jaula, 2=cima_esquerda, 3=cima_direita
                                   ; 4=baixo_esquerda, 5=baixo_direita, 6=comestivel, 7=morto_voltabase
GHOST_COUNTER dw 00h,00h,00h,00h
GHOST_POS  dw 00h,00h,00h,00h
GHOST_TILE db 00h,00h,00h,00h

PlayerTILE db 00h

GPlayerDST_V db 00h, 00h, 00h, 00h
GPlayerREF_V db 00h, 00h, 00h, 00h ; 0=(cima), 1=(baixo)
GPlayerDST_H db 00h, 00h, 00h, 00h
GPlayerREF_H db 00h, 00h, 00h, 00h ; 0=(esquerda), 1=(direita)


TIMER dw 00h
Tflag db 00h
EXPIRA dw 0FFh

    posX dw 00h
    posY dw 00h
    tamanho dw 00h
    NUMarray db 30h,30h,30h,30h,30h,'$'
    HIGHSCORE dw 00h,00h,00h;easy medium hard
    GAMESCORE dw 00h
    FRUTAS db 00h
    VIDAS  db 03h
    movimento db 00h
    PosInicial dw ?
    POSICAO dw 00h;0a400d
    PontosMapa dw 00h

    ;tanto p/ vidas quanto p/ frutas MAX=3, min=0 sendo que em 0 vidas perde o jogo
    txt1 db 'GAME',0Ah,0Dh,'SCORE$'
    txt2 db 'HIGH$'
    txt3 db 'SCORE$'
    txt4 db 'GAME$'
    txt_gameover db ' GAME OVER..$'
    txt_victory db ' YOU WIN!$'
    txt_youdied db 'YOU ARE DEAD$'
    txt_vitoriascreen1 db 'PARABENS!$'
    txt_vitoriascreen2 db 'VOCE TERMINOU O JOGO!$'
    txt5 db 'PLAYER$'

    runtime db 00h
    resetFLAG db 00h
    seed dw ?
    
    first_level db 00h
    game_status dw 00000000b

    animacao db 00h

;------------------------------------------------------------------------------------------------------------------
.CODE
PROC MAIN
        tabuleiro_h equ 180d
        tabuleiro_l equ 220d
        labirinto_color equ 32d

        mov     AX,@DATA
        mov     DS,AX
        
        ;---inicializa seed random

rotinamain:
        call    interface
        call    acaba_jogo
        jmp     rotinamain

        mov     AH,01h
        int     21h
        mov     AX, 00002h
        int     10h
        mov     AH,04Ch
        int     021h
        ret
ENDP MAIN
;------------------------------------------------------------------------------------------------------------------
PROC acaba_jogo
        push    AX
        push    BX
        push    CX
        mov     AX,[GAMESCORE]
        cmp     AX,[HIGHSCORE]
        jb      fim_acabajogo
        mov     AX,[GAMESCORE]
        mov     [HIGHSCORE],AX
        xor     BX,BX
        mov     CX,08h
copy_playertohigh:
        mov     AL,playerNAME[BX]
        mov     highestNAME[BX],AL
        inc     BX
        loop    copy_playertohigh
fim_acabajogo:
        call    SCORESCREEN
        mov     AH,07h
        int     021h
        int     021h
        call    clear_window
        pop     CX
        pop     BX
        pop     AX
        ret
ENDP acaba_jogo
;;==============================================================
PROC interface
        mov     AH, 00h
        mov     AL, 13h
        int     10h
        call    MENU0
        mov     AL,[menu0_selected]
        mov     [LEVEL],AL
run_game:
        cmp     [runtime],01h
        je      interface00
        mov     [GAMESCORE],00h
interface00:
        call    SCORESCREEN;getPLAYERname
;------------------------------------
;zera   TUDO
        xor	BX,BX
	mov	CX,04h
zeraDWs:
	mov	GHOST_COUNTER[BX],00h
	mov	GHOST_POS[BX],00h
	inc	BX
	inc	BX
	loop	zeraDWs
        mov	GHOST_POS[0],0D0h
        mov	GHOST_POS[2],0D1h
        mov	GHOST_POS[4],0D2h
        mov	GHOST_POS[6],0D3h
	mov	[PACMAN_DIRECTION],00h
        mov     [EXPIRA],0FFh
	mov	[TIMER],00h
	mov	[Tflag],00h
	mov	[posX],00h
	mov	[posY],00h
	mov	[tamanho],00h
	mov	[FRUTAS],00h
	mov	[VIDAS],03h
	mov	[movimento],00h
	mov	[PosInicial],00h
	mov	[POSICAO],00h
	mov	[PontosMapa],00h
	xor	BX,BX
	mov	CX,04h
zeraDBs:
	mov	GHOST_STATUS[BX],00h
	mov	movimento_ghost[BX],00h
	mov	GHOST_TILE[BX],00h
	mov	GPlayerDST_V[BX],00h
	mov	GPlayerREF_V[BX],00h
	mov	GPlayerDST_H[BX],00h
	mov	GPlayerREF_H[BX],00h
	inc	BX
	loop	zeraDBs
;------------------------------------
        mov     AH,07h
        int     021h
        int     021h
        call    clear_window

        mov	AH,00h
	int	01Ah
	mov	[seed],DX
        call	getRandom

	lea     DX,txt1
        mov     BL,0Dh
        call    imprimeCOLORIDO;cor no   bl

        mov     DH,00h
        mov     DL,35d
        call    setCursor

        lea     DX,txt2
        mov     BL,0Dh
        call    imprimeCOLORIDO
        
        mov     DH,01d
        mov     DL,035d
        call    setCursor

        lea     DX,txt3
        mov     BL,0Dh
        call    imprimeCOLORIDO
;------------------------------------
        cmp     [LEVEL],00h     ;EASY
        jne     check_levelMEDIUM
        ;---------------------
        xor     BX,BX
        mov     CX,400d
write_level0:
        mov     AL,level0[BX]
        mov     matriz[BX],AL
        inc     BX
        loop    write_level0
        ;---------------------
        mov     [posInicial],330d
        jmp     check_levelEND
check_levelMEDIUM:
        cmp     [LEVEL],01h     ;MEDIUM
        jne     check_levelHARD
        ;---------------------
        xor     BX,BX
        mov     CX,400d
write_level1:
        mov     AL,level1[BX]
        mov     matriz[BX],AL
        inc     BX
        loop    write_level1
        ;---------------------
        mov	[PosInicial],290d
        jmp     check_levelEND
check_levelHARD:
        cmp     [LEVEL],02h     ;HARD
        jne     check_levelEND
        ;---------------------
        xor     BX,BX
        mov     CX,400d
write_level2:
        mov     AL,level2[BX]
        mov     matriz[BX],AL
        inc     BX
        loop    write_level2
        ;---------------------
        mov	[PosInicial],310d
        jmp     check_levelEND
check_levelEND:
        
        mov     [Tflag],01h
        mov     [TIMER],00h
;// ROTINA DO PROGRAMA
inicio_interface:
        cmp     [animacao],02h
        jbe     intfaceanimago
        mov     [animacao],00h
        jmp     intfaceanimago2
intfaceanimago:
        inc     [animacao]
intfaceanimago2:
        cmp     [resetFLAG],00h
        je      interface0_go
        call    reset_tabuleiro
        mov     [resetFLAG],00h
interface0_go:
        cmp     [Tflag],00h
        je      interface_go
        inc     [TIMER]
interface_go:
        mov     AX,[EXPIRA]
        cmp     [TIMER],AX
        jb      interface_01
        mov     GHOST_STATUS[0],00h
        mov     GHOST_STATUS[1],00h
        mov     GHOST_STATUS[2],00h
        mov     GHOST_STATUS[3],00h
        mov     movimento_ghost[0],02h
        mov     movimento_ghost[1],03h
        mov     movimento_ghost[2],02h
        mov     movimento_ghost[3],03h
interface_01:
        push    SI
        cmp     [TIMER],250d
        jne     interface_02
        mov     SI,0A8h
        cmp     matriz[SI],00h
        jne     interface_02
        mov     matriz[SI],08h
interface_02:     
        pop     SI

	call    DrawTabuleiro
	call    DrawSCORES
        call    DrawVIDAS
        call    DrawCONTAFRUTAS
        call    TECLADOPROC
        call    delay;;;VERIFICAR OS ILEGAL READ

        call    MOVIMENTOPROC
        call    MovimentoFantasma        

        call    GetPontosMap
        cmp     [PontosMapa],00h
        ja      continua_interface
        call    Victory
        jmp     run_game
continua_interface:
        cmp     [VIDAS],00h
        jne     inicio_shortcut_interface
        call    GameOver
;// 
exit_interface:
        ret
inicio_shortcut_interface:
        jmp     inicio_interface
ENDP interface
;;==============================================================
PROC MOVIMENTOPROC
push    AX
push    BX
push    SI
        call    GetPlayerPos
        mov     SI,[POSICAO]
move_cima:
        cmp     [movimento],08h;UP
        jne     move_baixo  
        cmp     SI,20d
        jb      jmp_assistente_end
        sub     SI,20d
        jmp     movimento_continua
move_baixo:
        cmp     [movimento],02h;DOWN
        jne     move_direita 
        cmp     SI,380d
        ja      jmp_assistente_end
        add     SI,20d
        jmp     movimento_continua
move_direita:
        cmp     [movimento],06h;RIGHT
        jne     move_esquerda  
        mov     AX,SI
        mov     BL,020d
        div     BL
        cmp     AH,019d
        je      jmp_assistente_end
        inc     SI
        jmp     movimento_continua
move_esquerda:
        cmp     [movimento],04h;LEFT
        jne     movimento_end
        mov     AX,SI
        mov     BL,020d
        div     BL
        cmp     AH,00d
        je      movimento_end
        dec     SI
        jmp     movimento_continua
jmp_assistente_end:
        jmp     movimento_end
;;---------------------------
movimento_continua:
        mov     AL,matriz[SI]
        cmp     AL, 09h
        je      moveu_parede
        cmp     AL, 0Ah
        je      moveu_parede
        cmp     AL, 04h
        je      moveu_ghost
        cmp     AL, 05h
        je      moveu_ghost
        cmp     AL, 06h
        je      moveu_ghost
        cmp     AL, 07h
        je      moveu_ghost

        mov     matriz[SI],03h
        mov     SI,[POSICAO]
        mov     matriz[SI],00h
        
        cmp     AL, 01h
        je      moveu_ponto
        cmp     AL, 02h
        je      moveu_pilula
        cmp     AL, 08h
        je      moveu_fruta
        jmp     movimento_end
;;---------------------------

moveu_ponto:
        add     [GAMESCORE],05h
        jmp     movimento_end
moveu_pilula:
        add     [GAMESCORE],50d
        call    SUPER_PACMAN
        jmp     movimento_end
moveu_ghost:
        call    GHOST_INTERACT
        jmp     movimento_end
moveu_fruta:
        cmp     [FRUTAS],02h
        ja      end_moveu_frutas
        inc     [FRUTAS]
end_moveu_frutas:
        add     [GAMESCORE],0100d
        jmp     movimento_end
moveu_parede:
        jmp     movimento_end

        
movimento_end:

pop     SI
pop     BX
pop     AX
        ret
ENDP MOVIMENTOPROC
;;==============================================================

;;=================================================================
;;===================== MovimentoFantasma =========================
PROC MovimentoFantasma  
        push    BX
        push    CX
; 0=parado, 1=sai da jaula, 2=persegue
;3=aleatorio, 4=comestivel, 5=morto_voltabase
        xor     BX,BX
        mov     CX,04d
loop_fantasma:
        push    BX
        mov     AX,BX
        mov     BX,02h
        mul     BL;result AX
        mov     BX,AX
        inc     GHOST_COUNTER[BX]
        pop     BX
;--------------------------------------
        cmp     movimento_ghost[BX],00h
        jne     ghost_mov1
        push    AX
        push    BX
        mov     AX,BX
        mov     BX,02h
        mul     BL;result AX
        mov     BX,AX
        mov     AX,03d
        cmp     GHOST_COUNTER[BX],AX
        pop     BX
        pop     AX
        jb      GHOST_CONTINUA_2
        inc     movimento_ghost[BX]
        jmp     ghost_movCONTINUA
ghost_mov1:
        cmp     movimento_ghost[BX],01h
        jne     ghost_mov2
        mov     GHOST_TILE[BX],00h
        push    BX
        add     BX,0D0h
        mov     matriz[BX],00h
        pop     BX
        push    BX
        cmp     BX,00h
        jne     saijaula_ghost1
        add     BX,04h
        mov     matriz[0F6h],BL
        jmp     saijaula_end
saijaula_ghost1:
        cmp     BX,01h
        jne     saijaula_ghost2
        add     BX,04h
        mov     matriz[0A6h],BL
        jmp     saijaula_end
saijaula_ghost2:
        cmp     BX,02h
        jne     saijaula_ghost3
        add     BX,04h
        mov     matriz[0ADh],BL
        jmp     saijaula_end
saijaula_ghost3:
        cmp     BX,03h
        jne     saijaula_end
        add     BX,04h
        mov     matriz[0FDh],BL
        jmp     saijaula_end
saijaula_end:
        pop     BX
        cmp     BX,01h
        je      saijaula_end1
        cmp     BX,03h
        jne     saijaula_end2
saijaula_end1:
        mov     movimento_ghost[BX],03h
        jmp     GHOST_CONTINUA_2
saijaula_end2:
	inc	movimento_ghost[BX]
GHOST_CONTINUA_2:
        jmp     ghost_movCONTINUA
ghost_mov33:
        jmp     ghost_mov3
ghost_mov2:
        cmp     movimento_ghost[BX],02h
        jne     ghost_mov33
        call    ghostMOV_chase
        jmp     ghost_movCONTINUA
ghost_mov3:
        cmp     movimento_ghost[BX],03h
        jne     ghost_mov4
        call    ghostMOV_random
        jmp     ghost_movCONTINUA
ghost_mov_backloop:
        jmp     loop_fantasma
ghost_mov4:
        cmp     movimento_ghost[BX],04h
        jne     ghost_mov5
        call    ghostMOV_fuga
        jmp     ghost_movCONTINUA
ghost_mov5:
        cmp     movimento_ghost[BX],05h
        jne     ghost_movCONTINUA
        call    ghostMOV_base
        push    BX
        mov     AX,BX
        mov     BX,02h
        mul     BL;result AX
        mov     BX,AX;ta no ax
        cmp     GHOST_COUNTER[BX],035d
        pop     BX
        jb      continua_ghostmov5
        push    BX
        mov     BX,AX
        mov     GHOST_COUNTER[BX],00d
        pop     BX
        mov     movimento_ghost[BX],00h
continua_ghostmov5:
        jmp     ghost_movCONTINUA
ghost_movCONTINUA:

        inc     BX
        loop    ghost_mov_backloop
        
        pop     CX
        pop     BX
        ret
ENDP MovimentoFantasma
;;==============================================================
PROC ghostMOV_base
push	AX
push	SI
	call	GetGhostPos
	push    BX
        mov     AX,BX
        mov     BX,02h
        mul     BL ;result AX
        mov     BX,AX
        mov     SI,GHOST_POS[BX]
        pop     BX
	mov     AL,GHOST_TILE[BX]
        mov     matriz[SI],AL
	mov	GHOST_TILE[BX],00h
	push    BX
	mov	AX,BX
	add	AX,04h
        add     BX,0D0h
        mov     matriz[BX],AL
        pop     BX
pop	SI
pop	AX
        ret
ENDP ghostMOV_base
;;==============================================================
PROC ghostMOV_chase     ;return DX
;GPlayerREF_V ; 0=(cima), 1=(baixo)
;GPlayerREF_H ; 0=(esquerda), 1=(direita)
push    AX
push    BX
push    CX
        call    Ghost_DIST_Player
chase1: cmp	[GPlayerDST_H],00h
	jne	chase2
	jmp	alinhado_vertical
chase2:	cmp	[GPlayerDST_V],00h
	jne	chase3
	jmp	alinhado_horizontal
	jmp	chases_end
chase3: mov	AL,[GPlayerDST_V]
	cmp	[GPlayerDST_H],AL
	jb	desloca_vertical
desloca_horizontal:
	jmp	alinhado_horizontal
desloca_vertical:
	jmp	alinhado_vertical
chase4:
        call    getRandom
	cmp	AX,DX
	je	chase4
        and     AX,03h
        mov     DX,AX
        call    MOVE_GHOST_PARA_DIRECAO
        jmp     chases_end2
;--------------------------------------
alinhado_vertical:
	cmp	[GPlayerREF_V],00h
	jne	alinhado_verticalBAIXO
	mov	DX,00h
	jmp	chases_end
alinhado_verticalBAIXO:
	mov	DX,01h
	jmp	chases_end
;--------------------------------------
alinhado_horizontal:
	cmp	[GPlayerREF_H],00h
	jne	alinhado_verticalDIREITA
	mov	DX,02h
	jmp	chases_end
alinhado_verticalDIREITA:
	mov	DX,03h
	jmp	chases_end
;--------------------------------------
chases_end:
	call    MOVE_GHOST_PARA_DIRECAO
        cmp     AX,00h
	je	chase4
chases_end2:
pop     CX
pop     BX
pop     Ax
        ret
ENDP ghostMOV_chase
;;==============================================================
;;==============================================================
PROC ghostMOV_fuga     ;return DX
;GPlayerREF_V ; 0=(cima), 1=(baixo)
;GPlayerREF_H ; 0=(esquerda), 1=(direita)
push    AX
push    BX
push    CX
        call    Ghost_DIST_Player
fuga1: cmp	[GPlayerDST_H],00h
	jne	fuga2
	jmp	fugirpara_vertical
fuga2:	cmp	[GPlayerDST_V],00h
	jne	fuga3
	jmp	fugirpara_horizontal
	jmp	fugas_end
fuga3: mov	AL,[GPlayerDST_V]
	cmp	[GPlayerDST_H],AL
	jb	fuga_vertical
fuga_horizontal:
	jmp	fugirpara_horizontal
fuga_vertical:
	jmp	fugirpara_vertical
fuga4:
        call    getRandom
	cmp	AX,DX
	je	fuga4
        and     AX,03h
        mov     DX,AX
        call    MOVE_GHOST_PARA_DIRECAO
        jmp     fugas_end2
;--------------------------------------
fugirpara_vertical:
	cmp	[GPlayerREF_V],00h
	jne	fugirpara_verticalBAIXO
	mov	DX,01h
	jmp	fugas_end
fugirpara_verticalBAIXO:
	mov	DX,00h
	jmp	fugas_end
;--------------------------------------
fugirpara_horizontal:
	cmp	[GPlayerREF_H],00h
	jne	fugirpara_verticalDIREITA
	mov	DX,03h
	jmp	fugas_end
fugirpara_verticalDIREITA:
	mov	DX,02h
	jmp	fugas_end
;--------------------------------------
fugas_end:
	call    MOVE_GHOST_PARA_DIRECAO
        cmp     AX,00h
	je	fuga4
fugas_end2:
pop     CX
pop     BX
pop     Ax
        ret
ENDP ghostMOV_fuga
;;==============================================================
PROC ghostMOV_random
        push    BX
        push    DX
        push    CX
        push    AX
        xor     DX,DX
ghostmovRAND:
        call    getRandom
        and     AX,03h
        mov     DX,AX
        call    MOVE_GHOST_PARA_DIRECAO
        pop     AX
        pop     CX
        pop     DX
        pop     BX
        ret
ENDP ghostMOV_random
;;==============================================================
;====================================================================
PROC MOVE_GHOST_PARA_DIRECAO ;entry={DX=direcao, BX=ghost_index}
                             ;return AX (1=sucesso//0=fail)]
        push    DX
        push    BX
        push    SI
        call    GetGhostPos
        push    BX
        mov     AX,BX
        mov     BX,02h
        mul     BL ;result AX
        mov     BX,AX
        mov     SI,GHOST_POS[BX]
        pop     BX
        ;SI=GHOST POS
        call    GHOST_VERIFICA_DIRECAO
        cmp     AX,00h
        je      fim_movimento_ghost
        call    ghostMOVIMENTA
fim_movimento_ghost:
        pop     SI
        pop     BX
        pop     DX
        ret
ENDP MOVE_GHOST_PARA_DIRECAO
;====================================================================
PROC GHOST_VERIFICA_DIRECAO ;entry={DX=direcao, SI=ghostpos}
                            ;return={AX=1 -> sucesso // AX=0 -> erro}
push    DX                  ;return={SI=PROXIMA POSICAO DO GHOST}
        mov     AX,01h
;--------------------------------------------------
        cmp     DX,00h
        jne     DIR1
        jmp     DIR_checkUP
DIR1:
        cmp     DX,01h
        jne     DIR2
        jmp     DIR_checkDOWN
DIR2:
        cmp     DX,02h
        jne     DIR3
        jmp     DIR_checkLEFT
DIR3:
        cmp     DX,03h
        jne     DIR_END
        jmp     DIR_checkRIGHT
;-----------------------------
DIR_checkUP:
        cmp     SI,20d
        jb      DIR_END
        sub     SI,20d
        jmp     GHOST_VERIFICA_DIRECAO_END
DIR_checkDOWN:
        cmp     SI,20d
        jb      DIR_END
        add     SI,20d
        jmp     GHOST_VERIFICA_DIRECAO_END
DIR_checkRIGHT:
	push	BX
        mov     AX,SI
        mov     BL,020d
        div     BL
        pop     BX
        cmp     AH,019d
        je      DIR_END
        inc     SI
        jmp     GHOST_VERIFICA_DIRECAO_END
DIR_checkLEFT:
	push	BX
        mov     AX,SI
        mov     BL,020d
        div     BL
        pop	BX
        cmp     AH,00d
        je      DIR_END
        dec     SI
        jmp     GHOST_VERIFICA_DIRECAO_END
DIR_END:
        mov     AX,00h
        jmp     GHOST_VERIFICA_DIRECAO_END2
GHOST_VERIFICA_DIRECAO_END:
        call    CheckWall
GHOST_VERIFICA_DIRECAO_END2:
pop     DX
        ret
ENDP GHOST_VERIFICA_DIRECAO
;;==============================================================
PROC ghostMOVIMENTA   
push    AX
push    BX
        push    SI
        cmp     matriz[SI],03h
        je      end_movimentoghost
        cmp     matriz[SI],04h
        je      end_movimentoghost
        cmp     matriz[SI],05h
        je      end_movimentoghost
        cmp     matriz[SI],06h
        je      end_movimentoghost
        cmp     matriz[SI],07h
        je      end_movimentoghost
        cmp     matriz[SI],09h
        je      end_movimentoghost
continua_movimentoghost:
        call    GetGhostPos
        push    BX
        mov     AX,BX
        mov     BX,02h
        mul     BL ;result AX
        mov     BX,AX
        mov     SI,GHOST_POS[BX]
        pop     BX

        mov     AL,GHOST_TILE[BX]
        mov     matriz[SI],AL
        pop     SI
        mov     AL,matriz[SI]
        mov     GHOST_TILE[BX],AL

        add     BX,04h
        mov     matriz[SI],BL
end_movimentoghost:
pop     BX
pop     AX
        ret
ENDP ghostMOVIMENTA
;;==============================================================


;;================ CheckWall ============================
;;========(RETURN AX) ===== (ENTRY SI) ==================
PROC CheckWall
        push    BX
continue_checkwall:
        cmp     matriz[SI],09h
        jne     verificawall_ghost1
        mov     AX,00h
        jmp     verificawall_end
verificawall_ghost1:
        cmp     matriz[SI],04h
        jne     verificawall_ghost2
        mov     AX,00h
        jmp     verificawall_end
verificawall_ghost2:
        cmp     matriz[SI],05h
        jne     verificawall_ghost3
        mov     AX,00h
        jmp     verificawall_end
verificawall_ghost3:
        cmp     matriz[SI],06h
        jne     verificawall_ghost4
        mov     AX,00h
        jmp     verificawall_end
verificawall_ghost4:
        cmp     matriz[SI],07h
        jne     verificawall_player
        mov     AX,00h
        jmp     verificawall_end
verificawall_player:
        cmp     matriz[SI],03h
        jne     verificawall_false
        mov     AX,00h
        cmp     GHOST_STATUS[BX],00h
        jne     vestatus1
        call    perdeVida
        jmp     verificawall_end
vestatus1:
        jmp     verificawall_end
verificawall_false:
        mov     AX,01h
verificawall_end:
        pop     BX
        ret
ENDP CheckWall
;;=======================================================
;;=======================================================
PROC Ghost_DIST_Player
;Procedimento para calcular a distancia entre Ghost e Player
;Tendo como referencia o Ghost, isto é: o quão longe está o player do ghost
;parametros entry=BX (fantasma num 0~3)
;retorno em GPlayer......
push    SI
push    DX
push    AX
push    BX

;GPlayerREF_V ; 0=(cima), 1=(baixo)
;GPlayerREF_H ; 0=(esquerda), 1=(direita)
        
        call    GetGhostPos
        push    BX
        mov     AX,BX
        mov     BX,02h
        mul     BL
        mov     BX,AX
        mov     SI,GHOST_POS[BX]
        pop     BX

        push    BX
        push    SI

        mov     AX,SI
        mov     BL,020d
        div     BL
        xor     AH,AH
        mov     SI,AX

        call    GetPlayerPos
        mov     AX,[POSICAO]
        mov     BL,020d
        div     BL
        xor     AH,AH

        cmp     SI,AX 
        ja      DISTn_V ;;ghost>player
DISTp_V:mov     [GPlayerREF_V],01h
        xchg    AX,SI ;ghost<player
        jmp     calcDIST_V
DISTn_V:mov     [GPlayerREF_V],00h
calcDIST_V:
        sub     SI,AX
        mov     AX,SI
        pop     SI
        pop     BX
        mov     GPlayerDST_V[BX],AL
        push    BX
horizontal_calcs:
        mov     AX,SI
        mov     BL,020d
        div     BL
        mov     AL,AH
        xor     AH,AH
        mov     SI,AX
        
        mov     AX,[POSICAO]
        mov     BL,020d
        div     BL
        mov     AL,AH
        xor     AH,AH
        cmp     SI,AX
        ja      DISTn_H ;;ghost>player
DISTp_H:mov     [GPlayerREF_H],01h
        xchg    AX,SI ;ghost<player
        jmp     calcDIST_H
DISTn_H:mov     [GPlayerREF_H],00h
calcDIST_H:
        sub     SI,AX
        mov     AX,SI
        pop     BX
        mov     GPlayerDST_H[BX],AL

pop     BX
pop     AX
pop     DX
pop     SI
        ret
ENDP Ghost_DIST_Player
;;==============================================================

;;==============================================================
PROC SUPER_PACMAN
        push    SI
        push    CX
        push    AX
        mov     CX,04d
        xor     SI,SI

        mov     AX,[TIMER]
        mov     [EXPIRA],AX
        add     [EXPIRA],045d


super_loop:
        cmp     GHOST_STATUS[SI],02h
        je      super_skip
        cmp     movimento_ghost[SI],05h
        je      super_skip
        mov     movimento_ghost[SI],04h
        mov     GHOST_STATUS[SI],01h
super_skip:
        inc     SI
        loop    super_loop
        ;DIMINUI VELOCIDADE DOS GHOSTS EM 10%
        ;ISSO DURA UM TEMPO
        pop     AX
        pop     CX
        pop     SI
        ret
ENDP SUPER_PACMAN
;;==============================================================
;;==============================================================
PROC nextLEVEL
nLVL0:  push    game_status
        and     [game_status],00000001b
        cmp     [game_status],00000001b
        pop     game_status
        je      nLVL1
        mov     [LEVEL],00h
        jmp     nLVL_END
nLVL1:  push    [game_status]
        and     [game_status],00000010b
        cmp     [game_status],00000010b
        pop     [game_status]
        je      nLVL2
        mov     [LEVEL],01h
        jmp     nLVL_END
nLVL2:  push    [game_status]
        and     [game_status],00000100b
        cmp     [game_status],00000100b
        pop     [game_status]
        je      nLVL_VENCEU
        mov     [LEVEL],02h
        jmp     nLVL_END
nLVL_VENCEU:
        call    VITORIA_SCREEN
        mov     AH,07h
        int     021h
        int     021h
        mov     AH,01h
        int     21h
        mov     AX, 00002h
        int     10h
        mov     AH,04Ch
        int     021h
nLVL_END:
        ret
ENDP nextLEVEL
;;==============================================================
;;==============================================================
PROC Victory
push    DX
push    CX
push    BX
push    AX
        mov     [runtime],01h
        mov     DH,14d
        mov     DL,14d
        call    setCursor
        lea     DX,txt_victory
        mov     BL,0Dh
        call    imprimeCOLORIDO
        call    delay
        call    delay
        call    delay
        call    delay
        call    delay
        call    delay
        call    delay
        mov     AH,07h
        int     021h

thisLVL0:
        cmp     [LEVEL],00h
        jne     thisLVL1
        or      [game_status],00000001b
        jmp     thisLVL_END
thisLVL1:
        cmp     [LEVEL],01h
        jne     thisLVL2
        or      [game_status],00000010b
        jmp     thisLVL_END
thisLVL2:
        cmp     [LEVEL],02h
        jne     thisLVL_END
        or      [game_status],00000100b
        jmp     thisLVL_END
thisLVL_END:
        call    nextLEVEL
victory_end:
pop     AX
pop     BX
pop     CX
pop     DX
        ret
ENDP Victory
;;==============================================================
PROC GameOver
push    DX
push    CX
push    BX
push    AX     
        mov     [runtime],00h
        mov     DH,14d
        mov     DL,14d
        call    setCursor

        lea     DX,txt_gameover
        mov     BL,0Dh
        call    imprimeCOLORIDO
        mov     AH,07h
        int     021h

        mov     [resetFLAG],00h

pop     AX
pop     BX
pop     CX
pop     DX
        ret
ENDP GameOver
;;==============================================================
PROC reset_tabuleiro
push    AX
push    BX
push    CX
push    SI
push    DX
        call    GetPlayerPos
        mov     SI,[POSICAO]
        mov     matriz[SI],00h
        mov     SI,[PosInicial]
        mov     matriz[SI],03h

        call    GetGhostPos
        xor     BX,BX
        mov     CX,04h
reset_tabuleiro1:
        push    BX
        mov     AX,BX
        mov     BX,02h
        mul     BL
        mov     BX,AX
        mov     SI,GHOST_POS[BX]
        pop     BX
        push    BX
        mov     AL,GHOST_TILE[BX]
        mov     matriz[SI],AL
        mov     GHOST_TILE[BX],00h
        pop     BX      
        inc     BX
        loop    reset_tabuleiro1

        mov     GHOST_STATUS[00],00h
        mov     GHOST_STATUS[01],00h
        mov     GHOST_STATUS[02],00h
        mov     GHOST_STATUS[03],00h

        mov     GHOST_COUNTER[00],00h
        mov     GHOST_COUNTER[02],00h
        mov     GHOST_COUNTER[04],00h
        mov     GHOST_COUNTER[06],00h
        mov     movimento_ghost[00],00h
        mov     movimento_ghost[01],00h
        mov     movimento_ghost[02],00h
        mov     movimento_ghost[03],00h

        mov     [EXPIRA],0FFh
        mov     [TIMER],00h


        mov     matriz[0D0h],04h
        mov     matriz[0D1h],05h
        mov     matriz[0D2h],06h
        mov     matriz[0D3h],07h
        mov     DH,13d
        mov     DL,14d
        call    setCursor

        lea     DX,txt_youdied
        mov     BL,0Dh
        call    imprimeCOLORIDO
        call    delay
        call    delay
        call    delay
        mov     AH,07h
        int     021h        
        call    clear_window
        lea     DX,txt1
        mov     BL,0Dh
        call    imprimeCOLORIDO;cor no   bl

        mov     DH,00h
        mov     DL,35d
        call    setCursor

        lea     DX,txt2
        mov     BL,0Dh
        call    imprimeCOLORIDO
        
        mov     DH,01d
        mov     DL,035d
        call    setCursor

        lea     DX,txt3
        mov     BL,0Dh
        call    imprimeCOLORIDO

pop     DX
pop     SI
pop     CX
pop     BX
pop     AX
        ret
ENDP reset_tabuleiro
;;==============================================================
PROC PerdeVida
        cmp     [VIDAS],00h
        ja      decrementa_vida
        jmp     end_perdevida
decrementa_vida:
        dec     [VIDAS]
        mov     [resetFLAG],0FFh
end_perdevida:
        ret
ENDP PerdeVida
;;==============================================================


;;==============================================================
;;================ GHOST_INTERACT ==============================
PROC GHOST_INTERACT
push    AX
push    SI
        xor     AH,AH
        mov     SI,AX
        sub     SI,4d
        ;0=normal, 1=comestivel, 2=morto
        cmp     GHOST_STATUS[SI],00h
        jne     ghost_interactEAT
        call    PerdeVida
        jmp     ghost_interactend
ghost_interactEAT:
        cmp     GHOST_STATUS[SI],01h
        jne     ghost_interactDEAD
        mov     GHOST_STATUS[SI],02h
        add     [GAMESCORE],200d
        mov     GHOST_COUNTER[SI],00h
        mov     movimento_ghost[SI],05h
        jmp     ghost_interactend
ghost_interactDEAD:
        cmp     GHOST_STATUS[SI],02h
        jne     ghost_interactend
        ;push    [POSICAO]
        call    GetPlayerPos;[POSICAO]
        call    GetGhostPos
        push    BX
        mov     AX,SI
        mov     BX,02h
        mul     BL
        mov     BX,AX
        mov     AX,GHOST_POS[BX]
        mov     BX,AX
        mov     matriz[BX],03h
        mov     BX,[POSICAO]
        mov     AX,SI
        add     AL,04h
        mov     matriz[BX],AL
        pop     BX
        ;pop     [POSICAO]
        jmp     ghost_interactend
ghost_interactend:
pop     SI
pop     AX
        ret
ENDP GHOST_INTERACT
;;==============================================================


;;================ GetPontosMap =========================
PROC GetPontosMap       ;variavel [PontosMapa]
        push    SI
        push    CX
        push    AX
        mov     CX,400d
        mov     SI,00d
        mov     AX,00h
contagem_pontos:
        cmp     matriz[SI],01h
        je      contagem_add
        cmp     matriz[SI],02h
        je      contagem_add
        cmp     matriz[SI],08h
        je      contagem_add
        jmp     contagem_end
contagem_add:
        inc     AX
contagem_end:
        inc     SI
        loop    contagem_pontos
        mov     [PontosMapa],AX
        pop     AX
        pop     CX
        pop     SI
        ret
ENDP GetPontosMap
;;=======================================================


;;=============== GetGhostPos ===============================
PROC GetGhostPos 	;return em GHOST_POS[0 ~ 3]
push	AX
push	BX
push	CX
push	DX
push    SI
       	xor	BX,BX
	mov	CX,04h
verfantasmas_loop:
	push	CX
;--------------------------------
	push	BX
        add     BX,04h
        mov     CX,400d
        mov     SI,00h
search_ghost:
        mov     AL,matriz[SI]
        cmp     AL,BL
        je      fim_getghostpos
        inc     SI
        loop    search_ghost
fim_getghostpos:
        pop	BX
        push    BX
	mov     AX,BX
        mov     BX,02h
	mul	BL
        mov     BX,AX
        mov     GHOST_POS[BX],SI
        pop     BX
;--------------------------------
	pop	CX
	inc	BX
	loop	verfantasmas_loop
pop     SI
pop	DX
pop	CX
pop	BX
pop	AX
        ret
ENDP GetGhostPos
;;==============================================================

;;================ GetPlayerPos =========================
PROC GetPlayerPos
        push    AX
        push    CX
        push    SI
        mov     CX,400d
        mov     SI,00h
search_map:
        mov     AL,matriz[SI]
        cmp     AL,03h
        je      fim_getplayerpos
        inc     SI
        loop    search_map
fim_getplayerpos:
        mov     [POSICAO], SI
        pop     SI
        pop     CX
        pop     AX
        ret
ENDP GetPlayerPos
;;=======================================================

;;===========================================================
;;================  Teclado  ================================
PROC TECLADOPROC
push    AX
teclado:
        mov     AH,01h
        int     016h
        jz      teclado_fim
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
        ;cmp     AH,01h
        ;jne     teclado
        jmp     teclado_fim

up:     mov     [movimento],08h
        jmp     teclado_fim
left:
        mov     [movimento],04h
        jmp     teclado_fim
right:
        mov     [movimento],06h
        jmp     teclado_fim
down:
        mov     [movimento],02h
        jmp     teclado_fim

teclado_fim:
pop     AX
        ret
TECLADOPROC ENDP
;;===========================================================


















;;==============================================================
PROC switchTabuleiro;entry no AL
push    AX
        cmp     AL,00h
        jne     swtichT_1
        mov     AL,00h
        call    DrawTile
        jmp     fim_switchTabuleiro
swtichT_1:;ponto
        cmp     AL,01h
        jne     swtichT_2
        call    drawPonto
        jmp     fim_switchTabuleiro
swtichT_2:;PILULA
        cmp     AL,02h
        jne     switchT_3
        call    drawSuperPonto
        jmp     fim_switchTabuleiro
switchT_3:;player
        cmp     AL,03h
        jne     switchT_4
        call    drawPlayer
        jmp     fim_switchTabuleiro
switchT_4:;ghost1
        cmp     AL,04h
        jne     switchT_5
        call    drawGhost
        jmp     fim_switchTabuleiro
switchT_5:;ghost2
        cmp     AL,05h
        jne     switchT_6
        call    drawGhost
        jmp     fim_switchTabuleiro
switchT_6:;ghost3
        cmp     AL,06h
        jne     switchT_7
        call    drawGhost
        jmp     fim_switchTabuleiro
switchT_7:;ghost4
        cmp     AL,07h
        jne     switchT_8
        call    drawGhost
        jmp     fim_switchTabuleiro
switchT_8:
        cmp     AL,08h
        jne     switchT_9
        call    DrawFruta
        jmp     fim_switchTabuleiro
switchT_9:
        cmp     AL,09h
        jne     switchT_A
        mov     AL,labirinto_color
        call    DrawTile
        jmp     fim_switchTabuleiro
switchT_A:
        cmp     AL,0Ah
        jne     fim_switchTabuleiro
        mov     AL,07d
        call    DrawTile
        jmp     fim_switchTabuleiro

fim_switchTabuleiro:
pop     AX
        ret
ENDP switchTabuleiro
;;==============================================================



;;=============================================================
;;================  DrawTabuleiro  ============================
PROC DrawTabuleiro
push    AX
push    DX
push    BX
push    CX
push    SI

mov     CH,20d
mov     CL,20d
mov     BX,00h
mov     SI,00h
desenha:
        xor     AX,AX
        mov     AL,matriz[BX+SI]
get_positions:
        push    AX
        mov     AX,11d
        mul     SI
        add     AX,50d
        mov     posX,AX
        mov     AX,BX
        push    BX
        mov     BX,00014h
        push    DX
        div     BX
        pop     DX
        mov     BL,09h
        mul     BL
        pop     BX
        add     AX,5d
        mov     posY,AX
        pop     AX

        call    switchTabuleiro
        
        inc     SI
        cmp     SI,20d
        jb     desenha
        mov     SI,00h
        add     BX,20d
        cmp     BX,400d
        jb     desenha
        
pop     SI
pop     CX
pop     BX
pop     DX
pop     AX
        ret
DrawTabuleiro ENDP
;;==============================================================
;;==============================================================


;;=============================================================
;;================  DrawCONTAFRUTAS ==========================
DrawCONTAFRUTAS PROC
push    posX
push    posY
push    AX
        mov     [posX],288d
        mov     [posY],160d
        mov     AH,[FRUTAS]

        cmp     AH,02h
        jne     contafrutas_2
        call    DrawFruta
        add     [posY],11d
        call    DrawFruta
        jmp     contafrutas_final
contafrutas_2:
        cmp     AH,01h
        jne     contafrutas_1
        mov     AL,00h
        call    DrawTile
        add     [posY],11d
        call    DrawFruta
        jmp     contafrutas_final
contafrutas_1:
        cmp     AH,00h
        jne     contafrutas_final
        mov     AL,00h
        call    DrawTile
        add     [posY],11d
        call    DrawTile
        jmp     contafrutas_final
contafrutas_final:
pop     AX
pop     posY
pop     posX
        ret
DrawCONTAFRUTAS ENDP
;;=============================================================
;;=============================================================

;;=============================================================
;;================  DrawVIDAS  ================================
DrawVIDAS PROC
push    posX
push    posY
push    AX
        mov     [posX],18d
        mov     [posY],160d
        mov     AH,[VIDAS]

        cmp     AH,03h
        jne     vidas_2
        call    DrawPlayer
        add     [posY],11d
        call    DrawPlayer
        jmp     drawvidas_final
vidas_2:
        cmp     AH,02h
        jne     vidas_1
        mov     AL,00h
        call    DrawTile
        add     [posY],11d
        call    DrawPlayer
        jmp     drawvidas_final
vidas_1:
        cmp     AH,01h
        jne     drawvidas_final
        mov     AL,00h
        call    DrawTile
        add     [posY],11d
        call    DrawTile
        jmp     drawvidas_final
drawvidas_final:
pop     AX
pop     posY
pop     posX
        ret
DrawVIDAS ENDP
;;=============================================================
;;=============================================================


;;================  DrawSCORES  ===============================
DrawSCORES PROC
push    DX
push    BX
push    AX
        mov     DH,02d
        mov     DL,00d
        call    setCursor

        mov     AX,GAMESCORE
        call    NUMtoArray
        lea     DX,NUMarray
        mov     BL,07d
        call    imprimeCOLORIDO

        mov     DH,02d
        mov     DL,035d
        call    setCursor

        mov     AX,HIGHSCORE
        call    NUMtoArray
        lea     DX,NUMarray
        mov     BL,07d
        call    imprimeCOLORIDO
pop     AX
pop     BX
pop     DX
        ret
ENDP DrawSCORES
;;=============================================================
;;=============================================================

;;==============================================================
;;================  DrawTile ===================================
PROC DrawTile
;entrada:   posX, posY & COR=AL
push    posX
push    posY
        mov     tamanho,010d
        mov     CX,09d
DrawTile_0:
        call    PrintLinhaH
        inc     posY
        loop    DrawTile_0
pop     posY
pop     posX
        ret
DrawTile ENDP
;;==============================================================
;;==============================================================


;;==============================================================
;;================  DrawPlayer ================================
PROC DrawPlayer
        mov     AL,00h
        call    DrawTile
drawplayer_left:
        cmp     [movimento],06h
        jne     drawplayer_right
        call    DrawPACMAN_RIGHT
        jmp     drawplayer_end
drawplayer_right:
        cmp     [movimento],04h
        jne     drawplayer_up
        call    DrawPACMAN_LEFT
        jmp     drawplayer_end
drawplayer_up:
        cmp     [movimento],08h
        jne     drawplayer_down
        call    DrawPACMAN_UP
        jmp     drawplayer_end
drawplayer_down:
        cmp     [movimento],02h
        jne     drawplayer_default
        call    DrawPACMAN_DOWN
        jmp     drawplayer_end
drawplayer_default:
        call    DrawPACMAN_LEFT
drawplayer_end:
        ret
DrawPlayer ENDP
;;==============================================================
PROC DrawPACMAN_LEFT

DPAC_LEFT0:
        cmp     [animacao],00h
        jne     DPAC_LEFT1
        call    DrawPacmanLeft0
        jmp     DPAC_LEFT_END
DPAC_LEFT1:
        cmp     [animacao],01h
        jne     DPAC_LEFT2
        call    DrawPacmanLeft1
        jmp     DPAC_LEFT_END
DPAC_LEFT2:
        cmp     [animacao],02h
        jne     DPAC_LEFT3
        call    DrawPacmanLeft2
        jmp     DPAC_LEFT_END
DPAC_LEFT3:
        cmp     [animacao],03h
        jne     DPAC_LEFT_END
        call    DrawPacmanLeft1
DPAC_LEFT_END:     

        ret
ENDP DrawPACMAN_LEFT
;;==============================================================
PROC DrawPACMAN_RIGHT

DPAC_RIGHT0:
        cmp     [animacao],00h
        jne     DPAC_RIGHT1
        call    DrawPacmanRight0
        jmp     DPAC_RIGHT_END
DPAC_RIGHT1:
        cmp     [animacao],01h
        jne     DPAC_RIGHT2
        call    DrawPacmanRight1
        jmp     DPAC_RIGHT_END
DPAC_RIGHT2:
        cmp     [animacao],02h
        jne     DPAC_RIGHT3
        call    DrawPacmanRight2
        jmp     DPAC_RIGHT_END
DPAC_RIGHT3:
        cmp     [animacao],03h
        jne     DPAC_RIGHT_END
        call    DrawPacmanRight1
DPAC_RIGHT_END:     

        ret
ENDP DrawPACMAN_RIGHT
;;==============================================================
PROC DrawPACMAN_DOWN

DPAC_DOWN0:
        cmp     [animacao],00h
        jne     DPAC_DOWN1
        call    DrawPacmanDown0
        jmp     DPAC_DOWN_END
DPAC_DOWN1:
        cmp     [animacao],01h
        jne     DPAC_DOWN2
        call    DrawPacmanDown1
        jmp     DPAC_DOWN_END
DPAC_DOWN2:
        cmp     [animacao],02h
        jne     DPAC_DOWN3
        call    DrawPacmanDown2
        jmp     DPAC_DOWN_END
DPAC_DOWN3:
        cmp     [animacao],03h
        jne     DPAC_DOWN_END
        call    DrawPacmanDown1
DPAC_DOWN_END:     

        ret
ENDP DrawPACMAN_DOWN
;;==============================================================
PROC DrawPACMAN_UP

DPAC_UP0:
        cmp     [animacao],00h
        jne     DPAC_UP1
        call    DrawPacmanUp0
        jmp     DPAC_UP_END
DPAC_UP1:
        cmp     [animacao],01h
        jne     DPAC_UP2
        call    DrawPacmanUp1
        jmp     DPAC_UP_END
DPAC_UP2:
        cmp     [animacao],02h
        jne     DPAC_UP3
        call    DrawPacmanUp2
        jmp     DPAC_UP_END
DPAC_UP3:
        cmp     [animacao],03h
        jne     DPAC_UP_END
        call    DrawPacmanUp1
DPAC_UP_END:     

        ret
ENDP DrawPACMAN_UP
;;==============================================================

;;==============================================================
;;================  DrawFruta  =================================
PROC DrawFruta
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
        mov     AL,00h
        call    DrawTile

        mov     AL,40d
        add     posX,3
        add     posY,2
        mov     tamanho,4
        call    printLinhaH
        mov     CX,4
        dec     posX
        inc     posY
        mov     tamanho,6
frutadraw1:
        call    printLinhaH
        inc     posY
        loop    frutadraw1
        inc     posX
        mov     tamanho,4
        call    printLinhaH
        pop     posY
        pop     posX
        push    posX
        push    posY
        inc     posX
        inc     posX
        mov     AH,0ch
        mov     BH,00h
        add     posX,2
        add     posY,3
        mov     CX,posX
        mov     DX,posY
        mov     AL,15d
        int     010h
        add     CX,2
        dec     DX
        mov     AL,0190d
        int     010h
        dec     DX
        int     010h
        inc     CX
        int     010h
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX

        ret
DrawFruta ENDP
;;==============================================================
;;==============================================================

;;=============================================================
;;================  DrawEyes ==================================
PROC DrawEyes
push    AX
push    BX
push    CX
push    DX
        mov     AH,0Ch
        mov     BH,00h
        mov     CX,posX
        mov     DX,posY
        add     CX,3d
        mov     AL,15d
        add     DX,3d
        int     010h
        inc     CX
        int     010h
        inc     CX
        inc     CX
        int     010h
        inc     CX
        int     010h
        inc     DX
        mov     AL,055d
        int     010h
        dec     CX
        mov     AL,015d
        int     010h
        dec     CX
        dec     CX
        mov     AL,055d
        int     010h
        dec     CX
        mov     AL,015d
        int     010h
pop     DX
pop     CX
pop     BX
pop     AX
        ret
ENDP DrawEyes
;;=============================================================
;;=============================================================


;;==============================================================
;;================  DrawGhost  ================================
PROC DrawGhost
        push    SI
        push    AX
        xor     AH,AH
        mov     SI,AX
        sub     SI,04h
        cmp     GHOST_STATUS[SI],00h;normal
        jne     drawSuperGhost
        call    DrawNORMALGhost
        jmp     drawghost_end
drawSuperGhost:
        cmp     GHOST_STATUS[SI],01h;morrivel
        jne     drawDeadGhost
        call    DrawSPECIALGhost
        jmp     drawghost_end
drawDeadGhost:
        cmp     GHOST_STATUS[SI],02h;dead
        jne     drawghost_end
        mov     AL,00h
        call    DrawTile
        call    DrawEyes
        jmp     drawghost_end
drawghost_end:
        pop     AX
        pop     SI
        ret
DrawGhost ENDP
;;==============================================================
PROC DrawSPECIALGhost
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
        mov     AL,104d
        add     posX,4d
        mov     tamanho,2d
        call    PrintLinhaH
        dec     posX
        inc     posY
        mov     tamanho,4d
        call    printLinhaH
        inc     posY
        dec     posX
        mov     tamanho,6d
        call    printLinhaH
        inc     posY
        call    printLinhaH
        inc     posY
        dec     posX
        mov     tamanho,8d
        mov     CX,4d
ghostdraw2:
        call    printLinhaH
        inc     posY
        loop    ghostdraw2
        mov     AH,0ch
        mov     BH,00h
        mov     CX,posX
        mov     DX,posY
        int     010h
        add     CX,3
        int     010h
        inc     CX
        int     010h
        inc     CX
        int     010h
        add     CX,3
        int     010h
        
        pop     posY
        pop     posX
        call    DrawEyes
push	AX
push	BX
push	CX
push	DX
	mov	AH,0Ch
	mov	BH,00h
	mov     CX,posX
        mov     DX,posY
        add     CX,7d
        add     DX,4d
	mov	AL,015d
	int	010h
        sub     CX,03d
        int     010h

pop	DX
pop	CX
pop	BX
pop	AX
        push    posX
        push    posY
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
ENDP DrawSPECIALGhost
;;==============================================================
PROC DrawNORMALGhost

push    AX
push    BX
push    CX
push    DX
push    posX
push    posY

drawNORMALghost1:
        cmp     AL,04h
        jne     drawNORMALghost2
        mov     AL,40d
        jmp     drawNORMALghostEND
drawNORMALghost2:
        cmp     AL,05h
        jne     drawNORMALghost3
        mov     AL,036d
        jmp     drawNORMALghostEND
drawNORMALghost3:
        cmp     AL,06h
        jne     drawNORMALghost4
        mov     AL,53d
        jmp     drawNORMALghostEND
drawNORMALghost4:
        cmp     AL,07h
        jne     drawNORMALghostEND
        mov     AL,42d
        jmp     drawNORMALghostEND
drawNORMALghostEND:


        add     posX,4d
        mov     tamanho,2d
        call    PrintLinhaH
        dec     posX
        inc     posY
        mov     tamanho,4d
        call    printLinhaH
        inc     posY
        dec     posX
        mov     tamanho,6d
        call    printLinhaH
        inc     posY
        call    printLinhaH
        inc     posY
        dec     posX
        mov     tamanho,8d
        mov     CX,4d
ghostdraw:
        call    printLinhaH
        inc     posY
        loop    ghostdraw
        mov     AH,0ch
        mov     BH,00h
        mov     CX,posX
        mov     DX,posY
        int     010h
        add     CX,3
        int     010h
        inc     CX
        int     010h
        inc     CX
        int     010h
        add     CX,3
        int     010h
        
        pop     posY
        pop     posX
        call    DrawEyes
        push    posX
        push    posY
        
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
DrawNORMALGhost ENDP
;;==============================================================

;;==============================================================
;;================  DrawPonto  =================================
PROC DrawPonto
push    posX
push    posY
push    AX
push    CX
        mov     AL,00h
        call    DrawTile
        mov     AL,15d

        add     posX,4
        add     posY,3

        mov     tamanho,02d
        mov     CX,03d
DrawPonto_0:
        call    PrintLinhaH
        inc     posY
        loop    DrawPonto_0
pop     CX
pop     AX
pop     posY
pop     posX
        ret
DrawPonto ENDP
;;==============================================================
;;==============================================================

;;==============================================================
;;================  DrawSuperPonto  ============================
PROC DrawSuperPonto
push    posX
push    posY
        mov     AL,00h
        call    DrawTile
        mov     AL,15d

        add     posX,3
        add     posY,2

        mov     tamanho,04d
        mov     CX,05d
DrawPonto_1:
        call    PrintLinhaH
        inc     posY
        loop    DrawPonto_1
pop     posY
pop     posX
        ret
DrawSuperPonto ENDP
;;===========================================================
;;============================================================




;;================  DrawPacmanDown0  ==========================
PROC DrawPacmanDown0
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                add     posX,04h
                add     posY,04h
                mov     AL,00h
                mov     tamanho,04h
                call    PrintLinhaV
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
ENDP DrawPacmanDown0
;;==============================================================
;;================  DrawPacmanDown1  ==========================
PROC DrawPacmanDown1
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                add     posX,04h
                add     posY,04h
                mov     AL,00h
                mov     tamanho,04h
                call    PrintLinhaV
                inc     posY
                dec     tamanho
                inc     posX
                call    PrintLinhaV
                sub     posX,2
                call    printLinhaV
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
ENDP DrawPacmanDown1
;;==============================================================
;;================  DrawPacmanDown2  ==========================
PROC DrawPacmanDown2
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                add     posX,04h
                add     posY,04h
                mov     AL,00h
                mov     tamanho,04h
                call    PrintLinhaV
                inc     posY
                dec     tamanho
                inc     posX
                call    PrintLinhaV
                sub     posX,2
                call    printLinhaV
                dec     posX
                inc     posY
                dec     tamanho
                call    printLinhaV
                inc     posX
                inc     posX
                inc     posX
                inc     posX
                call    printLinhaV
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
ENDP DrawPacmanDown2
;;==============================================================
;;================  DrawPacmanUp0  ==========================
PROC DrawPacmanUp0
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                add     posX,04h
                mov     AL,00h
                mov     tamanho,04H
                call    PrintLinhaV
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
ENDP DrawPacmanUp0
;;==============================================================
;;================  DrawPacmanUp1  ==========================
PROC DrawPacmanUp1
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                add     posX,04h
                mov     AL,00h
                mov     tamanho,04h
                call    PrintLinhaV
                dec     posX
                mov     tamanho,03h
                call    printLinhaV
                inc     posX
                inc     posX
                call    printLinhaV
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
ENDP DrawPacmanUp1
;;==============================================================
;;================  DrawPacmanUp2  ==========================
PROC DrawPacmanUp2
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                 call    drawPacman
                add     posX,04h
                mov     AL,00h
                mov     tamanho,04h
                call    PrintLinhaV
                dec     posX
                mov     tamanho,03h
                call    printLinhaV
                inc     posX
                inc     posX
                call    printLinhaV
                inc     posX
                dec     tamanho
                call    printLinhaV
                sub     posX,04h
                call    printLinhaV
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
ENDP DrawPacmanUp2
;;==============================================================

;;================  DrawPacmanLeft0  ==========================
PROC DrawPacmanLeft0
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                
                add     posY,04h
                mov     tamanho,03h
                mov     AL,00h
                call    PrintLinhaH
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX

        ret
DrawPacmanLeft0 ENDP
;;============================================================== 
;;================  DrawPacmanLeft1  ==========================
PROC DrawPacmanLeft1
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                
                add     posY,04h
                mov     tamanho,04h
                mov     AL,00h
                call    PrintLinhaH
                dec     posY
                ;dec     posX
                dec     tamanho
                call    PrintLinhaH
                add     posY,02h
                call    printLinhaH
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX

        ret
DrawPacmanLeft1 ENDP
;;============================================================== 
;;================  DrawPacmanLeft2  ==========================
PROC DrawPacmanLeft2
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                
                add     posY,04h
                mov     tamanho,04h
                mov     AL,00h
                call    PrintLinhaH
                dec     posY
                ;dec     posX
                dec     tamanho
                call    PrintLinhaH
                add     posY,02h
                call    printLinhaH
                inc     posY

                dec     tamanho
                call    printLinhaH
                sub     posY,04h
                call    printLinhaH
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX

        ret
DrawPacmanLeft2 ENDP
;;============================================================== 
;;================  DrawPacmanRight0  ===========================
PROC DrawPacmanRight0
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                add     posX,05h
                add     posY,04h
                mov     tamanho,03h
                mov     AL,00h
                call    PrintLinhaH
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
DrawPacmanRight0 ENDP
;;==============================================================
;;================  DrawPacmanRight1  ===========================
PROC DrawPacmanRight1
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
        call    drawPacman
                add     posX,04h
                add     posY,04h
                mov     tamanho,04h
                mov     AL,00h
                call    PrintLinhaH
                dec     posY
                inc     posX
                dec     tamanho
                call    PrintLinhaH
                add     posY,02h
                call    printLinhaH
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
DrawPacmanRight1 ENDP
;;==============================================================
;;================  DrawPacmanRight2  ===========================
PROC DrawPacmanRight2
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
                call    drawPacman
                add     posX,04h
                add     posY,04h
                mov     tamanho,04h
                mov     AL,00h
                call    PrintLinhaH
                dec     posY
                inc     posX
                dec     tamanho
                call    PrintLinhaH
                add     posY,02h
                call    printLinhaH

                inc     posY
                inc     posX
                dec     tamanho
                call    printLinhaH
                sub     posY,04h
                call    printLinhaH

pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        ret
DrawPacmanRight2 ENDP
;;==============================================================

;;================  DrawPacman  ================================
PROC DrawPacman
push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
        mov     AL,044d
        add     posX,04h
        mov     tamanho,02h
        call    printLinhaH
        dec     posX
        inc     posY
        mov     tamanho,04h
        call    printLinhaH
        dec     posX
        inc     posY
        mov     tamanho,06h
        call    printLinhaH
        dec     posX
        inc     posY
        mov     tamanho,08h
        call    printLinhaH
        inc     posY
        call    printLinhaH
        inc     posY
        call    printLinhaH
        inc     posY
        inc     posX
        mov     tamanho,06h
        call    printLinhaH
        inc     posY
        inc     posX
        mov     tamanho,04h
        call    printLinhaH
        inc     posY
        inc     posX
        mov     tamanho,02h
        call    printLinhaH
pop     posY
pop     posX
pop     DX
pop     CX
pop     BX
pop     AX
        inc     posX
        ret
DrawPacman ENDP
;;============================================================== 
;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================
PROC VITORIA_SCREEN
        call    clear_window
        mov     DH,01h
        mov     DL,01h
        call    setCursor
        mov     BL,044d;AMARELO
        lea     DX,menu0_title
        call    imprimeCOLORIDO;cor no BL

        mov     DH,04h
        mov     DL,015d
        call    setCursor
        mov     BL,054d
        lea     DX,txt_vitoriascreen1
        call    imprimeCOLORIDO;cor no BL
        mov     DH,05h
        mov     DL,08d
        call    setCursor
        mov     BL,032d
        lea     DX,txt_vitoriascreen2
        call    imprimeCOLORIDO;cor no BL
        
        mov     DH,06h
        mov     DL,04h
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt5
        call    imprimeCOLORIDO

        mov     DH,07h
        mov     DL,04h
        call    setCursor
        call    printPLAYERname

        mov     DH,06d
        mov     DL,25d
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt4
        call    imprimeCOLORIDO

        mov     DH,06h
        mov     DL,30d
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt3
        call    imprimeCOLORIDO

;---------------
        mov     DH,07d
        mov     DL,029d
        call    setCursor
        mov     AX,[GAMESCORE]
        call    NUMtoArray
        lea     DX,NUMarray
        mov     BX,07h
        call    imprimeCOLORIDO

        mov     DH,12h
        mov     DL,29d
        call    setCursor
        mov     AX,[HIGHSCORE]
        call    NUMtoArray
        lea     DX,NUMarray
        mov     BX,07h
        call    imprimeCOLORIDO
;---------------

        mov     DH,11h
        mov     DL,04h
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt5
        call    imprimeCOLORIDO

        mov     DH,12h
        mov     DL,04d
        call    setCursor
        call    printHIGHESTname

        mov     DH,11h
        mov     DL,25d
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt2
        call    imprimeCOLORIDO

        mov     DH,11h
        mov     DL,030d
        mov     BX,0Dh
        call    setCursor
        lea     DX,txt3
        call    imprimeCOLORIDO

        mov     AH,07h
        int     021h
        int     021h

        ret
ENDP VITORIA_SCREEN
;;===========================================================
PROC SCORESCREEN
        call    clear_window
        mov     DH,01h
        mov     DL,01h
        call    setCursor
        mov     BL,044d;AMARELO
        lea     DX,menu0_title
        call    imprimeCOLORIDO;cor no BL

        mov     DH,03h
        mov     DL,11h
        call    setCursor
        mov     BL,09h
        cmp     [LEVEL],00h
        jne     check_mediumscore
        lea     DX,menu0_easy
        jmp     check_scoreend
check_mediumscore:
        cmp     [LEVEL],01h
        jne     check_hardscore
        lea     DX,menu0_medium
        jmp     check_scoreend
check_hardscore:
        cmp     [LEVEL],02h
        jne     check_scoreend
        lea     DX,menu0_hard
check_scoreend:
        call    imprimeCOLORIDO
        
        mov     DH,06h
        mov     DL,04h
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt5
        call    imprimeCOLORIDO


        mov     DH,07h
        mov     DL,04h
        call    setCursor
        call    printPLAYERname

        mov     DH,06d
        mov     DL,25d
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt4
        call    imprimeCOLORIDO

        mov     DH,06h
        mov     DL,30d
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt3
        call    imprimeCOLORIDO

;---------------
        mov     DH,07d
        mov     DL,029d
        call    setCursor
        mov     AX,[GAMESCORE]
        call    NUMtoArray
        lea     DX,NUMarray
        mov     BX,07h
        call    imprimeCOLORIDO

        mov     DH,12h
        mov     DL,29d
        call    setCursor
        mov     AX,[HIGHSCORE]
        call    NUMtoArray
        lea     DX,NUMarray
        mov     BX,07h
        call    imprimeCOLORIDO
;---------------

        mov     DH,11h
        mov     DL,04h
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt5
        call    imprimeCOLORIDO

        mov     DH,12h
        mov     DL,04d
        call    setCursor
        call    printHIGHESTname

        mov     DH,11h
        mov     DL,25d
        call    setCursor
        mov     BX,0Dh
        lea     DX,txt2
        call    imprimeCOLORIDO

        mov     DH,11h
        mov     DL,030d
        mov     BX,0Dh
        call    setCursor
        lea     DX,txt3
        call    imprimeCOLORIDO

scorescreen_end:
        ret
ENDP SCORESCREEN
;;===========================================================
;;===========================================================
PROC MENU0
        mov     DH,01h
        mov     DL,01h
        call    setCursor
        mov     BL,044d;AMARELO
        lea     DX,menu0_title
        call    imprimeCOLORIDO;cor no BL
        
        mov     DH,04h
        mov     DL,03h
        call    setCursor
        mov     BL,015d
        lea     DX,menu0_1
        call    imprimeCOLORIDO

        call    getCursor
        inc     DL
        call    setCursor

        lea     DX,playerNAME
        mov     AH,0Ah
        int     021h

        call    clear_window

        mov     DH,01h
        mov     DL,01h
        call    setCursor
        mov     BL,044d;AMARELO
        lea     DX,menu0_title
        call    imprimeCOLORIDO;cor no BL

seleciona_dificuldade:
        mov     DH,09h
        mov     DL,11h
        call    setCursor
        lea     DX,menu0_easy
        mov     BL,menu0_vector[0]
        call    imprimeCOLORIDO
        
        mov     DH,0Bh
        mov     DL,11h
        call    setCursor
        lea     DX,menu0_medium
        mov     BL,menu0_vector[1]
        call    imprimeCOLORIDO
        
        mov     DH,0Dh
        mov     DL,11h
        call    setCursor
        lea     DX,menu0_hard
        mov     BL,menu0_vector[2]
        call    imprimeCOLORIDO
        
        xor     BX,BX
        mov     BL,[menu0_selected]
        call    tecladoMENU
        cmp     [menu0_key],08h
        je      sobe_menu
        cmp     [menu0_key],02h
        je      desce_menu
        cmp     [menu0_key],01h
        je      menu0_end
        cmp     [menu0_key],03h
        je      menu0_quit
        jmp     seleciona_dificuldade
sobe_menu:
        cmp     BX,00h
        jbe     seleciona_dificuldade
        mov     menu0_vector[BX],015d
        dec     BX
        dec     [menu0_selected]
        mov     menu0_vector[BX],014d
        jmp     seleciona_dificuldade
desce_menu:
        cmp     BX,02h
        jae     seleciona_dificuldade
        mov     menu0_vector[BX],015d
        inc     BX
        inc     [menu0_selected]
        mov     menu0_vector[BX],014d
        jmp     seleciona_dificuldade
menu0_quit:
        mov     AX, 00002h
        int     10h
        mov     AH,04Ch
        int     021h
        ret
menu0_end:
        ret
ENDP
;;================  TecladoMENU  ============================
PROC TECLADOMENU
push    AX
        mov     AH,00h
        int     016h
        cmp     AH,048h
        je      upMENU
        cmp     AH,050h
        je      downMENU
        cmp     AH,1ch
        je      Eenter
        cmp     AH,01h
        je      escc
        jmp     tecladoMENU_fim

upMENU:     mov     [menu0_key],08h
        jmp     tecladoMENU_fim
downMENU:
        mov     [menu0_key],02h
        jmp     tecladoMENU_fim
Eenter:
        mov     [menu0_key],01h
        jmp     tecladoMENU_fim
escc:
        mov     [menu0_key],03h
        jmp     tecladoMENU_fim

tecladoMENU_fim:
pop     AX
        ret
TECLADOMENU ENDP
;;===========================================================
PROC printPLAYERname
push    CX
push    BX
push    AX
        xor     CH,CH
        mov     CL,playerNAME[1]
        mov     BX,02h
        mov     AH,02h
printPNAMEloop:
        mov     DL,playername[BX]
        int     021h
        inc     BX
        loop    printPNAMEloop
pop     AX
pop     BX
pop     CX
        ret
ENDP printPLAYERname
;;===========================================================
PROC printHIGHESTname
push    CX
push    BX
push    AX
        xor     CH,CH
        mov     CL,highestNAME[1]
        mov     BX,02h
        mov     AH,02h
printHNAMEloop:
        mov     DL,highestNAME[BX]
        int     021h
        inc     BX
        loop    printHNAMEloop
pop     AX
pop     BX
pop     CX
        ret
ENDP printHIGHESTname
;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================

;;==============================================================
;;====================  NUMtoArray  ============================
PROC NUMtoArray ;numero entry no AX
push    AX
push    BX
push    CX
push    SI
push    DX
        xor     DX,DX
        mov     SI,4d
        mov     BX,10d
        mov     CX,5d
NtoA:        
        div     BX
        add     DL,030h
        mov     NUMarray[SI],DL
        xor     DX,DX
        dec     SI
        loop    NtoA
pop     DX
pop     SI
pop     CX
pop     BX
pop     AX
        ret
NUMtoArray ENDP
;;==============================================================
;;==============================================================

;;==============================================================
;;====================== imprimeCOLORIDO =======================
PROC imprimeCOLORIDO; offset do texto no DX. cor no BL
        push    BX
        push    DX
        push    SI
        xor     SI,SI
        mov     AH,0Eh        
printTEXT_1:
        push    BX
        mov     BX,DX
        mov     AL,[BX+SI]
        pop     BX
        cmp     AL,'$'
        je      printTEXT_end
        inc     SI
        mov     BH,00h
        int     010h
        jmp     printTEXT_1
printTEXT_end:
        pop     SI
        pop     DX
        pop     BX
        ret
ENDP imprimeCOLORIDO
;;==============================================================
;;==============================================================

;;==============================================================
;;================  PrintLinhaHORIZONTAL  ======================
PROC PrintLinhaH
;entrada:   posX, posY, tamanho
;           COR=AL
        push    AX
        push    BX
        push    CX
        push    DX

        mov     CX, word ptr [posX];coluna
        add     CX, word ptr [tamanho]
        mov     DX, word ptr [posY];linha
        mov     AH, 0ch    ; put pixel
u2:     int     10h
        dec     CX
        cmp     CX, word ptr [posX]
        jae     u2

        pop     DX
        pop     CX
        pop     BX
        pop     AX
        ret
ENDP PrintLinhaH
;;==============================================================
;;==============================================================

;;==============================================================
;;================  PrintLinhaVERTICAL =========================
PROC PrintLinhaV
;entrada:   posX, posY, tamanho
;           COR=AL
        push    AX
        push    BX
        push    CX
        push    DX

        mov     CX, word ptr [posX];coluna
        mov     DX, word ptr [posY];linha
        add     DX, word ptr [tamanho]

        mov     AH, 0ch    ; put pixel
u1:     int     10h
        dec     DX
        cmp     DX, word ptr [posY]
        jae     u1

        pop     DX
        pop     CX
        pop     BX
        pop     AX
        ret
ENDP PrintLinhaV
;;==============================================================
;;==============================================================

;;==============================================================
PROC getRandom
        push    CX
        push    DX
        mov	AX,25173d	;multiplicador do Gerador Congruencial Linear
        mul	word ptr [seed] ;vezes o seed atual
	add	AX, 13849d	;+incremento
        ror     AX,1
        ror     AX,1
        ror     AX,1
        mov     [seed], ax          ; Update seed = return value
        pop     DX
        pop     CX
    ret
ENDP getRandom
;;==============================================================
delay proc   
        push    AX
        push    CX
        push    DX
  ;mov cx, 7      ;HIGH WORD.
  ;mov dx, 0A120h ;LOW WORD.
  mov CX,0
  ;mov DX,0F424h
  mov DX,0AFC8h
  mov ah, 86h    ;WAIT.
  int 15h
        pop     DX
        pop     CX
        pop     AX
  ret
delay endp      
;;===========================================================
getCursor PROC          ;   GET CURSOR POSITION AND SIZE
    mov     AH,03h      ; Retorna:
    mov     BH,00h      ;   AX=0000h (phoenix bios (????))
    int     10h         ;  s CH=start scan line // CL=end scan line
    ret                 ;   DH=linha (00=top)
ENDP getCursor          ;   DL=coluna (00=left)
;-------------------------------------------------------------------------------------------------------------------
setCursor PROC  ;entry={ DH=linhas(00=top) ; DL=colunas(00=left) }
    mov     AH,02h  
    mov     BH,00h  ; page number (color?)
    int     10h
    ret
ENDP setCursor
;;===========================================================
;-------------------------------------------------------------------------------------------------------------------
clear_window PROC
    push    AX
    push    BX
    push    CX
    push    DX  
    xor 	BH,BH
    mov	    AH,08h
    int	    10h

    mov	    BL,BH
    mov	    BH,AH
    xor	    CX,CX
    mov	    DX,184Fh
    mov	    AX,0600h
    int	    10h

    mov	    BH,BL
    xor	    DX,DX
    mov	    AH,02h
    int	    10h
    pop     DX
    pop     CX
    pop     BX
    pop     AX
    ret
ENDP clear_window
;-------------------------------------------------------------------------------------------------------------------
END MAIN