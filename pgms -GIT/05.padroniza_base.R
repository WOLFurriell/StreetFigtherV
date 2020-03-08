
rm(list = ls())

source("E:/Projetos R/Street Figther/pgms -GIT/00.Libname.R")

# --------------------------------------------------------------------------------
# --- Padronizacao da base  ---------------------------------------
# --------------------------------------------------------------------------------

street_base <- read.table("E:\\Projetos R\\Street Figther\\bases\\db_street_final.csv",sep = ";",
                            header = T)
names(street_base)

# --------------------------------------------------------------------------------
# Funcoes de padronizacao 

#Maior melhor
minmax <- function(x){
(x - min(x,na.rm = T))/(max(x,na.rm = T)-min(x,na.rm = T))
}

#Menor melhor
maxmin <- function(x){
(x - max(x,na.rm = T))/(min(x,na.rm = T)-max(x,na.rm = T))
}

# --------------------------------------------------------------------------------

street_base_pad         <- apply(street_base[c(3:9,11:14,16:17)],2, minmax) %>% as.data.frame()
street_base_pad$RankUso <- maxmin(street_base$RankUso) %>% as.vector()
street_base_pad$Sexo    <- street_base$Sexo
street_base_pad$nomes   <- street_base$nomes
street_base_pad$hero    <- street_base$hero
street_base_pad$nomes2  <- street_base$nomes2

names(street_base_pad)
str(street_base_pad)


#--------------------------------------------------------------------------------------
# Retirando apenas as numéricas

nums <- unlist(lapply(street_base, is.numeric))

street_base_num <- street_base[ , nums]
street_base_num <- street_base_num[,-15]

