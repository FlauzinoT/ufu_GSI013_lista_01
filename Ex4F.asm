#Davi Falcao - 12121BSI233
#Guilherme Castilho Machado - 12021BSI225
#Henrique Costa Fernandes de Sousa - 11821BSI263
#Lucas Gabriel Dutra de Souza - 12121BSI226
#Thiago Flauzino Oliveira Dutra - 12011BSI287

#4) Considere que vetor V esteja associado ao registrador base $s6, e as variáveis a, b, c, d estejam associadas aos
#registradores $s0, $s1, $s2, $s3. Converta a instrução em linguagem C para MIPS.

# f)
# if( V[8] >= 12) {
# a = a + b + c;
# V[8] = V[8] + a;
# } else {
# a = a – b – c;
# V[8] = V[8] + a;
# }

lw $t1,32($s6) # V[8]
blt $t1,12 Else #compara se $t1 é menor que 12
add $s0,$s0,$s1
add $s0,$s0,$s2
add $t1,$t1,$s0
sw $t1,32($s6) #retorna v[8] para $s6
j Exit
Else: sub $s0,$s0,$s1
sub $s0,$s0,$s2
add $t1,$t1,$s0
sw $t1,32($s6) #retorna v[8] para $s6
Exit