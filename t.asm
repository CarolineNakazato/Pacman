TITLE PACMAN
.MODEL SMALL
.STACK 100h
.DATA
    matriz db 00h,00h,00h
           db 00h,00h,00h
           db 00h,00h,00h
	msg db "PACMAN",0dh,0ah,'$'
	pergt_nivel db 0dh,0ah,"Escolha um nível",0dh,0ah
				db 0dh,0ah,"1) para facil",0dh,0ah
				db 0dh,0ah,"2) para dificil",0dh,0ah,'$'
	opcao db ?
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
	LEA DX,msg
	INT 21H

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

nivel_facil:

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

END MAIN