.MODEL SMALL
.STACK 100H
.DATA
M1 DB "TYPE A CHARACTER: $"
M2 DB 10,13, "THE ASCII CODE OF "
C1 DB ?," IN BINARY IS: $"

M3 DB 10,13,"THE NUMBER OF 1 BIT IS: "
C2 DB ?,"$"
  


.CODE

MAIN PROC
;DATA
MOV AX,@DATA
MOV DS,AX

;MSG1

MOV AH,9
LEA DX,M1
INT 21H

;READ CHAR
MOV AH,1
INT 21H

MOV BL,AL ;BL

 
 
;M2 PRINT
MOV C1,AL ;C1 MSG 
MOV C3,AL ;C3 USE FOR REVERSE

MOV AH,9
LEA DX,M2
INT 21H


MOV BH,0
MOV CX,8
MOV AH,2




L1:
SHL BL,1
JC L2
MOV DL,'0'
INT 21H
JMP L4

L2:
MOV DL,'1'
INT 21H
INC BH

L4:
LOOP L1

ADD BH,30H ;DISPLAY NUMBER OF 1
MOV C2,BH
MOV AH,9
LEA DX,M3 
INT 21H












EXIT:
MOV AH,4CH
INT 21H


MAIN ENDP

END MAIN