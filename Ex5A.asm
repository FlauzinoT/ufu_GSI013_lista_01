#Davi Falcao - 12121BSI233
#Guilherme Castilho Machado - 12021BSI225
#Henrique Costa Fernandes de Sousa - 11821BSI263
#Lucas Gabriel Dutra de Souza - 12121BSI226
#Thiago Flauzino Oliveira Dutra - 12011BSI287

#5) Considere que vetor V esteja associado ao registrador base $s6. Converta a instrução em linguagem C para MIPS.

# a)
# while (b < 32) {
# a = a + a;
# V[4] = a + b;
# b = b + 1;
# }

loop:
    slt $t0, $s1, 32      # if (b < 32)
    beq $t0, $zero, exit  # exit loop
    add $s0, $s0, $s0     # a = a + a
    add $t1, $s0, $s1     # t1 = a + b
    add $t2, $s6, 16      # t2 = &V[4]
    sw $t1, ($t2)         # V[4] = a + b
    addi $s1, $s1, 1      # b = b + 1
    j loop                # repete o loop
exit:
