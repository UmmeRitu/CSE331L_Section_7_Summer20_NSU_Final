
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
 PROMPT_1 DB 'Original value of AL : $'
 PROMPT_2 DB 0DH,0AH,'Divide SHR by 4 : $'
.CODE
 MAIN PROC
 MOV AX, @DATA ; initialize DS
 MOV DS, AX
 LEA DX, PROMPT_1 ; load and print PROMPT_1
 MOV AH, 9
 INT 21H
 MOV AL, 38H ; place 1 in the AL
 MOV BL, AL ; save AL in to BL
 MOV AH, 2 ; print the original value of AL
 MOV DL, AL
 INT 21H


 LEA DX, PROMPT_2 ; load and print PROMPT_2
 MOV AH, 9
 INT 21H
 AND BL, 0FH ; convert ascii to decimal code
 MOV CL, 2   ; multiply AL by 8
 SHR BL, CL
 OR BL, 30H ; convert decimal to ascii code
 MOV AH, 2 ; print the processed value of AL
 MOV DL, BL
 INT 21H
 MOV AH, 4CH ; return control to DOS
 INT 21H
 MAIN ENDP
END MAIN

ret




