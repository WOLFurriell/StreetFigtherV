
# --------------------------------------------------------------------------------
# --- Scrapping para listagem de lutadores ---------------------------------------
# --------------------------------------------------------------------------------

source("E:/Projetos R/Street Figther/pgms -GIT/00.Libname.R")

# ---------------------------------------------------------------------------------
# Criando um data frame para os 40 lutadores
street_base2 <- data.frame(matrix(ncol = 9, nrow = 40))
colnames(street_base2) <- c("nomes","nomes2","Vitalidade","Stun","RankCombat","ScoreCombat","RankUso","ScoreUso","Nmove")

# ---------------------------------------------------------------------------------
# Função para executar o scrapping

# Extraindo informacoes adicionais dos lutadores
scrap <- function(url){
  tryCatch(
    url %>%
      read_html() %>% 
      html_nodes("dd") %>% 
      html_text(), 
    error = function(e){NA}    
  )
}

# Extraindo a tabela com os movimentos do lutador
scrap2 <- function(url){
  tryCatch(
    url %>%
      read_html() %>% 
      html_nodes("table") %>% 
      html_table(), 
    error = function(e){NA}   
  )
}

stats2 <- list()

# ---------------------------------------------------------------------------------
# Loop para extracao dos lutadores 

for (i in 1:length(nomes2)){
  
#   i <- 1
#   nomes[i] <- "ryu"      
  
  cat(i,"\n")  
  cat("-------", nomes2[i], "-------","\n")  

  url2    <- "https://game.capcom.com/cfn/sfv/character/XXXXX"
  caminho1 <- str_replace(url2, "XXXXX", nomes2[i])
  caminho1

  url3     <- "https://game.capcom.com/cfn/sfv/character/XXXXX/movelist"
  caminho2 <- str_replace(url3, "XXXXX", nomes2[i])
  caminho2
  
  
stats2 <- scrap(caminho1)
move   <- scrap2(caminho2)
Nmove  <- dim(move[[1]])[1] - 9

# A extracao do Akuma esta com problema, condicao especial para o lutador
  if(i == 23){
    street_base2[i,] <- c(nomes3[i],nomes2[i], "900","900","33", "4.743", "4" ,"5.308%", "32")    
    }else{
      street_base2[i,] <- c(nomes3[i],nomes2[i], stats2, Nmove) 
    }

}

# --------------------------------------------------------------------------------

street_base2$ScoreUso <- street_base2$ScoreUso %>% str_replace_all("[^0-9.-]", "") 

varnames <- c("Vitalidade","Stun","RankCombat","ScoreCombat","RankUso","ScoreUso","Nmove")
street_base2[,varnames] <- data.frame(apply(street_base2[varnames], 2, as.numeric))

street_base_final <- merge(street_base,street_base2,"nomes")

street_base_final$hero <- hero <- c(
  "1",  "1",  "0",  "1",  "0",  "0",  "0",  "0",  "0",  "0",  "1",  "0",
  "1",  "1",  "0",  "1",  "0",  "0",  "1",  "1",  "0",  "0",  "0",  "0",
  "0",  "1",  "1",  "0",  "1",  "1",  "0",  "0",  "0",  "1",  "0",  "1",
  "1",  "1",  "0",  "0")

str(street_base_final)

# --------------------------------------------------------------------------------

street_base_final2 <- street_base_final[,c(1:10,12:19)]
names(street_base_final2)[10] <- "nomes2"
write.table(street_base_final2,"E:\\Projetos R\\Street Figther\\bases\\db_street_final.csv", sep = ";",
              row.names = F)