TITLE PACMAN
.MODEL SMALL
.STACK 100h
.DATA
;filename db 'menu00.bmp',0
filename db 64 dup (0)
filehandle dw ?
Header db 54 dup (0)
Palette db 256*4 dup (0)
ScrLine db 320 dup (0)
ErrorMsg db 'Error', 13, 10,'$'

menu00 db 'menu00.bmp',0
menu01 db 'menu01.bmp',0
menu1_00 db 'menu1_00.bmp',0
menu1_02 db 'menu1_02.bmp',0
menu1_10 db 'menu1_10.bmp',0
menu1_12 db 'menu1_12.bmp',0

;------------------------------------------------------------------------------------------------------------------
.CODE
PROC copyName
        push    BX
        push    CX
        xor     BX,BX
        mov     CX,064d
zera:   
        mov     filename[BX],00h
        loop    zera
        


        pop     BX
        pop     CX
copyName ENDP

PROC MAIN
        mov     AX,@DATA
        mov     DS,AX

        mov     AH,00h
        mov     AL,013h
        int     010h

        mov     
        mov     filename, menu00

        call    OpenFile
        call    ReadHeader
        call    ReadPalette
        call    CopyPal
        call    CopyBitmap

end_main:
        mov     AH,01h
        int     21h
        int     21h

        mov     AH,00       ; return to text mode:
        mov     AL,03       ;text mode 3
        int     10h
        mov     AH,04Ch
        int     021h
ENDP MAIN

;;===========================================================
;;================  Teclado  ================================
PROC Teclado
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
        jmp     teclado
right:
        jmp     teclado
down:
        jmp     teclado

teclado_fim:
        ret
Teclado ENDP
;;==============================================================================
;;==============================================================================
;;==============================================================================
;;==============================================================================
proc OpenFile
    mov ah, 3Dh
    xor al, al
    mov dx, offset filename
    int 21h

    jc openerror
    mov [filehandle], ax
    ret

    openerror:
    mov dx, offset ErrorMsg
    mov ah, 9h
    int 21h
    ret
endp OpenFile
;;==============================================================================
proc ReadHeader
    mov ah,3fh
    mov bx, [filehandle]
    mov cx,54
    mov dx,offset Header
    int 21h
    ret
    endp ReadHeader
    proc ReadPalette

    ; Read BMP file color palette, 256 colors * 4 bytes (400h)
    mov ah,3fh
    mov cx,400h
    mov dx,offset Palette
    int 21h
    ret
endp ReadPalette
;;==============================================================================
proc CopyPal
    ; Copy the colors palette to the video memory
    ; The number of the first color should be sent to port 3C8h
    ; The palette is sent to port 3C9h
    mov si,offset Palette
    mov cx,256
    mov dx,3C8h
    mov al,0

    ; Copy starting color to port 3C8h
    out dx,al

    ; Copy palette itself to port 3C9h
    inc dx
    PalLoop:

    ; Note: Colors in a BMP file are saved as BGR values rather than RGB.

    mov al,[si+2] ; Get red value.
    shr al,1 ; Max. is 255, but video palette maximal
    shr al,1
    ; value is 63. Therefore dividing by 4.

    out dx,al ; Send it.
    mov al,[si+1] ; Get green value.
    shr al,1
    shr al,1
    out dx,al ; Send it.
    mov al,[si] ; Get blue value.
    shr al,1
    shr al,1
    out dx,al ; Send it.
    add si,4 ; Point to next color.

    ; (There is a null chr. after every color.)

    loop PalLoop
    ret
endp CopyPal
;;==============================================================================
proc CopyBitmap

    ; BMP graphics are saved upside-down.
    ; Read the graphic line by line (200 lines in VGA format),
    ; displaying the lines from bottom to top.

    mov ax, 0A000h
    mov es, ax
    mov cx,200
    PrintBMPLoop:
    push cx

    ; di = cx*320, point to the correct screen line

    mov di,cx
    shl cx,1
    shl cx,1
    shl cx,1
    shl cx,1
    shl cx,1
    shl cx,1
    push cx
    mov cx,08h
    shl di,cl
    pop cx
    add di,cx

    ; Read one line

    mov ah,3fh
    mov cx,320
    mov dx,offset ScrLine
    int 21h

    ; Copy one line into video memory

    cld 

    ; Clear direction flag, for movsb

    mov cx,320
    mov si,offset ScrLine
    rep movsb 

    ; Copy line to the screen
    ;rep movsb is same as the following code:
    ;mov es:di, ds:si
    ;inc si
    ;inc di
    ;dec cx
    ;loop until cx=0

    pop cx
    loop PrintBMPLoop
    ret
endp CopyBitmap
;;==============================================================================
END MAIN
