
# --------------------------------------------------------------------------------
# --- Scrapping para listagem de lutadores ---------------------------------------
# --------------------------------------------------------------------------------

library(XML)
library(devtools)
library(stringr)

# ---------------------------------------------------------------------------------
# Criando um data frame para os 40 lutadores
street_base2 <- data.frame(matrix(ncol = 9, nrow = 40))
colnames(street_base2) <- c("nomes","nomes2","Vitalidade","Stun","RankCombat","ScoreCombat","RankUso","ScoreUso","Nmove")

# ---------------------------------------------------------------------------------
# Função para exutar o scrapping

scrap <- function(url){
  tryCatch(
    url %>%
      read_html() %>% 
      html_nodes("dd") %>% 
      html_text(), 
    error = function(e){NA}    # a function that returns NA regardless of what it's passed
  )
}

scrap2 <- function(url){
  tryCatch(
    url %>%
      read_html() %>% 
      html_nodes("table") %>% 
      html_table(), 
    error = function(e){NA}    # a function that returns NA regardless of what it's passed
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
move  <- scrap2(caminho2)
Nmove <- dim(move[[1]])[1] - 9

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

cbind(street_base_final[,1])



