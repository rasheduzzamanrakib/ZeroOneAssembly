.MODEL SMALL
.STACK 100H
.DATA
    STR1 DB 'AX IS BIGGER $'
    STR2 DB 'BX IS BIGGER $' 
    STR3 DB 'BOTH ARE EQUAL $'
    STR4 DB 'AX IS SMALLER $'
    STR5 DB 'BX IS SMALLER $'

.CODE

MAIN PROC 
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, 3
    MOV BX, 6
    
    CMP AX, BX
    JG AX_BIGGER
    JL BX_BIGGER
    JMP EQUAL
    
    
AX_BIGGER:
    MOV AH, 9
    LEA DX, STR1
    INT 21H
    MOV AH, 9
    LEA DX, STR5
    INT 21H
    JMP EXIT
    
    
BX_BIGGER:
    MOV AH, 9
    LEA DX, STR2
    INT 21H
    MOV AH, 9
    LEA DX, STR4
    INT 21H
    JMP EXIT  
            
EQUAL:
    MOV AH, 9
    LEA DX, STR3
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
    
       
MAIN ENDP
END MAIN