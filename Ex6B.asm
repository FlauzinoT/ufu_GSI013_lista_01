#Davi Falcao - 12121BSI233
#Guilherme Castilho Machado - 12021BSI225
#Henrique Costa Fernandes de Sousa - 11821BSI263
#Lucas Gabriel Dutra de Souza - 12121BSI226
#Thiago Flauzino Oliveira Dutra - 12011BSI287

#6) Qual o código em assembly do MIPS para cada uma das seguintes funções C?

# b)
# int busca_r(int x, int n, int v[]) {
# if(n == 0)
# return -1;
# if(x == v[n-1])
# return n-1;
# return busca_r(x, n-1, v);
# }

busca_r:
    addi $sp, $sp, -12      # ajusta o ponteiro de pilha
    sw $ra, 8($sp)          # salva o endereço de retorno
    sw $s0, 4($sp)          # salva o valor de s0

    lw $s0, 8($a1)          # $s0 = n
    beq $s0, $zero, retorno # se n == 0, retorna -1

    addi $s0, $s0, -1       # $s0 = n - 1
    lw $t0, ($a2)           # $t0 = v[n-1]
    beq $a0, $t0, encontrado # se x == v[n-1], retorna n-1

    addi $a1, $a1, -1        # n = n - 1
    addi $a2, $a2, 4        # v = v + 1
    j busca_r                # chama a função recursivamente

encontrado:
    addi $s0, $s0, -1       # $s0 = n - 1
    j retorno                # retorna n-1

retorno:
    lw $s0, 4($sp)          # retorna o valor de s0
    lw $ra, 8($sp)          # retorna o endereço de retorno
    addi $sp, $sp, 12       # ajusta o ponteiro da pilha
    jr $ra                  # retorna o chamador
