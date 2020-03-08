
# --------------------------------------------------------------------------------
# --- Analise descritiva criativa ------------------------------------------------
# --------------------------------------------------------------------------------


# Criando função para os barplots
barras <-  function(var,label){

street_base$label <- label
  
ggplot(street_base, aes(x = factor(var))) +
  geom_bar(stat = "count", fill = "#3E4A89FF", color = "black") +
  ylab("") + xlab(label) +
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

label1 <- "Poder"
Poder  <- barras(street_base$Poder,label1);Poder

label2 <- "Vida"
Vida   <- barras(street_base$Vida,label2)

label3     <- "Mobilidade"
Mobilidade <- barras(street_base$Mobilidade,label3)

label4  <- "T?cnica no combate"
Tecnica <- barras(street_base$Tecnica,label4)

label5 <- "?rea do ataque"
Area   <- barras(street_base$Area,label5)
