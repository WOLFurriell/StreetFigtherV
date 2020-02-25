
#https://dahtah.github.io/imager/imager.html
#https://cran.r-project.org/web/packages/imager/vignettes/pixsets.html

# Utilizamos a estatístico e o Machine Learning para resolver os problemas do nosso dia-a-dia
# no trabalho, e sabemos que nem sempre são problemas interessantes e motivadores.
# Então, nada melhor do que fazer um estudo com base em um hobby, para nos relembrar,
# O quão maravilhosa é essa ciência

# --------------------------------------------------------------------------------
# --- Tratamento das imagens -----------------------------------------------------
# --------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
library(imager)
library(dplyr)
library(tesseract)
library(magick)

# ---------------------------------------------------------------------------------
# Criando um data frame para os 40 lutadores
street_base <- data.frame(matrix(ncol = 9, nrow = 40))
colnames(street_base) <- c("nomes","Sexo","Poder", "Vida", "Mobilidade","Tecnica", "Area","Peso","Altura")

# ---------------------------------------------------------------------------------
# Logica extracao

for (i in 1:37){

#  i <- 22
#  nomes[i] <- "urien"    

  cat(i,"\n")  
  cat("-------", nomes[i], "-------","\n")
  
  if (i < 17){ 
  
      url1    <- "https://streetfighter.com/wp-content/uploads/2017/02/vine-XXXXX.jpg"
      caminho <- str_replace(url1, "XXXXX", nomes[i])
      caminho
      
      # ---------------------------------------------------------------------------------
      # Import a imagem em tons de cinza
      im <- load.image(caminho) %>% grayscale
      im <- resize(im,size_x = 500, size_y = 500)
      im3 <-  imsub(im,  y > 324 & y < 344, x < 415 & x > 220) 
      
      
      }else if (i >= 17 & i <= 22){
        
        dir    <- "E:/Projetos R/Street Figther/imagens/XXXXX.jpg"
        caminho <- str_replace(dir, "XXXXX", nomes[i])
        caminho
        
        # ---------------------------------------------------------------------------------
        # Import a imagem em tons de cinza
        im <- load.image(caminho) %>% grayscale
        im <- resize(im,size_x = 500, size_y = 500)
        im3 <-  imsub(im,  y > 324 & y < 344, x < 415 & x > 220) 
        
         }else if (i > 22){
            
            dir    <- "E:/Projetos R/Street Figther/imagens/XXXXX.jpg"
            caminho <- str_replace(dir, "XXXXX", nomes[i])
            caminho
            
            # ---------------------------------------------------------------------------------
            # Import a imagem em tons de cinza
            imx <- load.image(caminho) %>% grayscale 
            im <- resize(imx,size_x = 500, size_y = 500)

            im3 <-  imsub(imx,  y > 440 & y < 470, x < 560 & x > 320) 
            
          }
  
plot(im)

# ---------------------------------------------------------------------------------
# Recorte do grafico
x1 <- 350
x2 <- 127
y1 <- 415
y2 <- 485       
si <- 1.5

im2 <-  imsub(im,  y > y1 & y < y2, x < x1 & x > x2) 
plot(im2)

# ---------------------------------------------------------------------------------
# Contorna e delimita as barras

px  <- (isoblur(im2, sigma = 1.5)  > .72 )
px %>% plot
barras <- highlight(px,lwd=3)



power_x    <- barras[[1]]$x %>% max %>% round(-1); power_x
power_y    <- barras[[1]]$y %>% max %>% round();   power_y

health_x   <- barras[[2]]$x %>% max %>% round(-1); health_x
health_y   <- barras[[2]]$y %>% max %>% round() ;  health_y

mobility_x <- barras[[3]]$x %>% max %>% round(-1); mobility_x
mobility_y <- barras[[3]]$y %>% max %>% round() ;  mobility_y

techniq_x  <- barras[[4]]$x %>% max %>% round(-1); techniq_x
techniq_y  <- barras[[4]]$y %>% max %>% round();   techniq_y

range_x    <- barras[[5]]$x %>% max %>% round(-1); range_x
range_y    <- barras[[5]]$y %>% max %>% round() ;  range_y


# ---------------------------------------------------------------------------------
# Peso e altura 
# Recorte do grafico

plot(im3)

input <- image_read(im3)
eng   <- tesseract("eng")
text  <- tesseract::ocr(input, engine = eng)
cat(text)
text  <- gsub(" ", "", text, fixed = TRUE)

altura <- text %>% qdapRegex::ex_between("(", "M)WT")
peso   <- text %>% qdapRegex::ex_between("WT", ")") %>% qdapRegex::ex_between("(","K")
peso[[1]]
altura[[1]]

# ---------------------------------------------------------------------------------
# Extrai a pontuaÃ§Ã£o do lutador 
street_base[i,] <- c(nomes[i], sexo[i],
                      power_x, health_x, mobility_x,techniq_x, range_x,
                      peso[[1]],altura[[1]])

}

street_base