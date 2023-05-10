# Assignment 

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999--2008. You may use any R package you want to support your analysis.

# Questions

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

![Code](plot_1.R)
![Plot_1](plot_1.PNG)

## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland ( fips == "24510" fips == "24510") from 1999 to 2008? 
Use the base plotting system to make a plot answering this question.

![Code](plot_2.R)
![Plot_2](plot_2.PNG)

## Of the four types of sources indicated by the type type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999--2008 for Baltimore City? Which have seen increases in emissions from 1999--2008? 
Use the ggplot2 plotting system to make a plot answer this question.

![Code](plot_3.R)
![Plot_3](plot_3.PNG)

## Across the United States, how have emissions from coal combustion-related sources changed from 1999--2008?

![Code](plot_4.R)
![Plot_4](plot_4.PNG)

## How have emissions from motor vehicle sources changed from 1999--2008 in Baltimore City?

![Code](plot_5.R)
![Plot_5](plot_5.PNG)

## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037" fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

![Code](plot_6.R)
![Plot_6](plot_6.PNG)