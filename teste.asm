TITLE PACMAN
.MODEL SMALL
.STACK 100h
.DATA
        GHOST_POS dw 0000h,0000h,0000h,0000h
        NUMarray db 30h,30h,30h,30h,30h,'$'
        PRN dw 00h
        lastRAND db 00h
        letra db 'x'
        text db "Adam$"
        filename db "name.txt",0
        handler dw ?

        valor db 00h,0Dh,0Ah
;------------------------------------------------------------------------------------------------------------------
.CODE
PROC MAIN
        mov     AX,@DATA
        mov     DS, AX

        ;CREATE FILE.
        mov  ah, 3ch
        mov  cx, 0
        mov  dx, offset filename
        int  21h  
        ;PRESERVE FILE HANDLER RETURNED.
        mov  handler, ax

        ;mov     AH, 00h
        ;mov     AL, 13h
        ;int     10h

        MOV     AH, 00h   ; interrupt to get system timer in CX:DX 
        INT     1AH
        mov     [PRN], dx

        mov     CX,0FFFFh
rotina:
        push    CX

        call    CalcNew
        and     AX,03h



        ;xor     DX,DX
        ;mov     CX,04d
        ;div     CX
        ;AX
        ;resto DX
        mov     valor[0],AL
        add     valor[0],'0'


        call    NUMtoArray
        mov     DX,offset NUMarray
        mov     AH,09h
        int     021h


        mov     AH,040h
        mov     BX,[handler]
        mov     CX,1
        lea     DX,valor
        int     021h

        
        push    AX
        mov     AH,02h
        mov     DL,0Dh
        int     021h
        mov     DL,0Ah
        int     021h
        pop     AX


        pop     CX
        loop    rotina
;----------------------------

        ;CLOSE FILE (OR DATA WILL BE LOST).
        mov  ah, 3eh
        mov  bx, handler
        int  21h   

        ;mov     AH,01h
        ;int     21h
        mov     AX, 00002h
        int     10h
        mov     AH,04Ch
        int     021h
ENDP MAIN


PROC CalcNew
        push    CX
        push    DX
        mov	AX,25173d	;multiplicador do Gerador Congruencial Linear
        mul	word ptr [PRN] ;vezes o seed atual
	add	AX, 13849d	;+incremento
        ror     AX,1
        ror     AX,1
        ror     AX,1
        mov     [PRN], ax          ; Update seed = return value
        pop     DX
        pop     CX
    ret
ENDP CalcNew













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

;;===========================================================
;;================  Teclado  ================================
PROC TECLADOPROC
teclado:
        mov     AH,01h
        int     016h
        jz      teclado_fim
        mov ah, 00h ; get the keystroke
        int 16h

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

up:	mov	[letra],'^'
        jmp     teclado_fim
left:	mov	[letra],'<'
        jmp     teclado_fim
right:	mov	[letra],'>'
        jmp     teclado_fim
down:	mov	[letra],'_'
        jmp     teclado_fim

teclado_fim:
        ret
TECLADOPROC ENDP
;;===========================================================
;;===========================================================

END MAIN