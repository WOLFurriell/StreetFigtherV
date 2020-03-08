
source("E:/Projetos R/Street Figther/pgms -GIT/00.Libname.R")

# --------------------------------------------------------------------------------
# --- Analise descritiva criativa ------------------------------------------------
# --------------------------------------------------------------------------------

# Criando a função do donut plot
donutgraph   <- function(banco,legenda){
  nome       <- as.data.frame(table(banco))
  nome$fraction <- nome$Freq / sum(nome$Freq)
  nome       <- nome[order(nome$fraction), ]
  nome$ymax  <- cumsum(nome$fraction)
  nome$ymin  <- c(0, head(nome$ymax, n=-1))

  nome$label <- legenda
    
  gnome <- ggplot(nome, aes(fill=banco, ymax=ymax, ymin=ymin, xmax=2, xmin=4)) +
    geom_rect(colour="black") +
    coord_polar(theta="y") +
    xlim(c(-2, 4)) +
    theme_bw() +
    facet_grid( . ~ label) +
    scale_fill_manual(values=c("#3E4A89FF","#1F9E89"), name = legenda) +
    geom_label(aes(label=paste(round(fraction,3)*100,"%"), x = 1.5,
                   y=(ymin+ymax)/2),inherit.aes = TRUE, 
               show.legend = FALSE, size = 4,color = "white") +
    ylab("") + xlab("") +
    theme(panel.border = element_blank(),
          strip.background = element_rect(fill="black"),
          strip.text = element_text(size=15, colour="white"),
          panel.grid=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank()) 
  gnome

}



# -----------------------------------------------------------------
# Chamando a função

# Sexo ------------------------------------------------------------

street_base$Sexo2[street_base$Sexo == "F" ] <- "Feminino"
street_base$Sexo2[street_base$Sexo  == "M" ] <- "Masculino"
street_base$Sexo2[street_base$Sexo  == "NG"] <- NA

banco1 <- street_base$Sexo2

legenda1<-"Sexo"

donut_sexo <- donutgraph(banco1,legenda1)
donut_sexo

# -----------------------------------------------------------------
# Posição ------------------------------------------------------------

street_base$hero2[street_base$hero == 1 ] <- "Vil?es    "
street_base$hero2[street_base$hero == 0 ] <- "Her?is    "

banco2   <- street_base$hero2

legenda2 <-"Posi??o"

donut_hero <- donutgraph(banco2,legenda2)
donut_hero