.model tiny
.data
f_name db "test_1.txt", 0
err_msg db "Error", '$'
msg db "Appended", '$'
app_data db "app data"
len equ 8
handle dw ?
.code
.startup
    ; OPENING A FILE
    lea dx, f_name
    mov ah, 3dh
    mov al, 02h
    int 21h

    ; CHECKING FOR ERROR
    jc x1

    ; TO MOVE FILE POINTER
    mov handle, ax
    mov ah, 42h
    mov al, 02h
    mov bx, handle
    mov cx, 00h
    mov dx, 00h
    int 21h

    ; WRITING TO FILE
    mov ah, 40h
    mov bx, handle
    mov cx, len
    lea dx, app_data
    int 21h

    ; SUCCESS MSG
    lea dx, msg
    mov ah, 09h
    int 21h

    ; CLOSE THE FILE
    mov ah, 3eh
    mov bx, handle
    int 21h

    mov ah, 4ch
    int 21h

x1: lea dx, err_msg
    mov ah, 09h
    int 21h
.exit
end