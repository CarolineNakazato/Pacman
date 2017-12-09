TITLE PACMAN
.MODEL SMALL
.STACK 100h
.DATA
        NUMarray db 30h,30h,30h,30h,30h,'$'
        letra db 'x'

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
        LEVEL   db 00h
    HIGHSCORE dw 00h
    GAMESCORE dw 00h
    
    txt1 db 'GAME',0Ah,0Dh,'SCORE$'
    txt2 db 'HIGH$'
    txt3 db 'SCORE$'
    txt4 db 'GAME$'
    txt5 db 'PLAYER$'
;------------------------------------------------------------------------------------------------------------------
.CODE
PROC MAIN
        mov     AX,@DATA
        mov     DS, AX

        mov     AH, 00h
        mov     AL, 13h
        int     10h

        ;call    MENU0
        call    SCORESCREEN


        ;call    clear_window
        ;mov     AH,09h
        ;lea     DX,menu0_1
        ;int     021h
        ;int     021h
        ;int     021h

        mov     AH,01h
        int     21h
        mov     AX, 00002h
        int     10h
        mov     AH,04Ch
        int     021h
ENDP MAIN
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
        je      up
        cmp     AH,050h
        je      down
        cmp     AH,1ch
        je      Eenter
        cmp     AH,01h
        je      escc
        jmp     teclado_fim

up:     mov     [menu0_key],08h
        jmp     teclado_fim
down:
        mov     [menu0_key],02h
        jmp     teclado_fim
Eenter:
        mov     [menu0_key],01h
        jmp     teclado_fim
escc:
        mov     [menu0_key],03h
        jmp     teclado_fim

teclado_fim:
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

;;===========================================================
END MAIN