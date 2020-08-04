library(VennDiagram)

setwd("/data/kander22/LynchSyndrome/06_neoepitope_landscape/")

# -------
# hla_a_1
# -------

# binding between peptides and HLA is less than 500nM
breast_1 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_1/IEDB_out/hla_a_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
breast_2 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_2/IEDB_out/hla_a_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
breast_3 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_3/IEDB_out/hla_a_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")

breast_1_vector = breast_1[,2]
breast_2_vector = breast_2[,2]
breast_3_vector = breast_3[,2]

venn.plot <- venn.diagram(
  x = list("Biopsy 1" = breast_1_vector, "Biopsy 2" = breast_2_vector, "Biopsy 3" = breast_3_vector),
  filename = "common_neoepitopes_tnbc_cancers_venn_hlaa1.png",
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
  sub = "HLA-A*24:02",
  sub.cex = 2,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.1),
  inverted = FALSE,
  height = 4, width = 5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot

# -------
# hla_b_1
# -------

# binding between peptides and HLA is less than 500nM
breast_1 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_1/IEDB_out/hla_b_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
breast_2 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_2/IEDB_out/hla_b_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
breast_3 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_3/IEDB_out/hla_b_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")

breast_1_vector = breast_1[,2]
breast_2_vector = breast_2[,2]
breast_3_vector = breast_3[,2]

venn.plot <- venn.diagram(
  x = list("Biopsy 1" = breast_1_vector, "Biopsy 2" = breast_2_vector, "Biopsy 3" = breast_3_vector),
  filename = "common_neoepitopes_tnbc_cancers_venn_hlab1.png",
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
  sub = "HLA-B*38:01",
  sub.cex = 2,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.1),
  inverted = FALSE,
  height = 4, width = 5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")
venn.plot

# -------
# hla_b_2
# -------

# binding between peptides and HLA is less than 500nM
breast_1 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_1/IEDB_out/hla_b_2/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
breast_2 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_2/IEDB_out/hla_b_2/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
breast_3 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_3/IEDB_out/hla_b_2/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")

breast_1_vector = breast_1[,2]
breast_2_vector = breast_2[,2]
breast_3_vector = breast_3[,2]

venn.plot <- venn.diagram(
  x = list("Biopsy 1" = breast_1_vector, "Biopsy 2" = breast_2_vector, "Biopsy 3" = breast_3_vector),
  filename = "common_neoepitopes_tnbc_cancers_venn_hlab2.png",
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
  sub = "HLA-B*27:05",
  sub.cex = 2,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.1),
  inverted = FALSE,
  height = 4, width = 5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")
venn.plot

# -------
# hla_c_1
# -------

# binding between peptides and HLA is less than 500nM
breast_1 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_1/IEDB_out/hla_c_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
breast_2 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_2/IEDB_out/hla_c_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
breast_3 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/breast_biopsy_3/IEDB_out/hla_c_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")

breast_1_vector = breast_1[,2]
breast_2_vector = breast_2[,2]
breast_3_vector = breast_3[,2]

venn.plot <- venn.diagram(
  x = list("Biopsy 1" = breast_1_vector, "Biopsy 2" = breast_2_vector, "Biopsy 3" = breast_3_vector),
  filename = "common_neoepitopes_tnbc_cancers_venn_hlac1.png",
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
  sub = "HLA-C*12:03",
  sub.cex = 2,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.1),
  inverted = FALSE,
  height = 4, width = 5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot