library(VennDiagram)

setwd("/data/kander22/LynchSyndrome/07_mutation_landscape/results/")

# 
tnbc = read.table("tnbc_snp_positions_allVariants.txt")
renal = read.table("renal_snp_positions_allVariants.txt")
colorectal_1 = read.table("colorectal_1_snp_positions_allVariants.txt")
colorectal_2 = read.table("colorectal_2_snp_positions_allVariants.txt")


tnbc_vector = tnbc[,1]
renal_vector = renal[,1]
colorectal_1_vector = colorectal_1[,1]
colorectal_2_vector = colorectal_2[,1]

venn.plot <- venn.diagram(
  x = list("Renal" = renal_vector, "Colorectal\n2015" = colorectal_1_vector, "Colorectal\n2018" = colorectal_2_vector, "TNBC" = tnbc_vector),
  filename = "common_variants_four_cancers_allVariants_venn.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA, NA, NA),
  main.pos = c(0.5, 0.1, 0.1, 0.3),
  cex = 1.5,
  cat.cex = 1,
  cat.col = "black",
  main.cex = 2,
  cat.default.pos = "outer",
  # cat.pos = c(0, 0, 90, 90),
  # cat.dist = c(0.25,0.25,0.25, 0.25),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  sub = "Overlap in somatic SNVs",
  sub.cex = 1.5,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.05),
  inverted = FALSE,
  height = 3.5, width = 4.7, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot