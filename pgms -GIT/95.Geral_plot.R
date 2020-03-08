
source("E:/Projetos R/Street Figther/pgms -GIT/00.Libname.R")

# --------------------------------------------------------------------------------
# --- Analise descritiva criativa ------------------------------------------------
# --------------------------------------------------------------------------------

fig1 <- load.image("E:/Projetos R/Street Figther/imagens/all_street.jpg")
fig1 <- rasterGrob(fig1, interpolate=TRUE)

# --------------------------------------------------------------------------------

lay <- rbind(c(1, 2, 3, 4 ),
             c(5, 6, 7, 8 ),
             c(9, 10,11,12),
             c(13,14,15,15))

mixplot <- grid.arrange(
Poder,
Vida,
Mobilidade,
Tecnica,
Area,
Peso,
Altura,
Vitalidade,
Stun,
ScoreCombat,
ScoreUso,
Nmove, 
donut_sexo,
donut_hero,
fig1,
layout_matrix = lay)

#dir1 <- "E:/Projetos R/Street Figther/Results/mixplot.jpg"
#ggsave(dir1, mixplot, device = "jpg", width = 35, height = 25, units = "cm", dpi = 500)
