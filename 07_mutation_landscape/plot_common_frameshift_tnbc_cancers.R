library(VennDiagram)

setwd("/data/kander22/LynchSyndrome/07_mutation_landscape/results/")

#
breast_biopsy_1 = read.table("breast_biopsy_1.VarScan.indel.Somatic.hc.frameshift")
breast_biopsy_2 = read.table("breast_biopsy_2.VarScan.indel.Somatic.hc.frameshift")
breast_biopsy_3 = read.table("breast_biopsy_3.VarScan.indel.Somatic.hc.frameshift")

# 
breast_biopsy_1[,4] = paste(breast_biopsy_1[,1], breast_biopsy_1[,2], sep="_")
breast_biopsy_2[,4] = paste(breast_biopsy_2[,1], breast_biopsy_2[,2], sep="_")
breast_biopsy_3[,4] = paste(breast_biopsy_3[,1], breast_biopsy_3[,2], sep="_")

venn.plot <- venn.diagram(
  x = list("Biopsy 1" = breast_biopsy_1[,4], "Biopsy 2" = breast_biopsy_2[,4], "Biopsy 3" = breast_biopsy_3[,4]),
  filename = "compare_tnbc_frameshift.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA, NA),
  main.pos = c(0.5, 0.5, 0.5),
  cex = 2,
  cat.cex = 1.5,
  cat.fontface = "bold",
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(0, 0, 180),
  cat.dist = c(0.05,0.05, 0.05),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  inverted = FALSE,
  height = 4, width = 5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot