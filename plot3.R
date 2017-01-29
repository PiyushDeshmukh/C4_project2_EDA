library(ggplot2)

nei_file_name = "FNEI_data/summarySCC_PM25.rds"
NEI <- readRDS(nei_file_name)

baltimore = NEI[NEI$fips  == '24510',]

png('plot3.png', width = 1280, height = 720)

plt <- ggplot(baltimore, aes(factor(year), Emissions, fill=type)) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ type) +
  labs(x = "year", y = expression("Total PM"[2.5]*" Emission (Tons)")) +
  ggtitle(expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(plt)
dev.off()
