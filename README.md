# Web Scrapping, Image-Processing and Data Visualization of Street Figther V

I love Street Figther and currently I have a ideia to make some analisys with the information of this game, so I used data of the two official sites, your linksare here:

https://streetfighter.com/characters/
https://game.capcom.com/cfn/sfv/character/

To get the data I used techniques of Web Scrapping and Image-Processing, let's see an example of how this was done.
First of all I listed links of characters data, in the total there are 40 figthers in recent game, after that I used the list of characters in a loop to get the images from the site. Basically the image contain height, weight in text and a bar plot to represent range, power, health, mobility, techniques and range below we have a example:

<img align="center" width="500" height="300" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/04.auxiliar/akuma_exemplo.jpg">

With the packages imager I got select and extract the text of image and the size of each bar of the bar plot, to do that I use the functions highlight and isoblur, the code can be seen here

[Image extraction](https://github.com/WOLFurriell/StreetFigtherV/blob/master/pgms%20-GIT/02.Tratamento_Imagens.R)

In the second step, I did a simple Web Scrapping using rvest to get some additional information like stun bar, number of moviments present in a table and online rank, we can see an example of the information in the image below highlighted in blue

<img align="center" width="800" height="400" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/04.auxiliar/ex_cammy2.png">

The script of this part is here: [Web Scrapping](https://github.com/WOLFurriell/StreetFigtherV/blob/master/pgms%20-GIT/04.Scrapping_street_2.R)

Lastly some adjustments have been made in the database and to see some aspects of the data I tried to do Street Fighter themed graphics using packages ggplo2 and magick.

The first plot shows the distribution of all variables resulting from extractions

# Plot
<img align="center" width="900" height="610" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/01.plots/mixplot.jpg">

In the next plot I standardized the numeric variables with the function minmax = (x-min(x))/(max(x)-min(x), excluding weight and height and averaged the values to see which character has the highest average benefit.

# Average advantage
<img align="center" width="1000" height="450" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/01.plots/mean_pad.jpg">

How we can see Abigail, Ken, Ryu and Zeku have the highest average, while Dhalsim, Menat and Mika has smaller.

Another interesting graphic is the comparative of the skills of figthers, this allows us to check the balanced characters and those that stand out in certain attributes. 

# Comparative skills of fighters
<img align="center" width="900" height="550" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/01.plots/radar_street.jpg">

ipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litteris

# Plot
<img align="center" width="900" height="550" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/01.plots/heroi_box_street2.jpg">

ipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litteris

# Plot
<img align="center" width="900" height="550" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/01.plots/genero_street.jpg">

ipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litterisipsis litteris

# Plot
<img align="center" width="650" height="650" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/01.plots/cor_ken.gif">
