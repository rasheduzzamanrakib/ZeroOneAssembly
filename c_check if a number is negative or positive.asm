.MODEL SMALL
.STACK 100H

.DATA

    POS_MSG DB "AH IS POSITIVE$"
    NEG_MSG DB "AH IS NEGATIVE$"

.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, -6

    CMP AH, 0
    JL SHOW_NEGATIVE

SHOW_POSITIVE:
    MOV AH, 9
    LEA DX, POS_MSG
    INT 21H
    JMP EXIT

SHOW_NEGATIVE:
    MOV AH, 9
    LEA DX, NEG_MSG
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN