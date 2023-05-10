library(ggplot2)
library(dplyr)
library(stringr)

sdata <- download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip',destfile = 'dataset/exdata.zip')
unzip('dataset/exdata.zip', exdir = ".", unzip = "internal")

NEI <- readRDS('summarySCC_PM25.rds')
NEI <- transform(NEI,year=as.factor(year))
SCC <- readRDS('Source_Classification_Code.rds')

yRange <- c(1999,2002,2005,2008)

SCCf <- sapply(yRange,function (x,tbl) {
  NEYy <- subset(NEI,year==x)
  SCCy <- unique(NEYy$SCC)
  SCCy
})

SCCi <- Reduce(intersect,SCCf) 

# Opted not to filter SCC present through all the years in the assignment with SCCi
NEIf <- subset(NEI,fips == "24510")

png(
  "plot3.png",
  width     = 20,
  height    = 20,
  units     = "cm",
  res       = 1000,
  pointsize = 3
)
ggplot(NEIf, aes(factor(year), Emissions), fill = type) + 
  geom_bar(stat = "identity") +
  facet_wrap(. ~ type, nrow = 1, ncol = 4) +
  labs(x = "Years",
       y = "Total Emissions",
       title = "Total Emissions in Baltimore City by Source types")
dev.off()
