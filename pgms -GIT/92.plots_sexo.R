
# --------------------------------------------------------------------------------
# --- Analise descritiva criativa ------------------------------------------------
# --------------------------------------------------------------------------------

source("E:/Projetos R/Street Figther/pgms -GIT/00.Libname.R")

# --------------------------------------------------------------------------------

names(street_base)

vars <- c("nomes2", "Sexo",  "Poder",  "Vida",  "Mobilidade", "Tecnica",    
"Area" ,  "Peso", "Altura","Vitalidade" ,"Stun"  , "Nmove",  
"RankCombat" , "ScoreCombat", "RankUso"    , "ScoreUso"  ,  "hero") 

street_base_final1 <- street_base %>% filter(Sexo != "NG") %>% select(vars)
melt_street1       <- melt(street_base_final1, id.vars = c("nomes2","Sexo","hero")) 
colnames(melt_street1)[1] <- "nomes2"

melt_street1$variable <- as.character(levels(melt_street1$variable))[melt_street1$variable]

# --------------------------------------------------------------------------------

table(melt_street1$variable)

melt_street1$variable[melt_street1$variable == "Altura"]      <- "01.Altura"
melt_street1$variable[melt_street1$variable == "Peso"]        <- "02.Peso"

melt_street1$variable[melt_street1$variable == "Area"]        <- "03.Área do ataque"
melt_street1$variable[melt_street1$variable == "Tecnica"]     <- "04.Técnica no combate"
melt_street1$variable[melt_street1$variable == "Mobilidade"]  <- "05.Mobilidade"
melt_street1$variable[melt_street1$variable == "Vida"]        <- "06.Vida"
melt_street1$variable[melt_street1$variable == "Poder"]       <- "07.Poder"

melt_street1$variable[melt_street1$variable == "RankCombat"]  <- "08.Rank dos combates"
melt_street1$variable[melt_street1$variable == "ScoreCombat"] <- "09.Taxa de vitórias"
melt_street1$variable[melt_street1$variable == "ScoreUso"]    <- "10.Freq. de uso"
melt_street1$variable[melt_street1$variable == "RankUso"]     <- "11.Rank do uso"

melt_street1$variable[melt_street1$variable == "Nmove"]       <- "12.N. movimentos"
melt_street1$variable[melt_street1$variable == "Vitalidade"]  <- "13.Barra de vida"
melt_street1$variable[melt_street1$variable == "Stun"]        <- "14.Barra de Stun"

melt_street1$Sexo <- melt_street1$Sexo %>% as.character()
melt_street1$Sexo[melt_street1$Sexo == "F"]  <- "Feminino"
melt_street1$Sexo[melt_street1$Sexo == "M"]  <- "Masculine"

# --------------------------------------------------------------------------------

akuma <- load.image("E:/Projetos R/Street Figther/imagens/akuma_05.jpg")
akuma <- rasterGrob(akuma, interpolate=TRUE)

chunli <- load.image("E:/Projetos R/Street Figther/imagens/Chun_Li1.jpg")
chunli <- rasterGrob(chunli, interpolate=TRUE)

logo   <- load.image("E:/Projetos R/Street Figther/imagens/ce-logo.png")
logo   <- rasterGrob(logo, interpolate=TRUE)

# --------------------------------------------------------------------------------

ggplot(data = melt_street1, aes(x = Sexo, y = value, fill = Sexo, group = Sexo)) +
  geom_boxplot(aes(fill = Sexo),colour = "black") +
  geom_jitter(aes(color = Sexo), position = position_jitter(0.2), alpha = 0.6) +
  scale_fill_manual(values=c("#3333ff","#52527a")) +
  xlab("") + ylab("") +
  scale_colour_manual(values=c("#3333ff","#52527a")) +
  stat_summary(fun.y = median, geom = "point", shape = 23, size = 4, fill = "black", 
               color = "black") +
  facet_wrap(~ variable, scales = "free", ncol = 6) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        strip.background = element_rect(fill="black"),
        strip.text.x = element_text(colour = "white", face="bold"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(t = 0, r = 0, b = 0,l = 0, "cm")) -> p3

lay <- rbind(c(1,1,1,1,1,1,1),
             c(1,1,1,1,1,1,1),
             c(1,1,1,1,1,1,1),
             c(1,1,1,1,1,1,1),
             c(1,1,2,2,4,3,3),
             c(1,1,2,2,4,3,3))
p33 <- grid.arrange(p3, chunli, akuma, logo,layout_matrix = lay);p33

#dir1 <- "E:/Projetos R/Street Figther/Results/genero_street.jpg"
#ggsave(dir1, p33, device = "jpg", width = 30, height = 19, units = "cm", dpi = 500)


# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------




