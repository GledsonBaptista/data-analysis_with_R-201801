### Atividade prática

## Vamos começar carregando um ambiente previamente criado para esta aula. 
## Nas aulas seguintes trabalharemos com fontes de dados em arquivos de formatos diversos.
load("aula-02/data/dados_exercicio.RData")

### 1 ####
## Inicie mostrando uma prévia do conteúdo da variável acessos_alunos
## 
## Dica 1: No material sobre estruturas de dados vimos como exibir uma prévia do conteúdo de uma variável com 2 funções diferentes
## Dica 2: Na primeira aula vimos uma função do RStudio que permite visualizar o conteúdo de uma variável, mas neste caso 
##         quero ver uma saída na Console.
### # ####

str(acessos_alunos)

### 2 ###
## Quantos elementos a variável acessos_alunos possui? Utilize uma função do R que retorna o tamanho da variável.

## Dica: Vimos um exemplo no mesmo material sobre estruturas de dados
### # ###

length(acessos_alunos)

### 3 ###
## Utilizando o seu código de aluno da Uniritter como nome de um valor da lista, imprima uma linha informando quantos acessos
## você fez. A linha deve ser impressa na Console, com um texto que diga o seu código de aluno e o valor conforme o seguinte exemplo:
## "O aluno <alu...> realizou N acessos."

## Dica 1: Utilize a função paste() para composição do texto que será impresso. 
## Dica 2: Vimos exemplos disto nos materiais dos tipos numéricos e das estruturas de dados.
### # ###

sprintf("O aluno alu201830117 realizou %d acessos", acessos_alunos$alu201830117)

### 4 ###
## A operação abaixo cria um vetor com todas as quantidades de acessos por aluno.
acessos <- unlist(acessos_alunos)

## Após a criação deste vetor, determine quantos colegas fizeram mais acessos que você.
## Faça isso em 3 etapas: 
## 1. Crie uma variável com o resultado de um teste de comparação (relacional) entre o seu número de acessos e os demais.
## 2. Com uma operação de indexação, crie um outro vetor contendo somente os valores maiores
## 3. Determine o tamanho do vetor da operação 2, imprimindo o resultado na Console
### # ###

#maiores <- acessos_alunos[acessos > acessos_alunos$alu201830117]
maiores <- acessos > acessos_alunos$alu201830117
which(maiores)
paste("Alunos com maiores acessos que eu:", length(which(maiores)))

### 5 ###
## Combine todas as etapas acima em uma única chamada, sem a criação dos vetores auxiliares
### # ###
paste("Alunos com maiores acessos que eu:", length(acessos_alunos[acessos > acessos_alunos$alu201830117]))


### 6 ###
## Agora determine quantos colegas fizeram menos acessos que você. 
## Faça isso utilizando a função sum!

## Dica: Lembre que falamos sobre como o R faz conversões implícitas entre o tipo lógico e tipos numéricos
### # ###

paste("Alunos com menores acessos que eu:", sum(acessos < acessos_alunos$alu201830117))


### 7 ###
## Supondo que eu quero atribuir uma nota de participação baseada na quantidade de acessos, com a seguinte definição:
##   - Alunos que não acessaram não recebem nota de participação
##   - Alunos que acessaram, mas menos que 10 vezes, recebem 1 ponto
##   - Alunos que acessaram 10 vezes ou mais recebem 2 pontos
## Crie um vetor chamado notas com a nota de cada aluno, na mesma ordem do vetor de acessos criado para o exercício 4.

## Dica: Pode ser mais fácil se iniciar o vetor notas como uma cópia do vetor acessos, modificando os valores conforme as regras
## OBSERVAÇÃO :: Não avaliarei participação na forma do enunciado deste exercício. 
### # ###

## Primeira solução
notas <- acessos

for (i in 1:length(acessos))
{
  if (acessos[i] == 0)
  {
    notas[i] = 0
  }
  else if (acessos[i] < 10)
  {
    notas[i] = 1
  }
  else
    notas[i] = 2
}

## Segunda solução
notas[which(acessos == 0)] <- 0;
notas[which(acessos > 0 & acessos < 10)] <- 1;
notas[which(acessos >= 10)] <- 2;

### 8 ###
## Visualização da quantidade de alunos com cada nota de participação. Esta não é uma atividade, apenas uma ilustração de como
## criar uma tabela com esta contagem
table(notas)



### 9 ###
## Abaixo, criei uma versão modificada da lista acessos_alunos, com a inclusão de um acesso convidado.
## Não foi possível determinar o número de acessos por não existir um login para este tipo de acesso.
acessos_alunos_e_guest <- acessos_alunos
acessos_alunos_e_guest$guest <- NA

## Repita as atividades 4, 5, 6, e 7 utilizando o acessos_com_guest no lugar da lista acessos_alunos.
## Tome o devido cuidado de sempre criar variáveis com nomes diferentes das já utilizadas! 

### 4 ###
acessos_guest <- unlist(acessos_alunos_e_guest)
acessos_guest

#maiores <- acessos_alunos[acessos > acessos_alunos$alu201830117]
maiores_guest <- acessos_guest > acessos_alunos_e_guest$alu201830117
which(maiores_guest)
paste("Alunos com maiores acessos que eu:", length(which(maiores_guest)))

### 5 ###
paste("Alunos com maiores acessos que eu:", length(acessos_alunos_e_guest[acessos_guest > acessos_alunos_e_guest$alu201830117]))

### 6 ###
paste("Alunos com menores acessos que eu:", sum(acessos_guest < acessos_alunos_e_guest$alu201830117))


### 7 ###
## Primeira solução
notas_guest <- acessos_guest

for (i in 1:length(acessos_guest))
{
  if (acessos_guest[i] == 0)
  {
    notas_guest[i] = 0
  }
  else if (acessos_guest[i] < 10)
  {
    notas_guest[i] = 1
  }
  else
    notas_guest[i] = 2
}

## Segunda solução
notas_guest[which(acessos_guest == 0)] <- 0;
notas_guest[which(acessos_guest > 0 & acessos < 10)] <- 1;
notas_guest[which(acessos_guest >= 10)] <- 2;

### 10 ###
## Responda as seguintes perguntas:


# 1. Houve modificação no número de alunos com mais e com menos acessos que você?
# Como utilizei a função length para calcular os maiores acessos, tive um acesso a mais. A função contou o NA como maior acesso.
# Para os menores, utilizei o sum, que retornou NA.
# Nas soluções para o item 7 tive problemas em ambas, era sempre esperado TRUE ou FALSE e o NA acabou atrapalhando a leitura e
# deu erro na execução.

# 2. Como você conclui que o R trata comparações (operações relacionais) entre valores numéricos e NA?
# Me parece que NA é considerado tanto para TRUE como para FALSE no caso do length, já no sum, a soma não consegue executar e
# retorna NA.

# 3. Qual o resultado do uso da função sum na presença de NA? O que você conclui sobre a operação de soma de todos os valores de
#    um vetor na presença de NA?
# O resultado foi NA. Acredito que o sum não consegue executar pois não é possível estabelecer um valor numérico para NA, diferente
# de como acontece com os valores lógicos TRUE e FALSE, que são substituídos na soma por 1 e 0 respectivamente.

# 4. Execute o comando abaixo para ler a documentação da função sum e veja se há como modificar a chamada da função sum na presença
#    de NAs. Teste os exemplos da página de help da função sum.
help(sum)

## Pass a vector to sum, and it will add the elements together.
sum(1:5)

## Pass several numbers to sum, and it also adds the elements.
sum(1, 2, 3, 4, 5)

## In fact, you can pass vectors into several arguments, and everything gets added.
sum(1:2, 3:5)

## If there are missing values, the sum is unknown, i.e., also missing, ....
sum(1:5, NA)

## ... unless  we exclude missing values explicitly:
sum(1:5, NA, na.rm = TRUE)

## Teste com passagem de parâmetro na função sum para ignorar NA
paste("Alunos com menores acessos que eu:", sum(acessos_guest < acessos_alunos_e_guest$alu201830117))
paste("Alunos com menores acessos que eu:", sum(acessos_guest < acessos_alunos_e_guest$alu201830117, na.rm = TRUE))
