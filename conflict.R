#Installing packages and reading the data
library('tidyverse')
library(readr)
OG_data <- read_csv(('data.csv'))
data <- read_csv("data.csv", col_types = cols(best_est. = col_number(), 
                                              year = col_number()))
#Creating my two groups Spain and UK
Spain <- data %>%
  filter(country == 'Spain') %>%
  group_by(year) %>%
    mutate(deaths_per_year = (sum(best_est., na.rm = TRUE)))
UK <- data %>%
  filter(country == 'United Kingdom') %>%
  group_by(year) %>%
  mutate(deaths_per_year = (sum(best_est., na.rm = TRUE)))
#Plotting them seperately
#Spain
ggplot(data = Spain, mapping = aes(x = year, y = deaths_per_year)) + geom_point(mapping = aes(colour = country)) + geom_smooth(method = "lm", se = FALSE)
#UK
ggplot(data = UK, mapping = aes(x = year, y = deaths_per_year)) + geom_point(mapping = aes(colour = country)) + geom_smooth(method = "lm", se = FALSE)


# after civilians die, police are more likely to kill
print(Spain$type_of_violence)
#For spain all observations are of type 1 (state based), except one type 3 (onesided)

#Together
ggplot() +
  geom_point(data = Spain, mapping = aes(x=year, y= deaths_per_year, colour = country)) + 
  geom_point(data = UK, mapping = aes(x=year, y =deaths_per_year, colour = country))  
#Significant???? (YES!!!!!!!!!)
summary(lm(UK$deaths_per_year ~ UK$year))
summary(lm(Spain$deaths_per_year ~ Spain$year))

