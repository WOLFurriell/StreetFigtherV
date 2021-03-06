# Web Scrapping, Image Processing and Data Visualization of Street Fighter V

I love Street Fighter and Data Analysis, so I had the idea to combine these two things using data of the two official game websites

source 1: https://streetfighter.com/characters/

source 2: https://game.capcom.com/cfn/sfv/character/

To get the data I used techniques of Web Scrapping and Image-Processing, for a better understanding of the project I will exemplify how the extraction process was done.
First of all I listed the links containing the information of the characters, in total there are 40 figthers in recent game, after that I used the list in a loop to get the images from website. Basically the image contains information about height, weight in text and a bar plot to represent range, power, health, mobility, techniques and range. Below we have a example:

<img align="center" width="500" height="300" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/04.auxiliar/akuma_exemplo.jpg">

With the package "imager" I selected and extracted the text from image and also the size of each bar from graph, to do this I used the functions highlight and isoblur, the code can be seen here: [Image extraction](https://github.com/WOLFurriell/StreetFigtherV/blob/master/pgms%20-GIT/02.Tratamento_Imagens.R)

Secondly, I realized a simple Web Scrapping using "rvest" to get some additional information like stun bar, number of movements (present in a table) and online rank, we can see an example of the information in the image below highlighted in blue

<img align="center" width="800" height="400" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/04.auxiliar/ex_cammy2.png">

The script for this part can be found here: [Web Scrapping](https://github.com/WOLFurriell/StreetFigtherV/blob/master/pgms%20-GIT/04.Scrapping_street_2.R)

Finally, some adjustments were made in the database and to verify the behavior of the data I tried to make Street Fighter themed graphics using packages ggplo2 and magick.

The first plot shows the distribution of all variables resulting from extractions

# Distribution of atributes and skills
<img align="center" width="900" height="610" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/02.plots/mixplot2.jpg">

In the next plot I standardized the numeric variables with the function minmax = (x-min(x))/(max(x)-min(x), excluding weight and height. After that, I averaged the values to see which character has the highest average performance.

# Average advantage
<img align="center" width="1000" height="450" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/02.plots/mean_pad2.jpg">

How we can see Abigail, Ken, Ryu and Zeku have the highest mean, while Dhalsim, Menat and Mika has smaller.

Another interesting plot is the comparative of the figthers skills, this allows us to check the balanced characters and those that stand out in certain attributes. 

# Comparative skills of fighters
<img align="center" width="900" height="550" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/02.plots/radar_street2.jpg">

With the Box-plot we can see some differences between characters considered villains, heroes or neutrals (who have no defined position or have changed sides).

# Comparison between heroes and villains
<img align="center" width="900" height="550" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/02.plots/heroi_box_street3.jpg">

Following the same idea as the previous graph we have a comparison between male and female fighters. 

# Comparison between men and women
<img align="center" width="900" height="550" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/02.plots/genero_street2.jpg">

The last graph shows the correlation between all the variables extracted together with a beautiful Shoryuken.

# Correlation of attributes
<img align="center" width="650" height="650" src="https://github.com/WOLFurriell/StreetFigtherV/blob/master/02.plots/cor_ken2.gif">
