
require(ggplot2)

file_name = "FNEI_data/summarySCC_PM25.rds"
NEI <- readRDS(file_name)
data <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

png('plot1.png', width=480, height=480)

plot(data$year, data$Emissions, type = "l", main = "Total PM2.5 Emission in the US 1999-2008", xlab = "Year", ylab = "Emissions")
dev.off()
