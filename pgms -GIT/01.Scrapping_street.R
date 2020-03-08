
# --------------------------------------------------------------------------------
# --- Scrapping para listagem de lutadores ---------------------------------------
# --------------------------------------------------------------------------------

rm(list=ls())

# Libs
source("E:/Projetos R/Street Figther/pgms -GIT/00.Libname.R")

#----------------------------------------------------------------------------------
# Listando as URL do site official 
url     <- "https://streetfighter.com/characters"
html    <- paste(readLines(url), collapse="\n")
matched <- str_match_all(html, "<a href=\"(.*?)\"")
links   <- matched[[1]][, 2]

#----------------------------------------------------------------------------------
# Pegabdo os nomes
nomes <- links %>% qdapRegex::ex_between("https://streetfighter.com/characters/", "/") %>% unlist() %>% na.omit %>% as.vector
nomes <- nomes %>% unique %>% str_replace_all( "-", replacement = "")

#----------------------------------------------------------------------------------
# Atribuindo sexo
sexo <- c("M",  "F",  "M",  "M",  "F",  "M",  "M",  "M",  "M",  "F",  "M",  "M",  "M",  "F",
  "M",  "M",  "M",  "M",  "M",  "M",  "F",  "M",  "M",  "M",  "M",  "F",  "F",  "M",  "F",  "M", 
  "F",  "M",  "M",  "M",  "M",  "M",  "F", "F",  "M",  "NG"  )

cbind(sexo,nomes)

nomes2 <- nomes
nomes3 <- nomes
nomes2[nomes2 == "chunli"] <- "chun-li"

nomes <- subset(nomes, nomes != "kolin" & nomes != "gill" & nomes != "seth")

#----------------------------------------------------------------------------------

