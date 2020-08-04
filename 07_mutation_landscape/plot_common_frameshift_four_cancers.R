library(VennDiagram)

setwd("/data/kander22/LynchSyndrome/07_mutation_landscape/results/")

#
breast_biopsy_1 = read.table("breast_biopsy_1.VarScan.indel.Somatic.hc.frameshift")
breast_biopsy_2 = read.table("breast_biopsy_2.VarScan.indel.Somatic.hc.frameshift")
breast_biopsy_3 = read.table("breast_biopsy_3.VarScan.indel.Somatic.hc.frameshift")
renal = read.table("renal.VarScan.indel.Somatic.hc.frameshift")
colorectal_1 = read.table("colorectal_1.VarScan.indel.Somatic.hc.frameshift")
colorectal_2 = read.table("colorectal_2.VarScan.indel.Somatic.hc.frameshift")

# 
breast_biopsy_1[,4] = paste(breast_biopsy_1[,1], breast_biopsy_1[,2], sep="_")
breast_biopsy_2[,4] = paste(breast_biopsy_2[,1], breast_biopsy_2[,2], sep="_")
breast_biopsy_3[,4] = paste(breast_biopsy_3[,1], breast_biopsy_3[,2], sep="_")
renal[,4] = paste(renal[,1], renal[,2], sep="_")
colorectal_1[,4] = paste(colorectal_1[,1], colorectal_1[,2], sep="_")
colorectal_2[,4] = paste(colorectal_2[,1], colorectal_2[,2], sep="_")

# 
tnbc = rbind(breast_biopsy_1, breast_biopsy_2, breast_biopsy_3)

# 
tnbc_vector = tnbc[,4]
renal_vector = renal[,4]
colorectal_1_vector = colorectal_1[,4]
colorectal_2_vector = colorectal_2[,4]

venn.plot <- venn.diagram(
  x = list("Renal" = renal_vector, "Colorectal\n2015" = colorectal_1_vector, "Colorectal\n2018" = colorectal_2_vector, "TNBC" = tnbc_vector),
  filename = "common_frameshift_four_cancers_allVariants_venn.png",
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
  sub = "Overlap in frameshift mutations",
  sub.cex = 1.5,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.05),
  inverted = FALSE,
  height = 3.5, width = 4.7, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot