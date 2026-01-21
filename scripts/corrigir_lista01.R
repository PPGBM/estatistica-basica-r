# =========================================================
# Correção automática – Lista 01
# Estatística Básica utilizando R
# =========================================================

# Pasta com os envios
pasta_envios <- "submissoes/lista01"

# Arquivos .R enviados
arquivos <- list.files(
  pasta_envios,
  pattern = "\\.R$",
  full.names = TRUE
)

if (length(arquivos) == 0) {
  stop("Nenhum arquivo encontrado para correção.")
}

# Resultados da correção
resultados <- list()

# ---------------------------------------------------------
# Função de correção individual
# ---------------------------------------------------------
corrigir_arquivo <- function(arquivo) {
  
  ambiente <- new.env()
  
  erros_execucao <- FALSE
  mensagem_erro <- NA
  
  tryCatch(
    sys.source(arquivo, envir = ambiente),
    error = function(e) {
      erros_execucao <<- TRUE
      mensagem_erro <<- e$message
    }
  )
  
  nota <- 0
  feedback <- c()
  
  # Se não rodou, nota zero
  if (erros_execucao) {
    return(data.frame(
      arquivo = basename(arquivo),
      nota = 0,
      feedback = paste("Erro de execução:", mensagem_erro)
    ))
  }
  
  # -----------------------------------------------------
  # Questão 1 – Estrutura dos dados
  # -----------------------------------------------------
  if (exists("n_linhas", envir = ambiente) &&
      exists("n_colunas", envir = ambiente)) {
    
    if (ambiente$n_linhas == nrow(iris) &&
        ambiente$n_colunas == ncol(iris)) {
      nota <- nota + 1
    } else {
      feedback <- c(feedback, "Q1: número de linhas/colunas incorreto.")
    }
    
  } else {
    feedback <- c(feedback, "Q1: objetos n_linhas ou n_colunas ausentes.")
  }
  
  # -----------------------------------------------------
  # Questão 2 – Classes
  # -----------------------------------------------------
  if (exists("classe_dados", envir = ambiente)) {
    if (ambiente$classe_dados == "data.frame") {
      nota <- nota + 1
    } else {
      feedback <- c(feedback, "Q2a: classe de 'dados' incorreta.")
    }
  } else {
    feedback <- c(feedback, "Q2a: objeto classe_dados ausente.")
  }
  
  if (exists("classe_species", envir = ambiente)) {
    if (ambiente$classe_species %in% c("factor", "character")) {
      nota <- nota + 1
    } else {
      feedback <- c(feedback, "Q2b: classe de Species incorreta.")
    }
  } else {
    feedback <- c(feedback, "Q2b: objeto classe_species ausente.")
  }
  
  # -----------------------------------------------------
  # Questão 3 – Estatística descritiva
  # -----------------------------------------------------
  if (exists("media_sepala", envir = ambiente) &&
      is.numeric(ambiente$media_sepala)) {
    
    if (abs(ambiente$media_sepala - mean(iris$Sepal.Length)) < 0.01) {
      nota <- nota + 1
    } else {
      feedback <- c(feedback, "Q3a: média incorreta.")
    }
    
  } else {
    feedback <- c(feedback, "Q3a: média ausente ou não numérica.")
  }
  
  if (exists("mediana_sepala", envir = ambiente) &&
      is.numeric(ambiente$mediana_sepala)) {
    
    if (ambiente$mediana_sepala == median(iris$Sepal.Length)) {
      nota <- nota + 1
    } else {
      feedback <- c(feedback, "Q3b: mediana incorreta.")
    }
    
  } else {
    feedback <- c(feedback, "Q3b: mediana ausente ou não numérica.")
  }
  
  if (exists("dp_sepala", envir = ambiente) &&
      is.numeric(ambiente$dp_sepala)) {
    
    if (abs(ambiente$dp_sepala - sd(iris$Sepal.Length)) < 0.01) {
      nota <- nota + 1
    } else {
      feedback <- c(feedback, "Q3c: desvio padrão incorreto.")
    }
    
  } else {
    feedback <- c(feedback, "Q3c: desvio padrão ausente ou não numérico.")
  }
  
  # -----------------------------------------------------
  # Questão 4 – Interpretação
  # -----------------------------------------------------
  if (exists("interpretacao_q4", envir = ambiente)) {
    if (nchar(ambiente$interpretacao_q4) > 30) {
      nota <- nota + 1
    } else {
      feedback <- c(feedback, "Q4: interpretação muito curta.")
    }
  } else {
    feedback <- c(feedback, "Q4: resposta ausente.")
  }
  
  # -----------------------------------------------------
  # Questão 6 – Resumo
  # -----------------------------------------------------
  if (exists("resumo_sepala", envir = ambiente)) {
    nota <- nota + 1
  } else {
    feedback <- c(feedback, "Q6: objeto resumo_sepala ausente.")
  }
  
  # -----------------------------------------------------
  # Resultado final
  # -----------------------------------------------------
  data.frame(
    arquivo = basename(arquivo),
    nota = nota,
    feedback = ifelse(
      length(feedback) == 0,
      "Parabéns! Todos os itens avaliados automaticamente estão corretos.",
      paste(feedback, collapse = " | ")
    )
  )
}

# ---------------------------------------------------------
# Corrigir todos os arquivos
# ---------------------------------------------------------
for (arq in arquivos) {
  resultados[[arq]] <- corrigir_arquivo(arq)
}

resultado_final <- do.call(rbind, resultados)

# Salvar relatório
dir.create("resultados", showWarnings = FALSE)

write.csv(
  resultado_final,
  file = "resultados/resultado_lista01.csv",
  row.names = FALSE
)

print(resultado_final)
