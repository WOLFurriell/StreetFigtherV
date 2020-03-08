# Web Scrapping, Image-Processing and Data Visualization of Street Figther V 

I love Street Figther and currently I have a ideia to make some analisys with the information of this game, so I used data of the two official sites, your linksare here:

https://streetfighter.com/characters/

https://game.capcom.com/cfn/sfv/character/

To get the data I used techniques of Web Scrapping and Image-Processing, let's see an example of how this was done.
First of all I listed links of characters data, in the total there are 40 figthers in recent game, after that I used the list of characters in a loop to get the images from the site. Basically the image contain height, weight in text and a bar plot to represent range, power, health, mobility, techniques and range below we have a example:

<img align="center" width="500" height="300" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/04.auxiliar/akuma_exemplo.jpg">

With the packages imager I got select and extract the text of image and the size of each bar of the bar plot, to do that I use the functions highlight and isoblur, the code can be seen here

[script](https://github.com/WOLFurriell/StreetFigtherV/blob/master/pgms%20-GIT/02.Tratamento_Imagens.R)
