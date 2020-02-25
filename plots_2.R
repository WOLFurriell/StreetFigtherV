
# --------------------------------------------------------------------------------
# --- Analise descritiva criativa ------------------------------------------------
# --------------------------------------------------------------------------------

library(ggplot2)
library(reshape2)
library(png)
library(grid)
library(magick)
require(gridExtra)

names(street_base)
melt_street <- melt(street_base, id.vars="nomes2") %>% filter(variable %in% c("Poder", "Vida", "Mobilidade", "Tecnica", "Area"))

ken <- load.image("E:/Projetos R/Street Figther/imagens/509568-streetfighter.jpg")
ken <- rasterGrob(ken, interpolate=TRUE)

ryu <- load.image("E:/Projetos R/Street Figther/imagens/ttt-ryu.png")
ryu <- rasterGrob(ryu, interpolate=TRUE)


ggplot(melt_street, aes(x = variable, y = value, fill = variable)) +
  geom_bar(stat ="identity") + xlab("") + ylab("") +
  scale_fill_manual(values=c("#b30000", "#d92b26", "#990052", "#4d0047","#000066"),
                    name="Habilidades de Luta",
                    labels=c("Poder", "Vida", "Mobilidade", "Técnica", "Área")
  ) +
  facet_wrap( ~ nomes2, ncol = 8) + 
  coord_polar() +
  theme(axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        strip.background = element_rect(fill="black"),
        strip.text.x = element_text(colour = "white", face="bold"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(t = 0, r = 0, b = 0,l = 0, "cm")) -> p1

lay <- rbind(c(1,1,1,1,1,3),
             c(1,1,1,1,1,3),
             c(1,1,1,1,1,1),
             c(1,1,1,1,1,2),
             c(1,1,1,1,1,2))
p11 <- grid.arrange(p1, ken, ryu, layout_matrix = lay)

dir1 <- "E:/Projetos R/Street Figther/Results/radar_street.jpg"
#ggsave(dir1, p11, device = "jpg", width = 25, height = 17, units = "cm", dpi = 500)


