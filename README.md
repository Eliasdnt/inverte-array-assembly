Segue abaixo o conteúdo do arquivo `README.md`:

---

# Inverte Array

## Equipe
- **Antônio Elias Dantas Neto** - Representante
- **Jaqueline Pereira Rodrigues**
- **Leandra Coutinho de Lima**
- **Guilherme Pereira de Souza**

## Código

```nasm
section .data
    ; Definindo um array de 5 elementos
    array db 1, 2, 3, 4, 5   
    n     equ $ - array   ; Calcula o número de elementos do array

section .text
    global _start

_start:
    ; Calcula quantas trocas são necessárias: metade do número de elementos
    mov ecx, n/2           

    ; Configura dois ponteiros:
    ; ESI aponta para o início do array
    mov esi, array        
    ; EDI aponta para o final do array
    mov edi, array + n - 1  

inverte_loop:
    cmp ecx, 0            ; Verifica se já foram realizadas todas as trocas necessárias
    je fim

    ; Realiza a troca dos valores apontados por ESI e EDI
    mov al, [esi]         ; Carrega o elemento do início em AL
    mov bl, [edi]         ; Carrega o elemento do final em BL
    mov [esi], bl         ; Escreve BL na posição de início
    mov [edi], al         ; Escreve AL na posição de final

    ; Atualiza os ponteiros: avança o início e recua o final
    inc esi               
    dec edi               

    ; Decrementa o contador de iterações
    dec ecx               
    jmp inverte_loop      

fim:
    ; Encerra o programa utilizando a syscall exit (Linux)
    mov eax, 1            
    xor ebx, ebx          
    int 0x80              
```

## Explicação Detalhada

### Definição do Array
- Um array de 5 elementos é declarado: `array db 1, 2, 3, 4, 5`.
- `n` é calculado como o tamanho total do array (5 bytes, pois cada elemento é um byte).

### Configuração Inicial
- `mov ecx, n/2`: Define o número de iterações necessárias (2, pois 5/2 = 2.5 → arredondado para baixo).
- `mov esi, array`: O registrador `ESI` aponta para o início do array.
- `mov edi, array + n - 1`: O registrador `EDI` aponta para o último elemento do array.

### Loop de Inversão
- **Troca dos Elementos:**  
  Durante cada iteração, os elementos apontados por `esi` (início) e `edi` (fim) são trocados:
  - **Primeira iteração:** Troca do primeiro elemento com o último (1 ↔ 5) → Array resultante: `[5, 2, 3, 4, 1]`.
  - **Segunda iteração:** Troca do segundo elemento com o penúltimo (2 ↔ 4) → Array resultante: `[5, 4, 3, 2, 1]`.
- Após cada troca, `esi` é incrementado e `edi` é decrementado para mover os ponteiros em direção ao centro do array.
- O loop é controlado por `ecx` e continua até que `ecx` chegue a 0.

### Resultado Final
- Ao final do processo, o array invertido será: `[5, 4, 3, 2, 1]`.

### Finalização do Programa
- O programa é encerrado utilizando a syscall exit:
  - `mov eax, 1`: Configura o código da syscall para `exit`.
  - `xor ebx, ebx`: Define o status de saída como `0`.
  - `int 0x80`: Realiza a chamada de sistema para finalizar o programa.

---

