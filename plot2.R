file_name = "FNEI_data/summarySCC_PM25.rds"
NEI <- readRDS(file_name)

baltimore = NEI[NEI$fips  == '24510',]

png('plot2.png', width = 480, height = 480)

barplot(
  baltimore$Emissions,
  names.arg = baltimore$year,
  xlab = "Year",
  ylab = "PM2.5 Emissions (Tons)",
  main = "Total PM2.5 Emissions From All Baltimore Sources"
)
dev.off()
