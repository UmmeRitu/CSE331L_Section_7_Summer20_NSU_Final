
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA

 PROMPT_1 DB 'Enter the First digit : $'
 PROMPT_2 DB 'Enter the Second digit : $'
 PROMPT_3 DB 'Smaller digit : $'
 VALUE_1 DB ?
 VALUE_2 DB ?
.CODE
 MAIN PROC
 MOV AX, @DATA ; initialize DS
 MOV DS, AX
 LEA DX, PROMPT_1 ; load and display the PROMPT_1
 MOV AH, 9
 INT 21H
 MOV AH, 1 ; read a character
 INT 21H
 SUB AL, 30H ; save First digit in VALUE_1 in ASCII code
 MOV VALUE_1,AL
 MOV AH, 2 ; carriage return
 MOV DL, 0DH
 INT 21H
 MOV DL, 0AH ; line feed
 INT 21H
 LEA DX, PROMPT_2 ; load and display the PROMPT_2
 MOV AH, 9
 INT 21H
 MOV AH, 1 ; read a character
 INT 21H
 SUB AL, 30H ; save Second digit in VALUE_2 in ASCII code
 MOV VALUE_2,AH
 MOV AH, 2 ; carriage return
 MOV DL, 0DH
 INT 21H
 MOV DL, 0AH ; line feed
 INT 21H
 LEA DX, PROMPT_3 ; load and display the PROMPT_3
 MOV AH, 9
 CMP AL, AH
 JA @Larger ; jump to label @NEGATIVE if digit<0
 Larger: ; jump label
 MOV DL, AL
 JMP @DISPLAY ; jump to label @DISPLAY

 @DISPLAY: ; jump label
 MOV AH, 2 ; print the character
 INT 21H
 
END MAIN

ret




