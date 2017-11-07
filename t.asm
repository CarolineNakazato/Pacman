TITLE PACMAN
.MODEL SMALL
.STACK 100h
.DATA
;-----------------------------------------------------------------------------------------
;			variaveis para o bitmap
;-----------------------------------------------------------------------------------------
filename db 'im2.bmp',0

filehandle dw ?

Header db 54 dup (0)

Palette db 256*4 dup (0)

ScrLine db 320 dup (0)

ErrorMsg db 'Error', 13, 10,'$'
;-----------------------------------------------------------------------------------------
    matriz db 00h,00h,00h
           db 00h,00h,00h
           db 00h,00h,00h
	menu db "****************************PACMAN******************************",0dh,0ah
	     db "@@@@;:::@@@@@@@@@@@+''@@@@@@@@@::'@@@@@@@@;;;@@@@@@@@+;;#@@@@@@@",0dh,0ah
		 db "@@@,,,,,,@@@@@@@@#'''''#@@@@@......@@@@@@:::::#@@@@@::::::@@@@@@",0dh,0ah
		 db "@@@,,,,,,,@@@@@@#'''''''#@@@:.......@@@@:::::::#@@@:::::::#@@@@@",0dh,0ah
		 db "@@@@,,,,,,.@@@@@  `''  ''@@@   .   .@@@   ::  ::@@@  .:   :@@@@@",0dh,0ah
		 db "@@@@@@..,,,@@@@@'+ ''+ ''@@@'  .', .#@@'' ::' ::@@#' .:'  :@@@@@",0dh,0ah
		 db "@@@@@@,,,,,@@@@#;  ''  '''@.` ... ,..@+: :::` ::;@:  ::: :::@@@@",0dh,0ah
		 db "@@@#,,,,,,,@@@@#''''''''''@..........@+:::::::::;@::::::::::@@@@",0dh,0ah
		 db "@@@,,,,,,,@@@@@#''''''''''@..........@+:::::::::;@::::::::::@@@@",0dh,0ah
		 db "@@@,,,,,,@@@@@@#''''''''''@..........@+:::::::::;@::::::::::@@@@",0dh,0ah
		 db "@@@@,...@@@@@@@#'#''@''#''@.'..@@..@.@+:#::@::#:;@:#::@#::::@@@@",0dh,0ah
		 db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",0dh,0ah
		 db "*****Caroline**17164260*************Marco***********************",0dh,0ah,'$'
	pergt_nivel db 0dh,0ah,"Escolha um nivel",0dh,0ah
				db 0dh,0ah,"1) para facil",0dh,0ah
				db 0dh,0ah,"2) para dificil",0dh,0ah,'$'
	opcao db ?
	ponto db 0
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
		
printa_msg_inicio:
	MOV AH,09H
	LEA DX,menu
	INT 21H
pergt_QUAL_nivel:
	MOV AH,09H
	LEA DX,pergt_nivel
	INT 21H
	
	MOV AH,1
	INT 21H
	MOV opcao, AL

	CMP opcao,'1'
	JE nivel_facil
	
	CMP opcao,'2'
	JE nivel_dificil
	
	jmp pergt_QUAL_nivel
	
nivel_facil:
start:
    ; Graphic mode
    mov ax, 13h
    int 10h

    ; Process BMP file
    call OpenFile
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap

    ; Wait for key press
    mov ah,1

    int 21h
    ; Back to text mode
    mov ah, 0
    mov al, 2
    int 10h
	jmp end_main	
	
nivel_dificil:

setRes_VGA640x480:
        mov     AX,04F02h
        mov     BX,101h
        int     010h

;        mov ah, 0
;        mov al, 13h 
;        int 10h


; draw upper line:

    mov cx, 100+w  ; column
    mov dx, 20     ; row
    mov al, 0Dh    ; white
u1: mov ah, 0ch    ; put pixel
    int 10h
    
    dec cx
    cmp cx, 100
    jae u1
 
; draw bottom line:

    mov cx, 100+w  ; column
    mov dx, 20+h   ; row
    mov al, 01h     ; white
u2: mov ah, 0ch    ; put pixel
    int 10h
    
    dec cx
    cmp cx, 100
    ja u2
 
; draw left line:

    mov cx, 100    ; column
    mov dx, 20+h   ; row
    mov al, 30h     ; white
u3: mov ah, 0ch    ; put pixel
    int 10h
    
    dec dx
    cmp dx, 20
    ja u3 
    
    
; draw right line:

    mov cx, 100+w  ; column
    mov dx, 20+h   ; row
    mov al, 02ch     ; white
u4: mov ah, 0ch    ; put pixel
    int 10h
    
    dec dx
    cmp dx, 20
    ja u4     
 

; pause the screen for dos compatibility:

;wait for keypress
  mov ah,00
  int 16h			

; return to text mode:
  mov ah,00
  mov al,03 ;text mode 3
  int 10h

end_main:
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
;;===========================================================
;;===========================================================

;;===========================================================
;;================  getMatriz  ==============================
PROC getMatriz
        ret
getMatriz ENDP
;;===========================================================
;;===========================================================

;;===========================================================
;;================  setMatriz  ==============================
PROC setMatriz
        ret
setMatriz ENDP
;;===========================================================
;;===========================================================

proc OpenFile

    ; Open file

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

proc ReadHeader

    ; Read BMP file header, 54 bytes

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
    shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1
	shl di,1	
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

;================================
;================================
END MAIN