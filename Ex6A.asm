#Davi Falcao - 12121BSI233
#Guilherme Castilho Machado - 12021BSI225
#Henrique Costa Fernandes de Sousa - 11821BSI263
#Lucas Gabriel Dutra de Souza - 12121BSI226
#Thiago Flauzino Oliveira Dutra - 12011BSI287

#6) Qual o código em assembly do MIPS para cada uma das seguintes funções C?

# a)
# int busca(int x, int n, int v[]) {
# int k;
# k = n-1;
# while(k>=0 && v[k] != x)
# k -= 1;
# return k;
# }

busca:
    addi $sp, $sp, -12      # Aloca espaço na pilha
    sw   $ra, 0($sp)        # Salva o endereço de retorno na pilha
    sw   $s0, 4($sp)        # Salva o valor de $s0 na pilha
    sw   $s1, 8($sp)        # Salva o valor de $s1 na pilha

    add  $s0, $a1, $zero    # $s0 = n
    addi $s0, $s0, -1       # $s0 = n-1
    move $s1, $a2           # $s1 = endereço do vetor v
    add  $t0, $zero, $zero  # $t0 = 0 (índice k inicial)

loop:
    beq  $s0, $zero, nao_encontra   # Se k=0, sai do loop
    lw   $t1, ($s1)         # $t1 = v[k]
    beq  $t1, $a0, encontra    # Se v[k]=x, sai do loop
    addi $t0, $t0, 1        # Incrementa k
    addi $s1, $s1, 4        # Avança para o próximo elemento do vetor
    addi $s0, $s0, -1       # Decrementa k
    j    loop

encontra:
    add  $v0, $t0, $zero    # $v0 = k
    j    end

nao_encontra:
    addi $v0, $zero, -1     # $v0 = -1

end:
    lw   $ra, 0($sp)        # Restaura o endereço de retorno
    lw   $s0, 4($sp)        # Restaura o valor de $s0
    lw   $s1, 8($sp)        # Restaura o valor de $s1
    addi $sp, $sp, 12       # Desaloca espaço na pilha
    jr   $ra                # Retorna para o chamador
