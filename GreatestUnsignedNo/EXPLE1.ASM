.model tiny
.data
ARRAY DB 0A5H, 78H, 4FH, 90H, 0B3H, 4EH, 12H, 89H, 4FH, 90H
RES DB ?
.code
.startup
    LEA BX, ARRAY
    MOV CL, 09H
    MOV AL, [BX]
    INC BX
X1: CMP AL, [BX]
    JAE X2
    MOV AL, [BX]
X2: INC BX
    DEC CL
    JNZ X1
    MOV RES, AL
.exit
end
