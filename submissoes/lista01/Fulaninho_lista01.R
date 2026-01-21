# =========================================================
# Estatística Básica utilizando R
# Lista 01 – Introdução ao R e Estatística Descritiva
# ---------------------------------------------------------
# Nome do aluno:
# Data:
#
# Instruções:
# - Preencha apenas os trechos indicados
# - Não altere nomes de objetos existentes
# - O código deve rodar do início ao fim sem erros
# =========================================================


# ---------------------------------------------------------
# Questão 1 – Conhecendo os dados
# ---------------------------------------------------------

# Utilize o conjunto de dados 'iris', que já vem com o R
dados <- iris

# a) Quantas linhas e colunas possui o conjunto de dados?
n_linhas  <- 150   # COMPLETE AQUI
n_colunas <- ncol(dados)   # COMPLETE AQUI


# ---------------------------------------------------------
# Questão 2 – Tipos de variáveis
# ---------------------------------------------------------

# a) Qual é a classe do objeto 'dados'?
classe_dados <- class(dados)   # COMPLETE AQUI

# b) Qual é a classe da variável Species?
classe_species <- class(dados$Species) # COMPLETE AQUI


# ---------------------------------------------------------
# Questão 3 – Estatística descritiva
# ---------------------------------------------------------

# Considere a variável Sepal.Length

# a) Calcule a média
media_sepala <- mean(dados$Sepal.Length)   # COMPLETE AQUI

# b) Calcule a mediana
mediana_sepala <- median(dados$Sepal.Length) # COMPLETE AQUI

# c) Calcule o desvio padrão
dp_sepala <- sd(dados$Sepal.Length)      # COMPLETE AQUI


# ---------------------------------------------------------
# Questão 4 – Interpretação (resposta curta)
# ---------------------------------------------------------

# Em poucas linhas, responda:
# A média e a mediana do comprimento da sépala são semelhantes?
# O que isso sugere sobre a distribuição dos dados?

interpretacao_q4 <- "são bem proximas, a distribuição é quase simetrica"


# ---------------------------------------------------------
# Questão 5 – Visualização de dados
# ---------------------------------------------------------

# Crie um boxplot da variável Sepal.Length
# O gráfico deve ter:
# - título
# - nome no eixo y

# COMPLETE AQUI



# ---------------------------------------------------------
# Questão 6 – Salvando um resultado
# ---------------------------------------------------------

# Crie um objeto chamado 'resumo_sepala' contendo:
# - média
# - mediana
# - desvio padrão
#
# Use uma estrutura adequada (ex: data.frame ou lista)


resumo_sepala <- list(media_sepala, mediana_sepala, dp_sepala)  # COMPLETE AQUI


# ---------------------------------------------------------
# Fim da Lista 01
# ---------------------------------------------------------

# Verifique se todo o script executa sem erros antes de enviar.
