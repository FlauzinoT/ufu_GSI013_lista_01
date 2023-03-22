#Davi Falcao - 12121BSI233
#Guilherme Castilho Machado - 12021BSI225
#Henrique Costa Fernandes de Sousa - 11821BSI263
#Lucas Gabriel Dutra de Souza - 12121BSI226
#Thiago Flauzino Oliveira Dutra - 12011BSI287

#5) Considere que vetor V esteja associado ao registrador base $s6. Converta a instrução em linguagem C para MIPS.

# b)
# while( V[0] <= a )
# V[0] = V[0] + b;

loop:
    lw $t0, ($s6)         # t0 = V[0]
    slt $t1, $t0, $s0     # if (V[0] <= a)
    beq $t1, $zero, exit  # exit loop
    add $t2, $t0, $s1     # t2 = V[0] + b
    sw $t2, ($s6)         # V[0] = V[0] + b
    j loop                # repete o loop
exit:
