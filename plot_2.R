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

yEmissions <- with(NEIf,tapply(Emissions,year,sum,na.rm=T))
yearly_emissions <- data.frame(year=yRange,emissions=yEmissions)

png(
  "plot2.png",
  width     = 3.25,
  height    = 3.25,
  units     = "in",
  res       = 1200,
  pointsize = 4
)
barplot(emissions ~ year,data = yearly_emissions, pch=19,xlab = 'Year',ylab = 'Total Emissions'
        ,main = 'Total PM2.5 emission in Baltimore City, Maryland')
dev.off()
