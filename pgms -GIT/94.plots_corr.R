

#--------------------------------------------------------------------------------------
# Gráfico com gif 
#--------------------------------------------------------------------------------------

source("E:/Projetos R/Street Figther/pgms -GIT/00.Libname.R")

cor_street_sper <- cor(street_base_num,method = "spearman",use = "complete.obs") %>% round(1)
cor_street_pear <- cor(street_base_num,method = "pearson", use = "complete.obs") %>% round(1)

labels <- c("Poder", "Vida", "Mobilidade", "Técnica", "Área",
            "Peso", "Altura", "Vitalidade", "Res. Stun", "Rank Lutas",
            "Score Lutas", "Rank Uso" , "Score Uso", "N? Movimentos")

colnames(cor_street_sper) <- labels
rownames(cor_street_sper) <- labels

# Pearson
ggcorrplot(cor_street_pear,
           hc.order = TRUE,
           type = "upper",
           outline.color = "white",
           lab = TRUE,
           method = "square")
# Spearman
ggcorrplot(cor_street_sper,
           hc.order = TRUE,
           type = "upper",
           outline.color = "white",
           lab = TRUE,
           method = "square")

# Salvando plot para adicionar gif
fig <- image_graph(width = 600, height = 600, res = 90)
ggcorrplot(cor_street_sper,
           hc.order = TRUE,
           type = "upper",
           outline.color = "white",
           lab = TRUE,
           lab_col = "white",
           colors = viridis(3),
           method = "square",
           legend.title = "Correlação") 
dev.off()

#--------------------------------------------------------------------------------------
# Importando o gif

ken <- image_read("https://cdn.ome.lt/SosEn9mDoyfPwKrc_p7DkVxE7yU=/770x0/smart/uploads/conteudo/fotos/Ken_Shoryuken.gif")
ken <- image_scale(ken, "350")
image_info(ken)

# Atribuindo fps ao gif
animation <- image_animate(ken, fps = 10, optimize = TRUE)

# Combinando o plot e o gif
out_gif_plot <- image_composite(fig, ken, offset = ("+195+190"))

saida_gif <- image_animate(out_gif_plot, fps = 10, optimize = TRUE)

#image_write(saida_gif, "E:\\Projetos R\\Street Figther\\Results\\cor_ken.gif",format = "gif")

