#load all the necessary packages (you need to install "ggmap" package beforehead)
library(ggmap)
require(ggplot2)


#Attn! To be able to use the ggmap package, you need to obtain a Google API. 
#You can read more about how to do so here: https://github.com/dkahle/ggmap

#"XXX" is the place where you insert your API code for the future Google Maps geocoding
register_google(key = "XXX")


ru <- ggplot2::map_data('world2', 'russia')
class(ru)

#try to built a simple map of Russia
ggplot(ru, aes(x = long, y = lat, group = group)) +
  geom_polygon()

#create a list of all the cities that you want to geolocate 
#(if you do this for Russia, I highly recommend using Cyrillic spelling for the cities' names)
allcities=c("Москва", "Тверь", "Новосибирск")

#launch a geocoding function from ggmap
location=geocode(allcities)

#bind city names with their longitute-latitute locations 
cities=cbind(allcities, location)

#create a map as a ggplot with the cities as points
ggplot() +
  geom_polygon(data=ru, aes(x = long, y = lat, group = group), colour="black", fill='white')+
  geom_point(data = cities, aes(x = lon, y = lat))
  


  
