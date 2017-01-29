library(ggplot2)

nei_file_name = "FNEI_data/summarySCC_PM25.rds"
scc_file_name = "FNEI_data/summarySCC_PM25.rds"
NEI <- readRDS(nei_file_name)
SCC <- readRDS(scc_file_name)

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]
baltimore <- vehicles_NEI[vehicles_NEI$fips == "24510",]
baltimore$city <- "Baltimore City"

losangeles <- vehicles_NEI[vehicles_NEI$fips == "06037",]
losangeles$city <- "Los Angeles County"
both_cities <- rbind(baltimore, losangeles)

png('plot6.png', width = 480, height = 480, bg = 'transparent')

plt <- ggplot(both_cities, aes(x = factor(year), y = Emissions, fill = city)) +
  geom_bar(aes(fill = year), stat = "identity") +
  facet_grid(scales="free", space="free", .~city) +
  theme_bw() +
  labs(x = "year", y = expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) +
  ggtitle(expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(plt)
dev.off()
