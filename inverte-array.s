section .data
    array db 1, 2, 3, 4, 5   
    n     equ $ - array   ; Calcula o número de elementos do array

section .text
    global _start

_start:
    mov ecx, n/2           

    mov esi, array        
    mov edi, array + n - 1  

inverte_loop:
    cmp ecx, 0            ; Verifica se já foram realizadas todas as trocas necessárias
    je fim

    mov al, [esi]         ; Carrega o elemento do início em AL
    mov bl, [edi]         ; Carrega o elemento do final em BL
    mov [esi], bl         ; Escreve BL na posição de início
    mov [edi], al         ; Escreve AL na posição de final

    inc esi               
    dec edi               

    dec ecx               
    jmp inverte_loop      

fim:
    mov eax, 1            
    xor ebx, ebx          
    int 0x80  
