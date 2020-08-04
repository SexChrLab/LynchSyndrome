library(VennDiagram)

# Change to your working directory, this is where the figure will be saved
setwd("/data/kander22/LynchSyndrome/07_mutation_landscape/")

breast_1 = read.table("/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/breast_biopsy_1.VarScan_variants_filter.pass")
breast_2 = read.table("/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/breast_biopsy_2.VarScan_variants_filter.pass")
breast_3 = read.table("/data/kander22/LynchSyndrome/02_neoepitope/intermediate_files/breast_biopsy_3.VarScan_variants_filter.pass")

breast_1[,24] = paste(breast_1[,1], breast_1[,2], sep="_")
breast_2[,24] = paste(breast_2[,1], breast_2[,2], sep="_")
breast_3[,24] = paste(breast_3[,1], breast_3[,2], sep="_")

venn.plot <- venn.diagram(
  x = list("Biopsy 1" = breast_1[,24], "Biopsy 2" = breast_2[,24], "Biopsy 3" = breast_3[,24]),
  filename = "/data/kander22/LynchSyndrome/07_mutation_landscape/results/compare_tnbc_all_variants.png",
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

# -------------------------
# Filter by af at least 25%
# -------------------------
breast_1[,25] = as.numeric(sub("%", "", breast_1[,11]))
breast_2[,25] = as.numeric(sub("%", "", breast_2[,11]))
breast_3[,25] = as.numeric(sub("%", "", breast_3[,11]))

breast_1_filter = subset(breast_1, breast_1[,25] >= 25)
breast_2_filter = subset(breast_2, breast_2[,25] >= 25)
breast_3_filter = subset(breast_3, breast_3[,25] >= 25)

venn.plot <- venn.diagram(
  x = list("Biopsy 1" = breast_1_filter[,24], "Biopsy 2" = breast_2_filter[,24], "Biopsy 3" = breast_3_filter[,24]),
  filename = "/data/kander22/LynchSyndrome/07_mutation_landscape/results/compare_tnbc_all_variants_filtered_by_af_25.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA, NA),
  main.pos = c(0.5, 0.5, 0.5),
  cex = 1,
  cat.cex = 1,
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(0, 0, 0),
  cat.dist = c(0.03,0.03, 0.01),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  inverted = FALSE,
  height = 4, width = 5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot

# -------------------------
# Filter by af at least 50%
# -------------------------
breast_1[,25] = as.numeric(sub("%", "", breast_1[,11]))
breast_2[,25] = as.numeric(sub("%", "", breast_2[,11]))
breast_3[,25] = as.numeric(sub("%", "", breast_3[,11]))

breast_1_filter = subset(breast_1, breast_1[,25] >= 50)
breast_2_filter = subset(breast_2, breast_2[,25] >= 50)
breast_3_filter = subset(breast_3, breast_3[,25] >= 50)

venn.plot <- venn.diagram(
  x = list("Biopsy 1" = breast_1_filter[,24], "Biopsy 2" = breast_2_filter[,24], "Biopsy 3" = breast_3_filter[,24]),
  filename = "/data/kander22/LynchSyndrome/07_mutation_landscape/results/compare_tnbc_all_variants_filtered_by_af_50.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA, NA),
  main.pos = c(0.5, 0.5, 0.5),
  cex = 1,
  cat.cex = 1,
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(0, 0, 0),
  cat.dist = c(0.03,0.03, 0.01),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  inverted = FALSE,
  height = 4, width = 5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot