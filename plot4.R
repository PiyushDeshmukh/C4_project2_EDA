library(ggplot2)

nei_file_name = "FNEI_data/summarySCC_PM25.rds"
scc_file_name = "FNEI_data/summarySCC_PM25.rds"
NEI <- readRDS(nei_file_name)
SCC <- readRDS(scc_file_name)

combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
coal_combustion <- (combustion & coal)
combustion_SCC <- SCC[coal_combustion,]$SCC
combustion_NEI <- NEI[NEI$SCC %in% combustion_SCC,]

png('plot4.png', width = 480, height = 480)

plt <- ggplot(combustion_NEI, aes(factor(year), Emissions/10^5)) +
  geom_bar(stat = "identity", fill = "grey", width = 1) +
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (10^5 tons)")) +
  ggtitle(expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(plt)

print(plt)
dev.off()
