
source("E:/Projetos R/Street Figther/pgms -GIT/00.Libname.R")

# --------------------------------------------------------------------------------
# --- Média da informações padronizadas ---------------------------------------
# --------------------------------------------------------------------------------

miniaturas <- data.frame(images=list.files("E:/Projetos R/Street Figther/imagens/minis", full.names = T), stringsAsFactors = F)
miniaturas

miniaturas$names <- gsub("[a-zA-Z]|[[:punct:]]","",miniaturas$images)

street_base_num <- street_base_pad[ , nums]

# Retirando peso e altura
street_base_num  <- street_base_num[,-c(4,5,12,13,14)]

street_base_num$RankMean <- apply(street_base_num[,-10], 1, function(x)mean(x,na.rm = T))
street_base_num$nomes    <- street_base$nomes2

# --------------------------------------------------------------------------------
# Visualizando as barras preview

ggplot(street_base_num, aes(x = nomes, y = RankMean)) +
  geom_bar(stat ="identity")
  
img <- load.image(miniaturas$images[1])
g   <-  rasterGrob(img, interpolate = F)
plot(g)

i <- 1
ggplot(street_base_num, aes(x = nomes, y = RankMean)) +
  geom_bar(stat ="identity") +
  annotation_custom(grob = g, xmin = i-0.5, xmax = i+0.5, 
                    ymin = street_base_num$RankMean[i]-0.22, 
                    ymax = street_base_num$RankMean[i]+0.3) 

# --------------------------------------------------------------------------------
# Plot com os parametros iniciais
street_base_num$label <- "Média das informações padronizadas dos lutadores"

plot_fig <- ggplot(street_base_num, aes(x = nomes, y = RankMean)) +
  geom_bar(stat ="identity", color = "black", fill = "#333399") +
  facet_grid( . ~ label) +
  xlab("") + ylab("") +
  scale_y_continuous(breaks = seq(0, 0.7, 0.1),limits = c(0,0.7)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 0.2, size = 12),
        axis.text.y = element_text(size = 12),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        strip.text = element_text(size = 15, colour="white"),
        strip.background = element_rect(fill="black"),
        axis.line = element_line(size = 1, colour = "grey80"),
        plot.margin = margin(t = 0, r = 0, b = 0,l = 0, "cm"));plot_fig

# Loop para inclusão das miniaturas
g <- list()
for(i in 1:nrow(miniaturas)){
  img = load.image(miniaturas$images[i])
  g[[i]] =  rasterGrob(img, interpolate=F)
  
  plot_fig <- plot_fig +
    annotation_custom(grob = g[[i]], xmin = i-0.5, xmax = i+0.5, 
                      ymin = street_base_num$RankMean[i]-0.22, 
                      ymax = street_base_num$RankMean[i]+0.3) 
}

plot_fig

#dir1 <- "E:/Projetos R/Street Figther/Results/mean_pad.jpg"
#ggsave(dir1, plot_fig, device = "jpg", width = 35, height = 19, units = "cm", dpi = 500)
