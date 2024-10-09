%include "../include/io.mac"
 
extern printf
extern position
global solve_labyrinth
 
; you can declare any helper variables in .data or .bss
 
section .text
 
; void solve_labyrinth(int *out_line, int *out_col, int m, int n, char **labyrinth);
solve_labyrinth:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha
 
    mov     eax, [ebp + 8]  ; unsigned int *out_line, pointer to structure containing exit position
    mov     ebx, [ebp + 12] ; unsigned int *out_col, pointer to structure containing exit position
    mov     ecx, [ebp + 16] ; unsigned int m, number of lines in the labyrinth
    mov     edx, [ebp + 20] ; unsigned int n, number of colons in the labyrinth
    mov     esi, [ebp + 24] ; char **a, matrix represantation of the labyrinth
    ;; DO NOT MODIFY
 
    ;; Freestyle starts here

    ; initializam indicii cu 0
    xor edi, edi
    xor ebx, ebx
 
    mov edx, [esi]           ; salvam adresa primului rand   
    mov byte [edx], '1'      ; schimbam pozitia vizitata in 1

    dec dword[ebp + 20]
    dec dword[ebp + 16] 
 
verify_labyrinth:
    ; verificam la dreapta
    inc ebx

    ; calculam adresa elementului de la noua poziție
    mov eax, [esi + edi * 4] ; linia x
    add eax, ebx             ; elementul de pe linia x si coloana y
    cmp byte [eax], '0'
    jnz move_down

    cmp ebx, [ebp + 20]      ; comparam cu numarul de coloane
    jge end
 
    ; marcam pozitia vizitata
    mov byte [eax], '1'
    jmp verify_labyrinth     ; continuam verificarea labirintului
 
move_down:
    dec ebx
    inc edi
 
    ; calculam adresa elementului de la noua poziție
    mov eax, [esi + edi * 4] ; linia x
    add eax, ebx             ; elementul de pe linia x si coloana y
    cmp byte [eax], '0'
    jnz move_left

    cmp edi, [ebp + 16]      ; comparam cu numarul de linii
    jge end
 
    ; marcam pozitia vizitata
    mov byte [eax], '1'
    jmp verify_labyrinth     ; continuam verificarea labirintului

move_left:
    dec edi
    dec ebx

    ; calculam adresa elementului de la noua poziție
    mov eax, [esi + edi * 4]  ; linia x
    add eax, ebx              ; elementul de pe linia x si coloana y
    cmp byte [eax], '0'
    jnz move_up

    ; marcam poziția vizitată
    mov byte [eax], '1'
    jmp verify_labyrinth     ; continuam verificarea labirintului


move_up:
    inc ebx
    dec edi

    ; calculam adresa elementului de la noua poziție
    mov eax, [esi + edi * 4] ; linia x
    add eax, ebx             ; elementul de pe linia x si coloana y
    cmp byte [eax], '0'
    jnz end

    mov byte [eax], '1'
    jmp verify_labyrinth

end:

    ; salvam coordonatele
    mov eax, [ebp + 8]
    mov [eax], edi
    mov eax, [ebp + 12]
    mov [eax], ebx
 
    ;; DO NOT MODIFY
 
    popa
    leave
    ret
