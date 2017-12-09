TITLE PACMAN
.MODEL SMALL
.STACK 100h
;------------------------------------------------------------------------------------------------------------------
.DATA

        matrizxxx db 20 dup (09h)
        db 09h, 10 dup (01h), 09h, 7 dup (01h), 09h
        db 09h, 8 dup (01h), 4 dup (09h), 01h , 5 dup (09h), 09h
        db 09h, 01h, 3 dup(09h), 7 dup (01h), 2 dup (01h), 09h, 4 dup(01h), 09h
        db 09h, 01h, 01h, 09h, 01h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 09h, 01h, 09h,09h, 01h, 09h
        db 09h, 01h, 01h, 09h, 01h, 01h, 01h, 09h, 0Ah, 0Ah, 0Ah, 0Ah, 09h, 01h, 09h, 01h, 09h, 09h, 01h, 09h
        db 09h, 01h, 01h, 09h, 01h, 01h, 01h, 09h, 04h, 05h, 06h, 07h, 09h, 01h, 01h, 01h, 09h, 09h, 01h, 09h
        db 09h, 01h, 01h, 09h, 01h, 09h, 01h, 09h, 00h, 00h, 00h, 00h, 09h, 01h, 09h, 09h, 09h, 09h, 01h, 09h
        db 09h, 01h, 01h, 09h, 01h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 09h
        db 09h, 01h, 01h, 09h, 01h, 09h, 01h, 00h, 00h, 00h, 03h, 00h, 00h, 01h, 09h, 09h, 09h, 09h, 09h, 09h
        db 09h, 01h, 01h, 09h, 01h, 09h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 09h
        db 09h, 01h, 01h, 09h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 09h, 09h, 09h, 09h, 09h
        db 09h, 01h, 01h, 09h, 08h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 02h, 09h
        db 20 dup (09h)
        db 6 dup ( 20 dup (00h) )



        matriz db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9
                db 9, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 9
                db 9, 1, 9, 9, 1, 9, 9, 9, 1, 9, 9, 1, 9, 9, 9, 1, 9, 9, 1, 9
                db 9, 1, 9, 9, 1, 9, 9, 9, 1, 9, 9, 1, 9, 9, 9, 1, 9, 9, 1, 9
                db 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9
                db 9, 1, 9, 9, 1, 9, 1, 9, 9, 9, 9, 9, 9, 1, 9, 1, 9, 9, 1, 9
                db 9, 1, 1, 1, 1, 9, 1, 1, 1, 9, 9, 1, 1, 1, 9, 1, 1, 1, 1, 9
                db 9, 9, 9, 9, 1, 9, 9, 9, 1, 9, 9, 1, 9, 9, 9, 1, 9, 9, 9, 9
                db 0, 0, 0, 9, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1, 9, 0, 0, 0
                db 9, 9, 9, 9, 1, 9, 0, 9, 9, 0Ah, 0Ah, 9, 9, 0, 9, 1, 9, 9, 9, 9
                db 0Ah, 1, 1, 1, 1, 1, 0, 9, 4, 5, 6, 7, 9, 0, 1, 1, 1, 1, 1, 0Ah
                db 9, 9, 9, 9, 1, 9, 0, 9, 9, 9, 9, 9, 9, 0, 9, 1, 9, 9, 9, 9
                db 0, 0, 0, 9, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1, 9, 0, 0, 0
                db 9, 9, 9, 9, 1, 1, 1, 9, 9, 9, 9, 9, 9, 1, 1, 1, 9, 9, 9, 9
                db 9, 1, 1, 1, 1, 9, 1, 1, 1, 9, 9, 1, 1, 1, 9, 1, 1, 1, 1, 9
                db 9, 1, 9, 9, 1, 9, 9, 9, 1, 9, 9, 1, 9, 9, 9, 1, 9, 9, 1, 9
                db 9, 1, 1, 1, 1, 1, 1, 1, 1, 0, 3, 1, 1, 1, 1, 1, 1, 1, 1, 9
                db 9, 1, 9, 9, 9, 9, 9, 9, 1, 9, 9, 1, 9, 9, 9, 9, 9, 9, 1, 9
                db 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9
                db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9
        ;



        dificil db 20 dup (09h)
	db 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h
	db 09h, 02h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 09h, 02h, 09h
	db 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h
	db 09h, 01h, 09h, 09h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 09h
	db 09h, 01h, 01h, 01h, 01h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 09h
	db 09h, 01h, 09h, 09h, 01h, 09h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 09h, 01h, 09h, 09h, 09h, 01h, 09h
	db 09h, 09h, 09h, 09h, 01h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 09h, 01h, 01h, 01h, 09h
	db 09h, 09h, 09h, 09h, 01h, 09h, 01h, 09h, 09h, 07h, 07h, 09h, 01h, 09h, 01h, 09h, 01h, 09h, 09h, 09h
	db 09h, 01h, 01h, 09h, 01h, 09h, 01h, 09h, 04h, 04h, 04h, 09h, 01h, 09h, 01h, 09h, 01h, 01h, 09h, 09h
	db 09h, 09h, 01h, 09h, 01h, 01h, 01h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 01h, 09h, 09h
	db 09h, 09h, 01h, 09h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 09h, 09h
	db 09h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 09h, 09h
	db 09h, 09h, 09h, 09h, 01h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 01h, 09h, 01h, 09h, 01h, 01h, 09h
	db 09h, 01h, 02h, 09h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 09h
	db 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 09h
	db 09h, 01h, 09h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 02h, 01h, 09h, 09h, 01h, 09h
	db 09h, 01h, 09h, 09h, 01h, 09h, 09h, 09h, 01h, 03h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 01h, 09h
	db 09h, 02h, 01h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 09h, 01h, 01h, 01h, 01h, 01h, 08h, 09h
	db 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h


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
GHOST_NEXTPOS dw 0D0h,0D1h,0D2h,0D3h

GPlayerDST_V db 00h, 00h, 00h, 00h
GPlayerREF_V db 00h, 00h, 00h, 00h ; 0=(cima), 1=(baixo)
GPlayerDST_H db 00h, 00h, 00h, 00h
GPlayerREF_H db 00h, 00h, 00h, 00h ; 0=(esquerda), 1=(direita)

TIMER dw 00h
Tflag db 00h

MSG_pontos DB 0DH,0AH,"Pontos: $"
MSG_vidas  DB 0DH,0AH,"Vidas: $" 
MSG_PERDEU DB "VC PERDEU O JOGO :C",0DH,0AH,'$'
MSG_GANHOU DB "VC GANHOU O JOGO :)",0DH,0AH,'$'  
MSG_MORREU DB "VC PERDEU UMA VIDA .O.",0DH,0AH,'$'

    posX dw 00h
    posY dw 00h
    tamanho dw 00h
    NUMarray db 30h,30h,30h,30h,30h,'$'
    HIGHSCORE dw 00h
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
    txt_youdied db 'YOU ARE DEAD$'
    txt5 db 'PLAYER$'

    runtime db 00h
    seed dw ?
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
        jmp     rotinamain

        mov     AH,01h
        int     21h
        mov     AX, 00002h
        int     10h
        mov     AH,04Ch
        int     021h
ENDP MAIN
;------------------------------------------------------------------------------------------------------------------

;;==============================================================
PROC interface
        mov     AH, 00h
        mov     AL, 13h
        int     10h
        call    MENU0

        
continuanodinterface:
        mov     AL,[menu0_selected]
        mov     [LEVEL],AL

        mov     AX,[HIGHSCORE]
        cmp     [GAMESCORE],AX
        jb      fim_menu
        mov     AX,[GAMESCORE]
        mov     [HIGHSCORE],AX
        xor     BX,BX
        mov     CX,08h
new_playertop:
        mov     AL,playerNAME[BX]
        mov     highestNAME[BX],AL
        inc     BX
        loop    new_playertop

        cmp     [runtime],00h
        je      continuanodinterface
        mov     [GAMESCORE],00h

fim_menu:
        call    SCORESCREEN
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

        mov     [posInicial],330d

        cmp     LEVEL,'2'
        jne     interface_grafica
        mov     SI,00h
        mov     CX,400d
        push    AX
        push    SI
mapa_hard:
        ;falta o mapa medium
        ;mov     [posInicial],330d???????????
        mov     AL,dificil[SI]
        mov     matriz[SI],AL
        inc     SI
        loop    mapa_hard
        pop     SI
        pop     AX

        mov     [Tflag],01h
        dec     [TIMER]
;// ROTINA DO PROGRAMA
interface_grafica:
        cmp     [Tflag],00h
        je      interface_go
        inc     [TIMER]
interface_go:

        call    GetPontosMap
	call    DrawTabuleiro
	call    DrawSCORES
        call    DrawVIDAS
        call    DrawCONTAFRUTAS
        call    TECLADOPROC
        call    delay;;;VERIFICAR OS ILEGAL READ

        call    MOVIMENTOPROC
        call    MovimentoFantasma        

        cmp     [VIDAS],00h
        jne     interface_grafica
        call    GameOver
;// 
exit_interface:
        ret
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
        je      movimento_end
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
        mov     matriz[SI],03h
        mov     SI,[POSICAO]
        mov     matriz[SI],00h
        
        cmp     AL, 01h
        je      moveu_ponto
        cmp     AL, 02h
        je      moveu_pilula
        cmp     AL, 04h
        je      moveu_ghost
        cmp     AL, 05h
        je      moveu_ghost
        cmp     AL, 06h
        je      moveu_ghost
        cmp     AL, 07h
        je      moveu_ghost
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
        add     [GAMESCORE],0200d
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
; 0=parado, 1=sai da jaula, 2=persegue, 3=aleatorio
; 4=baixo_esquerda, 5=baixo_direita, 6=comestivel, 7=morto_voltabase
        xor     BX,BX
        mov     CX,04d
        ;mov     BX,2d
loop_fantasma:
        cmp     movimento_ghost[BX],00h
        jne     ghost_mov1
        inc     movimento_ghost[BX]
        ;fica parado
        jmp     ghost_movCONTINUA
ghost_mov1:
        cmp     movimento_ghost[BX],01h
        jne     ghost_mov2
        call    ghostMOV_normal
        jmp     ghost_movCONTINUA
ghost_mov2:
        cmp     movimento_ghost[BX],02h
        jne     ghost_mov3
        ;call    ghostMOV_cima_esq
        jmp     ghost_movCONTINUA
ghost_mov3:
        cmp     movimento_ghost[BX],03h
        jne     ghost_mov4
        ;call    ghostMOV_cima_dir
        jmp     ghost_movCONTINUA
ghost_mov4:
        cmp     movimento_ghost[BX],04h
        jne     ghost_mov5
        ;call    ghostMOV_baixo_esq
        jmp     ghost_movCONTINUA
ghost_mov5:
        cmp     movimento_ghost[BX],05h
        jne     ghost_mov6
        ;call    ghostMOV_cima_dir
        jmp     ghost_movCONTINUA
ghost_mov6:
        cmp     movimento_ghost[BX],06h
        jne     ghost_mov7
        ;call    ghostMOV_comestivel
        jmp     ghost_movCONTINUA
ghost_mov7:
        cmp     movimento_ghost[BX],07h
        jne     ghost_movCONTINUA
        ;call    ghostMOV_morto
        jmp     ghost_movCONTINUA
ghost_movCONTINUA:

        inc     BX
        loop    loop_fantasma
        
        pop     CX
        pop     BX
        ret
ENDP MovimentoFantasma
;;==============================================================
PROC ghostMOV_normal
        push    DX
        push    CX
        xor     CX,CX
ghostmovRAND:
        call    getRandom
        and     AX,03h
        mov     DX,AX
        ;mov     [HIGHSCORE],DX
        call    GetGhostPos;BX=ghost number
        call    ghostVALIDA_DIRECTION
        ;cmp     CL,01h
        ;jne     ghostmovRAND
        call    ghostMOVIMENTA
        pop     CX
        pop     DX
        ret
ENDP ghostMOV_normal
;;==============================================================

;;==============================================================
PROC ghostMOVIMENTA
        push    AX
        push    SI
        push    BX

        mov     AX,BX
        mov     BX,02h
        mul     BL;result AX
        mov     BX,AX
        mov     SI,GHOST_POS[BX]

        pop     BX
        push    BX

        mov     AL,GHOST_TILE[BX]
        mov     matriz[SI],AL

        mov     AX,BX
        mov     BX,02h
        mul     BL;result AX
        mov     BX,AX
        
        mov     AX,GHOST_NEXTPOS[BX]
        mov     SI,AX

        cmp     matriz[SI],03h
        jne     movghost_fim
        call    perdeVida
movghost_fim:

        pop     BX
        push    BX
        mov     AL,matriz[SI]
        mov     GHOST_TILE[BX],AL
        add     BX,04h
        mov     matriz[SI],BL
        
        pop     BX
        pop     SI
        pop     AX
        ret
ENDP ghostMOVIMENTA
;;==============================================================

;;==============================================================
PROC ghostVALIDA_DIRECTION ;entry no DX, return CL=1->sucesso, return no GHOST_NEXTPOS[BX]
        push    AX
        push    BX
        push    SI

        mov     AX,BX
        mov     BX,02h
        mul     BL;result AX
        mov     BX,AX
        xor     AX,AX
        mov     SI,GHOST_POS[BX]

        cmp     DX,00h
        jne     ghostVAL_DIR1
        jmp     ghostVAL_checkUP
ghostVAL_DIR1:
        cmp     DX,01h
        jne     ghostVAL_DIR2
        jmp     ghostVAL_checkDOWN
ghostVAL_DIR2:
        cmp     DX,02h
        jne     ghostVAL_DIR3
        jmp     ghostVAL_checkLEFT
ghostVAL_DIR3:
        cmp     DX,03h
        jne     ghostVAL_DIR_false
        jmp     ghostVAL_checkRIGHT
;---------------------------------
ghostVAL_checkUP:
        cmp     SI,20d
        jb      ghostVAL_DIR_false
        sub     SI,20d
        call    CheckWall
        cmp     AL,01h   
        je      ghostVAL_DIR_false
        mov     GHOST_NEXTPOS[BX],SI
        mov     CL,01h
        jmp     ghostVAL_DIR_end
ghostVAL_checkDOWN:
        cmp     SI,20d
        jb      ghostVAL_DIR_false
        add     SI,20d
        call    CheckWall
        cmp     AL,01h   
        je      ghostVAL_DIR_false
        mov     GHOST_NEXTPOS[BX],SI
        mov     CL,01h
        jmp     ghostVAL_DIR_end
ghostVAL_checkRIGHT:
	push	BX
        mov     AX,SI
        mov     BL,020d
        div     BL
        pop	BX
        cmp     AH,019d
        je      ghostVAL_DIR_false
        inc     SI
	call    CheckWall
        cmp     AL,01h
        je      ghostVAL_DIR_false
        mov     GHOST_NEXTPOS[BX],SI
        mov     CL,01h
        jmp     ghostVAL_DIR_end
ghostVAL_checkLEFT:
	push	BX
        mov     AX,SI
        mov     BL,020d
        div     BL
        pop	BX
        cmp     AH,00d
        je      ghostVAL_DIR_false
        dec     SI
	call    CheckWall
        cmp     AL,01h
        je      ghostVAL_DIR_false
        mov     CL,01h
        mov     GHOST_NEXTPOS[BX],SI
        jmp     ghostVAL_DIR_end
ghostVAL_DIR_false:
        xor     CL,CL
ghostVAL_DIR_end:
        pop     SI
        pop     BX
        pop     AX
        ret
ENDP ghostVALIDA_DIRECTION
;;==============================================================

;;==============================================================
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
        mov     SI,GHOST_POS[BX]
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
        mov     GPlayerDST_H[BX],DL
        push    BX
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
        mov     CX,04d
        xor     SI,SI
super_loop:
        mov     GHOST_STATUS[SI],01h
        inc     SI
        loop    super_loop
        ;DIMINUI VELOCIDADE DOS GHOSTS EM 10%
        ;ISSO DURA UM TEMPO
        pop     CX
        pop     SI
        ret
ENDP SUPER_PACMAN
;;==============================================================

;;==============================================================
PROC GameOver
push    DX
push    CX
push    BX
push    AX
        mov     [runtime],01h


        mov     DH,14d
        mov     DL,14d
        call    setCursor

        lea     DX,txt_gameover
        mov     BL,0Dh
        call    imprimeCOLORIDO
        mov     AH,07h
        int     021h

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
        push    CX
        mov     CL,GHOST_TILE[BX]
        mov     matriz[SI],CL
        mov     GHOST_TILE[BX],00h
        mov     CX,BX
        add     CX,0D0h
        mov     BX,AX
        mov     GHOST_NEXTPOS[BX],CX
        pop     CX
        pop     BX      
        inc     BX
        loop    reset_tabuleiro1

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
        call    reset_tabuleiro
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
        ;COME O FANTASMA
        jmp     ghost_interactend
ghost_interactDEAD:
        cmp     GHOST_STATUS[SI],02h
        jne     ghost_interactend
        ;NADA ACONTECE
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
        loop    contagem_pontos
        mov     [PontosMapa],AX
        pop     AX
        pop     CX
        pop     SI
        ret
ENDP GetPontosMap
;;=======================================================

;;================ CheckWall ============================
;;========(RETURN AL) ===== (ENTRY SI) ==================
PROC CheckWall
        cmp     matriz[SI],09h
        jne     verificawall_ghost1
        mov     AL,01h
        jmp     verificawall_end
verificawall_ghost1:
        cmp     matriz[SI],04h
        jne     verificawall_ghost2
        mov     AL,01h
        jmp     verificawall_end
verificawall_ghost2:
        cmp     matriz[SI],05h
        jne     verificawall_ghost3
        mov     AL,01h
        jmp     verificawall_end
verificawall_ghost3:
        cmp     matriz[SI],06h
        jne     verificawall_ghost4
        mov     AL,01h
        jmp     verificawall_end
verificawall_ghost4:
        cmp     matriz[SI],07h
        jne     verificawall_false
        mov     AL,01h
        jmp     verificawall_end
verificawall_player:
        cmp     matriz[SI],03h
        jne     verificawall_false
        mov     AL,01h
        jmp     verificawall_end
verificawall_false:
        mov     AL,00h
verificawall_end:
        ret
ENDP CheckWall
;;=======================================================
;;=======================================================

;;=============== GetGhostPos ===============================
PROC GetGhostPos    ;return pos=AX   ;ghostnumber no BX
        push    BX
        push    CX
        push    AX
        push    SI
        mov     BX,00h
        mov     CX,04h
verfantasmas_loop:
        push    BX
        push    CX
        push    AX
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
        sub     BX,04h
        mov     CX,02h
        mov     AX,BX
        mul     CL
        mov     BX,AX
        mov     GHOST_POS[BX],SI
        pop     AX
        pop     CX
        pop     BX
        inc     BX
        loop    verfantasmas_loop
        pop     SI
        pop     AX
        pop     CX
        pop     BX
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
        jmp     pintaTile
swtichT_1:;ponto
        cmp     AL,01h
        jne     swtichT_2
        mov     AL,15d
        call    drawPonto
        jmp     fim_switchTabuleiro
swtichT_2:;PILULA
        cmp     AL,02h
        jne     switchT_3
        mov     AL,15d
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
        mov     AL,40d
        call    drawGhost
        jmp     fim_switchTabuleiro
switchT_5:;ghost2
        cmp     AL,05h
        jne     switchT_6
        mov     AL,12d
        call    drawGhost
        jmp     fim_switchTabuleiro
switchT_6:;ghost3
        cmp     AL,06h
        jne     switchT_7
        mov     AL,53d
        call    drawGhost
        jmp     fim_switchTabuleiro
switchT_7:;ghost4
        cmp     AL,07h
        jne     switchT_8
        mov     AL,42d
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
        jmp     pintaTile
switchT_A:
        cmp     AL,0Ah
        jne     fim_switchTabuleiro
        mov     AL,07d
        call    DrawTile
        jmp     fim_switchTabuleiro

pintaTile:
        call    DrawTile

fim_switchTabuleiro:
pop     AX
        ret
ENDP switchTabuleiro
;;==============================================================



;;=============================================================
;;================  DrawTabuleiro  ============================
PROC DrawTabuleiro
push    AX
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
        div     BX
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
        mov     AL,44d
        call    DrawTile
        ret
DrawPlayer ENDP
;;==============================================================
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

push    AX
push    BX
push    CX
push    DX
push    posX
push    posY
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
DrawGhost ENDP
;;==============================================================
;;==============================================================

;;==============================================================
;;================  DrawPonto  =================================
PROC DrawPonto
push    posX
push    posY
        add     posX,4
        add     posY,3

        mov     tamanho,02d
        mov     CX,03d
DrawPonto_0:
        call    PrintLinhaH
        inc     posY
        loop    DrawPonto_0
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








;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================
;;===========================================================
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
        jmp     scorescreen_end
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

        mov     DH,12h
        mov     DL,029d
        call    setCursor
        mov     AX,[GAMESCORE]
        call    NUMtoArray
        lea     DX,NUMarray
        mov     BX,07h
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
PROC getRandomOLD
	mov	AX,25173d	;multiplicador do Gerador Congruencial Linear
	mul	word ptr [seed] ;vezes o seed atual
	add	AX, 13849d	;+incremento
	mov	[seed],AX	
	ret
getRandomOLD ENDP
;;==============================================================
;;==============================================================
delay proc   
        push    AX
        push    CX
        push    DX
  ;mov cx, 7      ;HIGH WORD.
  ;mov dx, 0A120h ;LOW WORD.
  mov CX,0
  mov DX,0F424h
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