TITLE TUTORIAL
.MODEL SMALL
.STACK 100h
.DATA
        posX dw 00h
        posY dw 00h
        tamanho dw 00h
        NUMarray db 30h,30h,30h,30h,30h,'$'
        VARIAVEL dw 00h
        letra db 'x'
        TXT_MSG db 'ISSO E UM TEXTO$'
;------------------------------------------------------------------------------------------------------------------
.CODE
PROC MAIN
        mov     AX,@DATA
        mov     DS, AX
;ATIVA MODO GRAFICO 320x200 256cores
        mov     AH, 00h
        mov     AL, 13h
        int     10h
;~~~~~~PROGRAMA~~~~~~~~~~~~~~~~~~~
        call    DesenhaNaTela
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;RETORNA AO MODO TEXTO PARA NAO BUGAR O DOS
        mov     AH,01h
        int     21h
        mov     AX, 00002h
        int     10h
        mov     AH,04Ch
        int     021h
ENDP MAIN
;------------------------------------------------------------------------------------------------------------------
;################### DESENHA NA TELA ###############################
PROC DesenhaNaTela
        mov     DH,013d
        mov     DL,013d
        call    setCursor
        ;aqui eu posiciono o cursor para usar a funcao imprime colorido,
        ;caso contrario ele considerara DH=0, DL=0 isso é
        ;CANTO SUPERIOR ESQUERDO DA TELA

        ; COMO DESENHA PIXELS INDIVIDUAIS NA TELA?
        ; ACESSE: http://www.ctyme.com/intr/rb-0104.htm

        mov     BL,03d;BL=COR DO ESCRITO
        lea     DX,TXT_MSG
        call    imprimeCOLORIDO

        mov     posX,50d
        mov     posy,50d
        call    DrawFruta
        mov     posX,100d
        mov     posY,50d
        mov     tamanho,50d
        mov     AL,0Dh;AL=COR DA LINHA
        call    PrintLinhaV
        ;AS CORES PODEM SER DESCOBERTAS EXECUTANDO O PROGRAMA CORES.ASM
        ret
ENDP DesenhaNaTela
;###################################################################


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
END MAIN