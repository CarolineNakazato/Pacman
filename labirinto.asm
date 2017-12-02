
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

TITLE SOMA_PONTO
.MODEL SMALL
.STACK 100H
.DATA
;LABIRINTO DB 9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,1,1,1,1,1,1,1,1,1,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,1,9,9,9,1,1,1,1,1,9,9,9,1,1,1,1,1,9,9,9,9,9,9,9,1,1,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1,1,1,8,9,9,1,1,9,1,1,1,9,9,0,0,0,0,9,9,9,1,1,1,1,1,9,1,9,9,1,1,9,1,9,1,9,4,0,4,0,4,0,4,9,1,1,9,9,9,9,1,9,9,1,1,9,1,9,1,9,9,9,9,9,9,9,9,9,1,1,1,1,1,1,1,9,9,1,1,9,1,9,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,9,9,9,9,1,1,9,1,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,1,1,9,1,9,1,1,1,1,1,3,1,1,1,1,1,9,9,9,9,9,9,9,9,8,1,9,1,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9	
;POSICAO   DB 170
LABIRINTO DB 9,9,9,9,9,1,3,9,9,8,4,9,9,9,9,9
ARRAY DW 1,1,3,1,1,1,1,1,1
POSICAO DB 2
;POSICAO   DW 7
PONTOS    DB 0
VIDAS     DB 2
SUPERPAC  DB 0 ;COMEU A FRUTINHA?
MSG_PERDEU DB "VC PERDEU O JOGO :C",0DH,0AH,'$'
MSG_pontos DB 0DH,0AH,"Pontos: $"
MSG_vidas DB 0DH,0AH,"Vidas: $"  
flag      db 0
;12x24
;9 -> PAREDE
;8 -> FRUTA
;1 -> PONTOS
;3 -> PACMAN
;4 -> FANTASMAS
.CODE

MOV AX,@DATA
MOV DS,AX

LEA SI,ARRAY 
MOV BP,SI

INICIO:         
;MOV POSICAO,1
MOV SUPERPAC,0
MOV PONTOS,0
;REINICIANDO MATRIZ
JMP PRINTA_MATRIZ
	  
teclado:
        mov     AH,00h
        int     016h
        cmp     AH,048h
        je      up
        cmp     AH,04Bh
        je      left
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

up:
        jmp     teclado
left:
	  XOR BH,BH
      MOV BL,POSICAO
	  SUB BL,1
	  MOV DX,ARRAY[BX]
	  CMP DH,0
	  JE SCR2 
	  JMP PULA2
	  SCR2:
	  MOV DH,DL
	  JMP continua
	  PULA2:
	  MOV DL,DH 
	  continua:
      CMP DL,1
      JE SOMA   
      CMP DL,4
	  JE PERDEU     
	  CMP DL,8
	  JE SUPERPODER_ON 
	  cmp dl,0
	  je anda
      JMP PRINTA_MATRIZ
      ANDA:   
      ;MOV BL,POSICAO 
      add BL,2
      MOV ARRAY[BX],3
      
      SUB POSICAO,1  
      add BL,1 
      ;sub BL,1
      MOV ARRAY[BX],0	
	  
	  JMP PRINTA_MATRIZ            
	        
      SOMA: 
      ADD PONTOS,1 
      ;MOV AH,2
      ;MOV DL,PONTOS 
      ;ADD DL,30H
      ;INT 21H
      ;MOV DL,0DH
	  ;INT 21H
	  ;MOV DL,0AH
      ;INT 21H
      JMP ANDA 
      
      SUPERPODER_ON: 
      ADD SUPERPAC,1 
      JMP SOMA 
      
      MATA_FANTASMA:
        MOV AL,PONTOS
        ADD AL,1
        MOV PONTOS,AL
        JMP SOMA 
        
      ;DECREMENTA VIDA, SE VIDA FOR 0 ACABA JOGO
      PERDEU:  
        CMP SUPERPAC,1
        JE MATA_FANTASMA 
        ;DEC VIDAS
        ;CMP VIDAS,0
        ;JNE INICIO

        ;PRINTA MSG 
        MOV AH,09H
        LEA DX,MSG_PERDEU
        INT 21H 
        JMP SAIR
      
      jmp     teclado
right:  
      XOR BH,BH
      MOV BL,POSICAO
      DE_NV:
	  ADD BL,1
	  MOV DX,ARRAY[BX]
	  CMP DH,0
	  JE SCR3 
	  JMP PULA3
	  SCR3:   
	  cmp dl,0
	  je continua2
	  MOV DH,DL
	  JMP continua2
	  PULA3:
	  MOV DL,DH 
	  continua2: 
	  CMP DL,3
      JE DE_NV
      CMP DL,1
      JE SOMA2   
      CMP DL,4
	  JE PERDEU2     
	  CMP DL,8
	  JE SUPERPODER_ON2 
	  cmp dl,0
	  je anda2
      JMP PRINTA_MATRIZ
      ANDA2: 
      ;XOR BH,BH  
      ;MOV BL,POSICAO
      ;SUB BL,1
      ;ADD BL,1
      MOV ARRAY[BX],3
      ADD POSICAO,1
      ;MOV BL,POSICAO
      sub BL,2;1  
      ;SUB BL,2
      MOV ARRAY[BX],0
      add flag,1
      test flag,1
      jz vai3 
      jmp right
      vai3:	
      ;sub POSICAO,1  
	  JMP PRINTA_MATRIZ            
	        
      SOMA2: 
      ADD PONTOS,1 
      JMP ANDA2 
      
      SUPERPODER_ON2: 
      ADD SUPERPAC,1 
      JMP SOMA2
      
      MATA_FANTASMA2:
        MOV AL,PONTOS
        ADD AL,1
        MOV PONTOS,AL
        JMP SOMA2 
		jmp vai
      inicio_continua:  
	  jmp inicio
	  vai:
      ;DECREMENTA VIDA, SE VIDA FOR 0 ACABA JOGO
      PERDEU2:  
        CMP SUPERPAC,1
        JE MATA_FANTASMA2 
        DEC VIDAS
        CMP VIDAS,0
        JNE inicio_continua

        ;PRINTA MSG 
        MOV AH,09H
        LEA DX,MSG_PERDEU
        INT 21H 
        JMP SAIR
        
        jmp     teclado
down:
        jmp     teclado

teclado_fim:
        ret


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
	  
      MOV CH,0
	  MOV BX,0 
	  MOV CL,0 
	  XOR DX,DX
      LOOP1:
		   HELP:   
		   PROXIMO: 
		    MOV DX, ARRAY[BX]
			
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
			ADD BX,2  
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
jmp teclado


SAIR:
MOV AH,4CH
INT 21H

END

ret




