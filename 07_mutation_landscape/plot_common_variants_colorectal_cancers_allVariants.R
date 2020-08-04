library(VennDiagram)

# Change to your working directory, this is where the figure will be saved
setwd("/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/")

colorectal_1 = read.table("colorectal_1.VarScan_variants_filter.pass")
colorectal_2 = read.table("colorectal_2.VarScan_variants_filter.pass")

colorectal_1[,24] = paste(colorectal_1[,1], colorectal_1[,2], sep="_")
colorectal_2[,24] = paste(colorectal_2[,1], colorectal_2[,2], sep="_")

venn.plot <- venn.diagram(
  x = list("Colorectal \n 2015" = colorectal_1[,24], "Colorectal \n 2018" = colorectal_2[,24]),
  filename = "/data/kander22/LynchSyndrome/07_mutation_landscape/results/compare_colorectal1_colorectal2_all_variants.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA),
  main.pos = c(0.5, 0.5),
  cex = 2,
  cat.cex = 1.5,
  cat.fontface = "bold",
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(180, 180),
  cat.dist = c(0.05,0.02),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  inverted = FALSE,
  height = 4.5, width = 5.5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot

# -------------------------
# Filter by af at least 25%
# -------------------------
colorectal_1[,25] = as.numeric(sub("%", "", colorectal_1[,11]))
colorectal_2[,25] = as.numeric(sub("%", "", colorectal_2[,11]))

colorectal_1_filter = subset(colorectal_1, colorectal_1[,25] >= 25)
colorectal_2_filter = subset(colorectal_2, colorectal_2[,25] >= 25)

# save to a file
write.table(colorectal_1_filter, "colorectal_1.VarScan_variants_filter.pass.filtered_by_af_25", quote = F, row.names = F, col.names = F, sep = "\t")
write.table(colorectal_2_filter, "colorectal_2.VarScan_variants_filter.pass.filtered_by_af_25", quote = F, row.names = F, col.names = F, sep = "\t")


venn.plot <- venn.diagram(
  x = list("Colorectal 2015" = colorectal_1_filter[,24], "Colorectal 2018" = colorectal_2_filter[,24]),
  filename = "/data/kander22/LynchSyndrome/07_mutation_landscape/results/compare_colorectal1_colorectal2_variants_filtered_by_af_25.png",
  scaled = TRUE,
  col = "transparent",
  fill = c("dodgerblue3", "springgreen2"),
  main.pos = c(0.5, 1.05),
  cex = 1,
  cat.cex = 1,
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(180,180),
  cat.dist = c(0.03,0.03),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  inverted = FALSE,
  height = 4, width = 5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot

# Filter by af at least 50%
colorectal_1[,25] = as.numeric(sub("%", "", colorectal_1[,11]))
colorectal_2[,25] = as.numeric(sub("%", "", colorectal_2[,11]))

colorectal_1_filter = subset(colorectal_1, colorectal_1[,25] >= 50)
colorectal_2_filter = subset(colorectal_2, colorectal_2[,25] >= 50)

venn.plot <- venn.diagram(
  x = list("Colorectal 2015" = colorectal_1_filter[,24], "Colorectal 2018" = colorectal_2_filter[,24]),
  filename = "/data/kander22/LynchSyndrome/07_mutation_landscape/results/compare_colorectal1_colorectal2_variants_filtered_by_af_50.png",
  scaled = TRUE,
  col = "transparent",
  fill = c("dodgerblue3", "springgreen2"),
  main.pos = c(0.5, 1.05),
  cex = 1,
  cat.cex = 1,
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(180,180),
  cat.dist = c(0.03,0.03),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  inverted = FALSE,
  height = 4, width = 5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot


