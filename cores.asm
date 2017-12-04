TITLE PACMAN
.MODEL SMALL
.STACK 100h
;------------------------------------------------------------------------------------------------------------------
.DATA
    posX db 00h
    posY db 00h
    tamanho db 00h
    txt1 db 'GAME',0Ah,0Dh,'SCORE$'
    jmp_line db 10,13,'$'
    NUMarray db 30h,30h,30h,30h,30h,'$'
    NUMvalue dw 00h
;------------------------------------------------------------------------------------------------------------------
.CODE
PROC MAIN
        mov     AX,@DATA
        mov     DS,AX
        mov     AH, 00h
        mov     AL, 13h
        int     10h

        mov     NUMvalue,00h
        mov     BL,00h
        mov     CX,0FFh
colorir:
        call    NUMtoArray
        lea     DX,NUMarray
        call    imprimeCOLORIDO
        inc     BL
        inc     NUMvalue
        push    AX
        mov     AH,02h
        mov     DL,09h
        int     021h
        mov     AH,01h
        int     021h
        pop     AX
        loop    colorir

        mov     AH,01h
        int     21h

        mov     AX, 00002h
        int     10h
        mov     AH,04Ch
        int     021h
ENDP MAIN
;------------------------------------------------------------------------------------------------------------------
;;==============================================================
;;====================  NUMtoArray  ============================
PROC NUMtoArray
push    AX
push    BX
push    CX
push    SI
push    DX
        xor     DX,DX
        mov     AX,NUMvalue
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




;;===========================================================
;;===========================================================
END MAIN