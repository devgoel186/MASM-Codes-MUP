.model tiny
.data
curr_mode db ?
key_press equ 'e'
.code
.startup
    ; TO GET CURRENT MODE
    mov ah, 0fh
    int 10h
    mov curr_mode, al

    ; TO SET A MODE
    mov ah, 00h
    mov al, 00h
    int 10h

x1: mov ah, 07h
    int 21h
    cmp al, key_press
    jnz x1

    ; TO SET CURSOR POSITION
    mov ah, 02h
    mov dh, 12 ; set row
    mov dl, 20 ; set column
    mov bh, 00h
    int 10h

    ; TO DISPLAY CHARACTER
    mov al, 'M'

    mov bl, 00001100b
    mov bh, 00h
    mov cx, 1
    
    ; TO CALL DISPLAY ISR
    mov ah, 09h
    int 10h

    ; TO MOVE CURSOR
    mov ah, 02h
    mov dh, 13 ; set row
    mov dl, 20 ; set column
    mov bh, 00h
    int 10h

    ; TO DISPLAY CHARACTER
    mov al, 'P'

    mov bl, 00001100b
    mov bh, 00h
    mov cx, 1
    
    ; TO CALL DISPLAY ISR
    mov ah, 09h
    int 10h

    ; TO CREATE BLOCKING MODE
x2: mov ah, 07h
    int 21h
    cmp al, key_press
    jnz x2

    ; TO RESTORE PREVIOUS MODE
    mov ah, 00h
    mov al, curr_mode
    int 10h
.exit
end
