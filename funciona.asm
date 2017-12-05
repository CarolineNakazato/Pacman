
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

TITLE SOMA_PONTO
.MODEL SMALL
.STACK 100H
.DATA
;LABIRINTO DB 9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,1,1,1,1,1,1,1,1,1,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,1,9,9,9,1,1,1,1,1,9,9,9,1,1,1,1,1,9,9,9,9,9,9,9,1,1,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1,8,9,9,1,1,9,1,1,1,9,9,0,0,0,0,9,9,9,1,1,1,1,1,9,1,9,9,1,1,9,1,9,1,9,4,0,4,0,4,0,4,9,1,1,9,9,9,9,1,9,9,1,1,9,1,9,1,9,9,9,9,9,9,9,9,9,1,1,1,1,1,1,1,9,9,1,1,9,1,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,9,9,9,9,1,1,9,1,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,1,1,9,1,9,1,1,1,1,1,3,1,1,1,1,1,9,9,9,9,9,9,9,9,8,1,9,1,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9	
;POSICAO   DB 170
;LABIRINTO DB 9,9,9,9,9,1,3,9,9,8,4,9,9,9,9,9
;POSICAO   DW 7
ARRAY      DB 3,1,8,9,1,9,4,1,9
POSICAO    DB 0
POSICAO_F  DB 6
POS_INI_F  DB 6
AUX        DB ?
PONTOS     DB 0
VIDAS      DB 3
SUPERPAC   DB 0 ;COMEU A FRUTINHA?
PASSOS     DB 0;"TIMER" -> 4 PASSOS E A FRUTA PARA DE FAZER EFEITO 
MSG_pontos DB 0DH,0AH,"Pontos: $"
MSG_vidas  DB 0DH,0AH,"Vidas: $" 
MSG_PERDEU DB "VC PERDEU O JOGO :C",0DH,0AH,'$'
MSG_GANHOU DB "VC GANHOU O JOGO :)",0DH,0AH,'$'  
MSG_MORREU DB "VC PERDEU UMA VIDA .O.",0DH,0AH,'$'
FLAG_MATAR DB 0

menu db "****************************PACMAN******************************",0dh,0ah
	     db "@@@@,,,@@@@@@@@@@@@`''@@@@@@@@@...@@@@@@@@:::@@@@@@@@:::@@@@@@@@",0dh,0ah
		 db "@@@,,,,,,@@@@@@@@`''''''@@@@@......@@@@@@::::::@@@@@::::::@@@@@@",0dh,0ah
		 db "@@@,,,,,,,@@@@@@`''''''''@@@........@@@@::::::::@@@::::::::@@@@@",0dh,0ah
		 db "@@@@,,,,,,.@@@@@  `''  ''@@@   .   .@@@:   ::  ::@@@  .:   :@@@@@",0dh,0ah
		 db "@@@@@@..,,,@@@@@'* ''* ''@@@.* . * ..@@:*  ::* ::@@:* .:*  :@@@@@",0dh,0ah
		 db "@@@@@@,,,,,@@@@`'  ''  '''@.. ... ...@::   ::  :::@:  ::: :::@@@@",0dh,0ah
		 db "@@@,,,,,,,,@@@@'''''''''''@..........@:::::::::::@::::::::::@@@@",0dh,0ah
		 db "@@@,,,,,,,@@@@@'''''''''''@..........@:::::::::::@::::::::::@@@@",0dh,0ah
		 db "@@@,,,,,,@@@@@@'''''''''''@..........@:::::::::::@::::::::::@@@@",0dh,0ah
		 db "@@@@,...@@@@@@@''@''@''@''@.@..@@..@.@::@::@::@::@:@::@@:::@@@@@",0dh,0ah
		 db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",0dh,0ah
		 db "*****Caroline**17164260*************Marco**16245961*************",0dh,0ah,'$'

pergt_nivel db 0dh,0ah,"Escolha um nivel",0dh,0ah
				db 0dh,0ah,"1) para facil",0dh,0ah
				db 0dh,0ah,"2) para dificil",0dh,0ah,'$'
dicionario      db 0dh,0ah,"Dicionario:",0dh,0ah
				db 0dh,0ah," * 0 -> VAZIO         * 4 -> FANTASMA 1",0dh,0ah
				db 0dh,0ah," * 1 -> PONTOS        * 8 -> FRUTA/PILULA",0dh,0ah
				db 0dh,0ah," * 2 -> SUPER PACMAN  * 9 -> PAREDE",0dh,0ah
				db 0dh,0ah," * 3 -> PACMAN",0dh,0ah,'$'
				;db 0dh,0ah," * 4 -> FANTASMA 1",0dh,0ah 
				;db 0dh,0ah," * 8 -> FRUTA/PILULA",0dh,0ah
				;db 0dh,0ah," * 9 -> PAREDE",0dh,0ah,'$' 
opcao db ?				                
FLAG_DIFICIL db 0  
POSICAO_F_RED DB 0
FLAG_ESPERA   DB 0				                
;-----------------------------------------------------------------------------------------
;			variaveis para o bitmap
;-----------------------------------------------------------------------------------------
;filename db 'im2.bmp',0
filename db 'im6.bmp',0
;filename2 db 'im4.bmp',0
filename2 db 'img8.bmp',0

filehandle dw ?

Header db 54 dup (0)

Palette db 256*4 dup (0)

ScrLine db 320 dup (0)

ErrorMsg db 'Error', 13, 10,'$'
;-----------------------------------------------------------------------------------------
				
;9x9
;9 -> PAREDE
;8 -> FRUTA
;1 -> PONTOS
;3 -> PACMAN 
;2 -> SUPER_PACMAN
;4 -> FANTASMAS
.CODE
w equ 10
h equ 5 

PROC MAIN
    
MOV AX,@DATA
MOV DS,AX

LEA SI,ARRAY 
MOV BP,SI 
	
printa_msg_inicio:
	MOV AH,09H
	LEA DX,menu
	INT 21H 
	         
PRINTA_DICIONARIO:
	MOV AH,09H
	LEA DX,DICIONARIO
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
	;CALL TECLADO_PROC
	
nivel_dificil:
	MOV flag_Dificil,1
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
	;CALL TECLADO_PROC
	
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
       CALL TECLADO_PROC
       ;mov     AH,04Ch
       ;int     021h
ENDP MAIN
	
PROC TECLADO_PROC
    
INICIO:         
  MOV POSICAO,0 
  MOV POSICAO_F,6
  MOV SUPERPAC,0
  MOV PONTOS,0
  MOV FLAG_MATAR,0 
  MOV POSICAO_F_RED,8 
  MOV FLAG_ESPERA,0
  
  CMP FLAG_DIFICIL,1
  JE LABIRINTO_DIFICIL
  
  ;REINICIANDO MATRIZ  
  MOV BL,0
  XOR BH,BH
  MOV ARRAY[BX],3
  ADD BL,1
  MOV ARRAY[BX],1
  ADD BL,1
  MOV ARRAY[BX],8
  ADD BL,1
  MOV ARRAY[BX],9
  ADD BL,1
  MOV ARRAY[BX],1 
  ADD BL,1
  MOV ARRAY[BX],9
  ADD BL,1
  MOV ARRAY[BX],4
  ADD BL,1
  MOV ARRAY[BX],1
  ADD BL,1
  MOV ARRAY[BX],9
  
  JMP PRINTA_MATRIZ
  
  LABIRINTO_DIFICIL: 
  MOV BL,0
  XOR BH,BH
  MOV ARRAY[BX],3
  ADD BL,1
  MOV ARRAY[BX],1
  ADD BL,1
  MOV ARRAY[BX],8
  ADD BL,1
  MOV ARRAY[BX],9
  ADD BL,1
  MOV ARRAY[BX],1 
  ADD BL,1
  MOV ARRAY[BX],9
  ADD BL,1
  MOV ARRAY[BX],4
  ADD BL,1
  MOV ARRAY[BX],1
  ADD BL,1
  MOV ARRAY[BX],4
  
JMP PRINTA_MATRIZ
	  
teclado: 
        mov     AH,00h
        int     016h
        cmp     AH,048h
        je      up
        cmp     AH,04Bh
        je      left_continua
        cmp     AH,04Dh
        je      right_continua
        cmp     AH,050h
        je      down_continua
        cmp     AH,01h
        jne     teclado
        jmp     teclado_fim
right_continua:
jmp right

down_continua:
jmp down

left_continua:
jmp left
up:
        xor bh,bh
        mov bl,posicao
        sub bl,3
        mov DL,array[bx] 

	    CMP DL,1
        JE SOMA_UP   
        CMP DL,4
	    JE PERDEU_UP     
	    CMP DL,8
	    JE SUPERPODER_ON_UP 
	    cmp dl,0
	    je ANDA_UP  
	    
        JMP FANTASMA_ANDA;PRINTA_MATRIZ
     
        ANDA_UP:          
          CMP SUPERPAC,1
          JE SUPERPAC_ATIVADO_UP
  
          MOV ARRAY[BX],3 
          JMP CONTINUA_UP
          
          SUPERPAC_ATIVADO_UP:
            MOV ARRAY[BX],2
            
          CONTINUA_UP:
          mov bl,POSICAO
          MOV ARRAY[BX],0
          
          SUB POSICAO,3	
	  
	      JMP FANTASMA_ANDA;PRINTA_MATRIZ            
	        
        SOMA_UP: 
         ADD PONTOS,1 
         JMP ANDA_UP 
      
        SUPERPODER_ON_UP: 
         ADD SUPERPAC,1 
         ADD PONTOS,1
         JMP SOMA_UP 
      
        MATA_FANTASMA_UP:
         ADD PONTOS,1
         JMP SOMA_UP 
        
        ;DECREMENTA VIDA, SE VIDA FOR 0 ACABA JOGO
        PERDEU_UP:  
         CMP SUPERPAC,1
         JE MATA_FANTASMA_UP 
         DEC VIDAS 
         
         CMP VIDAS,0
         JNE reiniar_continua_up
         JMP MORREU
       
	   reiniar_continua_up:
	   jmp reiniciar
	   
        jmp     teclado
left:
	  XOR BH,BH
      MOV BL,POSICAO
	  SUB BL,1
	  MOV DL,ARRAY[BX] 
	  
      CMP DL,1
      JE SOMA_LEFT   
      CMP DL,4
	  JE PERDEU_LEFT     
	  CMP DL,8
	  JE SUPERPODER_ON_LEFT 
	  cmp dl,0
	  je ANDA_LEFT
	  
      JMP FANTASMA_ANDA;PRINTA_MATRIZ
      
      ANDA_LEFT:
      CMP SUPERPAC,1
      JE SUPERPAC_ATIVADO_LEFT
  
      MOV ARRAY[BX],3 
      JMP CONTINUA_LEFT
          
      SUPERPAC_ATIVADO_LEFT:
        MOV ARRAY[BX],2
            
      CONTINUA_LEFT:
           
      MOV BL,POSICAO 
      MOV ARRAY[BX],0
      	
	  SUB POSICAO,1  
	  
	  JMP FANTASMA_ANDA;PRINTA_MATRIZ            
	        
      SOMA_LEFT: 
      ADD PONTOS,1
      JMP ANDA_LEFT 
      
      SUPERPODER_ON_LEFT: 
      ADD SUPERPAC,1
      ADD PONTOS,1 
      JMP SOMA_LEFT 
      
      MATA_FANTASMA_LEFT: 
        ADD PONTOS,1
        JMP SOMA_LEFT 
        
      ;DECREMENTA VIDA, SE VIDA FOR 0 ACABA JOGO
      PERDEU_LEFT:  
        CMP SUPERPAC,1
        JE MATA_FANTASMA_LEFT 
        DEC VIDAS    
        
        CMP VIDAS,0
        JNE reiniar_continua_left
        JMP MORREU
      reiniar_continua_left:
	   jmp reiniciar
      jmp     teclado 
      
right:  
      XOR BH,BH
      MOV BL,POSICAO
	  ADD BL,1
	  MOV DL,ARRAY[BX] 
	  
      CMP DL,1
      JE SOMA_RIGHT   
      CMP DL,4
	  JE PERDEU_RIGHT     
	  CMP DL,8
	  JE SUPERPODER_ON_RIGHT 
	  cmp dl,0
	  je ANDA_RIGHT
	  
      JMP FANTASMA_ANDA;PRINTA_MATRIZ  
      
      ANDA_RIGHT:           
      CMP SUPERPAC,1
      JE SUPERPAC_ATIVADO_RIGHT
  
      MOV ARRAY[BX],3 
      JMP CONTINUA_RIGHT
          
      SUPERPAC_ATIVADO_RIGHT:
        MOV ARRAY[BX],2
            
      CONTINUA_RIGHT:
        
      MOV BL,POSICAO
      MOV ARRAY[BX],0
      
      ADD POSICAO,1 
        
	  JMP FANTASMA_ANDA;PRINTA_MATRIZ            
	        
      SOMA_RIGHT: 
      ADD PONTOS,1 
      JMP ANDA_RIGHT 
      
      SUPERPODER_ON_RIGHT: 
      ADD SUPERPAC,1
      ADD PONTOS,1 
      JMP SOMA_RIGHT
      
      MATA_FANTASMA_RIGHT:
        ADD PONTOS,1
        JMP SOMA_RIGHT
        
      ;DECREMENTA VIDA, SE VIDA FOR 0 ACABA JOGO
      PERDEU_RIGHT:  
        CMP SUPERPAC,1
        JE MATA_FANTASMA_RIGHT 
        DEC VIDAS    
        
        CMP VIDAS,0
        JNE reiniar_continua_right
        JMP MORREU
        reiniar_continua_right:
	   jmp reiniciar
        jmp     teclado
down:   
        xor bh,bh
        mov bl,posicao
        add bl,3
        mov DL,array[bx] 

        CMP DL,1
        JE SOMA_DOWN   
        CMP DL,4
	    JE PERDEU_DOWN      
	    CMP DL,8
	    JE SUPERPODER_ON_DOWN  
	    cmp dl,0
	    je anda_DOWN 
     
        JMP FANTASMA_ANDA;PRINTA_MATRIZ
        
        ANDA_DOWN:
          CMP SUPERPAC,1
          JE SUPERPAC_ATIVADO_DOWN
  
          MOV ARRAY[BX],3 
          JMP CONTINUA_DOWN
          
        SUPERPAC_ATIVADO_DOWN:
          MOV ARRAY[BX],2
            
        CONTINUA_DOWN:
      
          mov BL,posicao 
          MOV ARRAY[BX],0	
	      
	      add POSICAO,3
	      
	      JMP FANTASMA_ANDA;PRINTA_MATRIZ            
	        
        SOMA_DOWN: 
          ADD PONTOS,1 
          JMP ANDA_DOWN  
      
        SUPERPODER_ON_DOWN: 
          ADD SUPERPAC,1
          ADD PONTOS,1 
          JMP SOMA_DOWN  
      
        MATA_FANTASMA_DOWN:
          ADD PONTOS,1
          JMP SOMA_DOWN
        
        ;DECREMENTA VIDA, SE VIDA FOR 0 ACABA JOGO
        PERDEU_DOWN:  
          CMP SUPERPAC,1
          JE MATA_FANTASMA_DOWN 
          DEC VIDAS 
          
          CMP VIDAS,0
          JNE reiniar_continua_down
          JMP MORREU       
         reiniar_continua_down:
		 jmp reiniciar
		 
        jmp     teclado

teclado_fim:
        ret

FANTASMA_ANDA: 
  CMP SUPERPAC,1
  JE FUGIR
  
  CMP POSICAO_F,6
  JE ANDA_F_RIGHT_continua
  ANDA_F_RIGHT_continua:
  jmp ANDA_F_RIGHT
		 
  Jmp PRINTA_MATRIZ
   
  FUGIR:    
    CMP POSICAO_F,7
    JE ANDA_F_LEFT
    
  Jmp PRINTA_MATRIZ
    
  ANDA_F_UP:
     XOR BH,BH
     MOV BL,POSICAO_F 
     SUB BL,3
     MOV DL,ARRAY[BX]
     MOV AUX,DL
     
     ADD FLAG_ESPERA,1
     
     CMP DL,2
     JE VOLTA_POS_INICIALcontinua
	 VOLTA_POS_INICIALcontinua:
	 jmp VOLTA_POS_INICIAL
     CMP DL,3
     JE matar_continua
	 
	 matar_continua:
	 jmp matar
	 
     CMP DL,9
     JE PRINTA_MATRIZ_continua;PRINTA_MATRIZ
	 PRINTA_MATRIZ_continua:
	 jmp PRINTA_MATRIZ
     MOV ARRAY[BX],4
     
     MOV BL,POSICAO_F
     MOV ARRAY[BX],DL
     
     SUB POSICAO_F,3 
     JMP PRINTA_MATRIZ;PRINTA_MATRIZ
  
  ANDA_F_LEFT:
   XOR BH,BH
   MOV BL,POSICAO_F 
   SUB BL,1
   MOV DL,ARRAY[BX]
     
   CMP DL,2
   JE VOLTA_POS_INICIALcontinua2
	 VOLTA_POS_INICIALcontinua2:
	 jmp VOLTA_POS_INICIAL
   CMP DL,3
   JE matar_continua3
   matar_continua3:
	 jmp matar
   CMP DL,9
   JE PRINTA_MATRIZ_continua2;PRINTA_MATRIZ 
   
   PRINTA_MATRIZ_continua2:
	 jmp PRINTA_MATRIZ   
   MOV ARRAY[BX],4
     
   MOV BL,POSICAO_F
   MOV ARRAY[BX],DL
     
   SUB POSICAO_F,1
   JMP PRINTA_MATRIZ;PRINTA_MATRIZ
    
  ANDA_F_RIGHT:
     XOR BH,BH
     MOV BL,POSICAO_F 
     ADD BL,1
     MOV DL,ARRAY[BX]
     
     ADD FLAG_ESPERA,1
          
     CMP DL,2
     JE VOLTA_POS_INICIAL
     CMP DL,3
     JE MATAR 
     CMP DL,9
     JE PRINTA_MATRIZ;PRINTA_MATRIZ 

     MOV ARRAY[BX],4
     
     MOV BL,POSICAO_F
     MOV ARRAY[BX],DL
     
     ADD POSICAO_F,1
     JMP PRINTA_MATRIZ;PRINTA_MATRIZ
     
  ANDA_F_DOWN:
    XOR BH,BH
    MOV BL,POSICAO_F 
    ADD BL,3
    MOV DL,ARRAY[BX]
    ;MOV AUX,DL
     
    CMP DL,2
    JE VOLTA_POS_INICIAL
    CMP DL,3
    JE MATAR
    CMP DL,9
    JE PRINTA_MATRIZ;PRINTA_MATRIZ
      
    MOV ARRAY[BX],4
     
    MOV BL,POSICAO_F
    MOV ARRAY[BX],DL
    
    ADD POSICAO_F,3
    JMP PRINTA_MATRIZ;PRINTA_MATRIZ
             
  MATAR:
  MOV ARRAY[BX],4
     
  MOV BL,POSICAO_F
  MOV ARRAY[BX],1
  
  MOV FLAG_MATAR,1    
  JMP PRINTA_MATRIZ;PRINTA_MATRIZ
  
  VOLTA_POS_INICIAL:  
  MOV BL,POSICAO_F
  MOV ARRAY[BX],1
  
  MOV POSICAO_F,6 ;POSICAO INICIAL 
  MOV BL,POSICAO_F
  MOV ARRAY[BX],4

JMP PRINTA_MATRIZ

PRINTA_MATRIZ:      
	  MOV AH,09H
      LEA DX,MSG_pontos
      INT 21H 
	  
	  MOV AH,2
      MOV DL,PONTOS 
      ADD DL,30H
      INT 21H
	  
	  MOV AH,09H
      LEA DX,MSG_vidas
      INT 21H
	  
	  MOV AH,2
      MOV DL,vidas 
      ADD DL,30H
      INT 21H
	  
	  MOV DL,0DH
	  INT 21H
	  MOV DL,0AH
      INT 21H 
      
      MOV DL,0DH
	  INT 21H
	  MOV DL,0AH
      INT 21H
	  
      MOV CH,0
	  MOV BX,0 
	  MOV CL,0 
	  XOR DX,DX
      LOOP1:
		   HELP:   
		   PROXIMO: 
		    MOV DL, ARRAY[BX]
			
			MOV AH,2 
			CMP DH,0
			JE SCR 
			JMP PULA
			SCR:
			  MOV DH,DL
			  ADD DL,30H
			  JMP PRINTA
			PULA:
			  MOV DL,DH
			  ADD DL,30H
			PRINTA:
			  INT 21H  
			XOR DX,DX
			ADD BX,1  
			INC CL
			CMP CL,3
			JNE HELP 
			 
		   MOV DL,0DH
		   INT 21H
		   MOV DL,0AH
		   INT 21H
		   MOV CL,0
		   INC CH
      CMP CH,3
      JNE LOOP1  
      
	  CMP FLAG_MATAR,0
      JE continua3
	  
      DEC VIDAS 
      CMP VIDAS,0
      JNE REINICIAR
	  
      JMP MORREU
	  
	continua3:
      CMP FLAG_DIFICIL,1
      JE PONTO_MAX
      
      CMP PONTOS,7 ;PONTO_MAX DO JOGO FACIL 
      JE GANHOU
      
      PONTO_MAX:
       CMP PONTOS,9 ;PONTO_MAX DO JOGO DIFICIL
       JE GANHOU
      
     ;  CMP SUPERPAC,1
     ; JE DIMINUI_TIMER
      
     ; DIMINUI_TIMER:
     ;   CMP PASSOS,6
     ;   JE  ACABA_EFEITO
     ;   ADD PASSOS,1
      
      ;  JMP TECLADO
      
      ;ACABA_EFEITO:
      ;  MOV SUPERPAC,0 

      
     
      
    
      
jmp teclado

REINICIAR:
  MOV AH,09H
  LEA DX,MSG_MORREU
  INT 21H 
        
  JMP INICIO
        
MORREU:
 ;PRINTA MSG 
  MOV AH,09H
  LEA DX,MSG_PERDEU
  INT 21H 
  
  JMP SAIR
        
GANHOU:
  MOV AH,09H
  LEA DX,MSG_GANHOU
  INT 21H 

SAIR:
MOV AH,4CH
INT 21H  

ENDP TECLADO_PROC 


proc OpenFile

    ; Open file

    cmp flag_Dificil,0
	je continua
	abreArq2:
	mov ah, 3Dh
    xor al, al
    mov dx, offset filename2
    int 21h
	jmp continua2
	
	continua:
    mov ah, 3Dh
    xor al, al
    mov dx, offset filename
    int 21h

    continua2:
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


END

ret




