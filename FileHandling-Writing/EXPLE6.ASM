.model tiny
.data
f_name db "test_1.txt", 0
err_msg db "Error", '$'
msg db "File Created", '$'
data db "hello world", '$'
len equ 11
handle dw ?
.code
.startup
    ; CREATING A FILE
    lea dx, f_name
    mov cl, 20h
    mov ah, 3ch
    int 21h

    ; CHECKING FOR ERROR
    jc x1

    ; OPENING A FILE
    lea dx, f_name
    mov ah, 3dh
    mov al, 02h
    int 21h

    jc x1

    ; WRITING TO FILE
    lea dx, data
    mov handle, ax
    mov ah, 40h
    mov bx, handle
    mov cx, len
    int 21h

    ; TO MOVE FILE POINTER
    mov ah, 42h
    mov al, 02h
    mov cx, 00h
    mov dx, 00h
    int 21h

    ; SUCCESS MSG
    lea dx, msg
    mov ah, 09h
    int 21h

    ; CLOSE THE FILE
    mov ah, 3eh
    int 21h

    mov ah, 4ch
    int 21h

x1: lea dx, err_msg
    mov ah, 09h
    int 21h
.exit
end