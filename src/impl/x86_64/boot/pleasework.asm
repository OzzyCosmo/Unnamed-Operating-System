section .data
    keyboard_map db 0, 0, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', 0, 0, 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '[', ']', 0, 0, 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', '\'', '`', 0, '\\', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', ',', '.', '/', 0, '*', 0, ' ', 0
    key_buffer db 0

section .text
    global _start

_start:
    mov rsi, keyboard_map
    mov rdi, 0xb8000

keyboardLoop:
    in al, 0x60
    cmp al, 0
    je keyboardLoop
    movzx rax, al
    mov al, [rsi + rax]
    mov ah, 0x07
    mov [rdi], ax
    add rdi, 2
    jmp keyboardLoop
