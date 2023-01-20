section .data
    seed dd 0

section .text
    global _start

_start:
    ; seed the random number generator
    mov eax, [time]
    call dword [time]
    mov [seed], eax

    ; generate a random number between 1 and 100
    mov eax, [seed]
    xor eax, time
    mov [seed], eax
    mov eax, [seed]
    and eax, 100
    add eax, 1

    ; print the result
    mov edx, eax
    mov ecx, message
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .rodata
    message db "Your random number is: ", 0
