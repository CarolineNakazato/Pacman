TITLE PACMAN
.MODEL SMALL
.STACK 100h
.DATA
    Palette db 256*4 dup (0)

;------------------------------------------------------------------------------------------------------------------
.CODE
;linhaSharp
;sublinha
;Tsharp
w equ 10
h equ 5
PROC MAIN
        mov     AX,@DATA
        mov     DS,AX

;setRes_VGA640x480:
;        mov     AX,04F02h
;        mov     BX,101h
;        int     010h

        mov     ah, 0
        mov     al, 13h
        int     10h


; draw upper line
        mov     CX, 100+w  ; column
        mov     DX, 20     ; row
        mov     AL, 0Dh    ; white
u1:     mov     AH, 0ch    ; put pixel
        int     10h

        dec     CX
        cmp     CX, 100
        jae     u1

; draw bottom line:
        mov     CX, 100+w  ; column
        mov     DX, 20+h   ; row
        mov     AL, 01h     ; white
u2:     mov     AH, 0ch    ; put pixel
        int     10h

        dec     CX
        cmp     CX, 100
        ja      u2

; draw left line:
        mov     CX, 100    ; column
        mov     DX, 20+h   ; row
        mov     AL, 30h     ; white
u3:     mov     AH, 0ch    ; put pixel
        int     10h

        dec     DX
        cmp     DX, 20
        ja      u3


; draw right line:
        mov     CX, 100+w  ; column
        mov     DX, 20+h   ; row
        mov     AL, 02ch     ; white
u4:     mov     AH, 0ch    ; put pixel
        int     10h

        dec     DX
        cmp     DX, 20
        ja      u4


; pause the screen for dos compatibility:
;wait for keypress
        mov     AH,00
        int     16h

end_main:
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
PROC OpenFile
        mov     AH, 03Dh
        xor     AL, AL
        mov     DX, offset filename
        int     021h

        jc      openerror
        mov     [filehandle], ax
        ret

        openerror:
        mov     DX, offset ErrorMsg
        mov     AH, 09h
        int     021h
        ret
ENDP OpenFile
;;==============================================================================
PROC ReadHeader    ; Read BMP file header, 54 bytes
        mov     AH,03fh
        mov     BX, [filehandle]
        mov     CX,54d
        mov     DX,offset Header
        int     021h
        ret
ENDP    ReadHeader
;;==============================================================================
PROC ReadPalette
; Read BMP file color palette, 256 colors * 4 bytes (400h)
        mov     AH,03fh
        mov     CX,0400h
        mov     DX,offset Palette
        int     021h
        ret
ENDP ReadPalette
;;==============================================================================
PROC CopyPal

        ; Copy the colors palette to the video memory
        ; The number of the first color should be sent to port 3C8h
        ; The palette is sent to port 3C9h

        mov     SI,offset Palette
        mov     CX,256d
        mov     DX,03C8h
        mov     AL,00h

        ; Copy starting color to port 3C8h
        out     DX,AL

        ; Copy palette itself to port 3C9h
        inc     DX

        PalLoop:
        ; Note: Colors in a BMP file are saved as BGR values rather than RGB.

        mov     AL,[SI+2] ; Get red value.
        shr     AL,2 ; Max. is 255, but video palette maximal
                     ; value is 63. Therefore dividing by 4.
        out     DX,AL ; Send it.

        mov     AL,[SI+1] ; Get green value.
        shr     AL,2
        out     DX,AL ; Send it.

        mov     AL,[SI] ; Get blue value.
        shr     AL,2
        out     DX,AL ; Send it.
        add     SI,4 ; Point to next color.

        ; (There is a null chr. after every color.)

        loop PalLoop
        ret
ENDP CopyPal
;;==============================================================================
PROC CopyBitmap
    ; BMP graphics are saved upside-down.
    ; Read the graphic line by line (200 lines in VGA format),
    ; displaying the lines from bottom to top.
        mov     AX, 0A000h
        mov     ES, AX
        mov     CX,200d
        PrintBMPLoop:
        push    CX

        ; di = cx*320, point to the correct screen line

        mov     DI,CX
        shl     CX,6
        shl     DI,8
        add     DI,CX

        ; Read one line

        mov     AH,3fh
        mov     CX,320
        mov     DX,offset ScrLine
        int     21h

        ; Copy one line into video memory

        cld

        ; Clear direction flag, for movsb

        mov     CX,320
        mov     SI,offset ScrLine
        rep     movsb

        ; Copy line to the screen
        ;rep movsb is same as the following code:
        ;mov es:di, ds:si
        ;inc si
        ;inc di
        ;dec cx
        ;loop until cx=0

        pop     CX
        loop    PrintBMPLoop
        ret
endp CopyBitmap
;;==============================================================================
END MAIN
