
# --------------------------------------------------------------------------------
# --- Ajuste da base de entrada --------------------------------------------------
# --------------------------------------------------------------------------------

# lutadores sem informação no site oficial, estas foram retiradas direto do jogo no ps4
street_base[38,] <- c("kolin", "M", 150, 120, 190, 120, 80, 65, 168)
street_base[39,] <- c("gill",  "M", 120, 120, 80, 190, 120, NA, NA)
street_base[40,] <- c("seth", "NG", 120, 120, 120, 190, 150, NA, NA)

# --------------------------------------------------------------------------------
street_base$Altura <- street_base$Altura %>% str_replace_all("[^0-9.-]", "") 
street_base$Peso   <- street_base$Peso   %>% str_replace_all("[^0-9.-]", "") 

# --------------------------------------------------------------------------------
# Corrigindo erros oriundo da extracao das barras na imagem
street_base[street_base==110] <- 120
street_base[street_base==180] <- 190
street_base[street_base==70]  <- 80

street_base[street_base==190] <- 5
street_base[street_base==150] <- 4
street_base[street_base==120] <- 3
street_base[street_base==80]  <- 2
street_base[street_base==40]  <- 1

# --------------------------------------------------------------------------------
# Corrigindo erro da extracao do texto na imagem
street_base$Altura <- ifelse(substr(street_base$Altura,1,1) > "2", paste0("1", street_base$Altura),street_base$Altura) %>% substr(1,3) %>% as.numeric()
street_base$Peso   <- street_base$Peso %>% as.numeric()

# --------------------------------------------------------------------------------
street_base[is.na(street_base)]   <- 0
street_base$Peso[street_base$Peso < 10 | street_base$Peso > 300] <- 0
street_base$Peso[street_base$Peso < 1 & street_base$Sexo=="F"] <- mean(street_base$Peso[street_base$Sexo=="F"],na.rm = T)
street_base$Peso[street_base$Peso < 1 & street_base$Sexo %in% c("M","NG")] <- median(street_base$Peso[street_base$Sexo %in% c("M")],na.rm = T)
street_base$Altura[street_base$Altura < 1 & street_base$Sexo %in% c("M","NG")] <- median(street_base$Altura[street_base$Sexo %in% c("M")],na.rm = T)

# --------------------------------------------------------------------------------
# Colocando letra maiuscula no inicio do nome
UpCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}

street_base$nomes2 <- sapply(street_base$nomes, UpCap) 

# --------------------------------------------------------------------------------
# transformando as variaveis em numericas
varnames <- c("Poder", "Vida", "Mobilidade","Tecnica", "Area")
street_base[,varnames] <- data.frame(apply(street_base[varnames], 2, as.numeric))
