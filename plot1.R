file_name = "FNEI_data/summarySCC_PM25.rds"
NEI <- readRDS(file_name)
data <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png', width = 480, height = 480)

barplot(
  (data$Emissions)/10^6,
  names.arg = data$year,
  xlab = "Year",
  ylab = "PM2.5 Emissions (10^6 Tons)",
  main = "Total PM2.5 Emissions From All US Sources"
)
dev.off()
