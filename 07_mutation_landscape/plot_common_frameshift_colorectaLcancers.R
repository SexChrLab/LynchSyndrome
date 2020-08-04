library(VennDiagram)

setwd("/data/kander22/LynchSyndrome/07_mutation_landscape/results/")

#
colorectal_1 = read.table("colorectal_1.VarScan.indel.Somatic.hc.frameshift")
colorectal_2 = read.table("colorectal_2.VarScan.indel.Somatic.hc.frameshift")

# 
colorectal_1[,4] = paste(colorectal_1[,1], colorectal_1[,2], sep="_")
colorectal_2[,4] = paste(colorectal_2[,1], colorectal_2[,2], sep="_")

venn.plot <- venn.diagram(
  x = list("Colorectal \n 2015" = colorectal_1[,4], "Colorectal \n 2018" = colorectal_2[,4]),
  filename = "compare_colorectal_frameshift.png",
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