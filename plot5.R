library(ggplot2)

nei_file_name = "FNEI_data/summarySCC_PM25.rds"
scc_file_name = "FNEI_data/summarySCC_PM25.rds"
NEI <- readRDS(nei_file_name)
SCC <- readRDS(scc_file_name)

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]
baltimore <- vehicles_NEI[vehicles_NEI$fips=="24510",]

png('plot5.png', width = 480, height = 480, bg = 'transparent')

plt <- ggplot(baltimore, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity", fill = "orange",width=0.75) +
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) +
  ggtitle(expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(plt)
dev.off()
