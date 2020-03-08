
# --------------------------------------------------------------------------------
# --- Analise descritiva criativa ------------------------------------------------
# --------------------------------------------------------------------------------

source("E:/Projetos R/Street Figther/pgms -GIT/00.Libname.R")

# --------------------------------------------------------------------------------

# Função para o histograma
hist <-  function(var,label,bin){
  
  street_base$label <- label
  
  ggplot(street_base, aes(x = var)) +
    geom_histogram(binwidth = bin, fill = "#1F9E89", color = "black") +
    ylab("") + xlab("") +
    facet_grid( . ~ label) +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank(),
          strip.background = element_rect(fill="black"),
          strip.text = element_text(size=15, colour="white"),
          axis.line = element_line(size = 1, colour = "grey80"),
          plot.margin = margin(t = 0, r = 0, b = 0,l = 0, "cm")) 
}

# --------------------------------------------------------------------------------
# Chamando as funções

label1 <- "Peso"
Peso <- hist(street_base$Peso,label1, 20);Peso

label2 <- "Altura"
Altura <- hist(street_base$Altura,label2, 10)

label3     <- "Barra de vida"
Vitalidade <- hist(street_base$Vitalidade,label3,20)

label4 <- "Res. Stun"
Stun   <- hist(street_base$Stun,label4, 20)

label5      <- "Taxa de vit?rias"
ScoreCombat <- hist(street_base$ScoreCombat,label5, 0.1)

label6   <- "Freq. de uso"
ScoreUso <- hist(street_base$ScoreUso,label6, 0.9)

label7 <- "N? Movimentos"
Nmove  <- hist(street_base$Nmove,label7, 2)

