library(VennDiagram)

setwd("/data/kander22/LynchSyndrome/06_neoepitope_landscape/")

# -------
# hla_a_1
# -------

# binding between peptides and HLA is less than 500nM
colorectal_1 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_1/IEDB_out/hla_a_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
colorectal_2 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_2/IEDB_out/hla_a_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")

colorectal_1_vector = colorectal_1[,2]
colorectal_2_vector = colorectal_2[,2]

venn.plot <- venn.diagram(
  x = list("Colorectal\n2015" = colorectal_1_vector, "Colorectal\n2018" = colorectal_2_vector),
  filename = "common_neoepitopes_colorectal_cancers_venn_hlaa1.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA),
  main.pos = c(0.5, 0.5),
  cex = 3,
  cat.cex = 1.25,
  cat.fontface = "bold",
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(0, 0),
  cat.dist = c(0.05,0.05),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  sub = "HLA-A*24:02",
  sub.cex = 2.5,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.1),
  inverted = FALSE,
  height = 4.5, width = 6, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot

# -------
# hla_b_1
# -------

# binding between peptides and HLA is less than 500nM
colorectal_1 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_1/IEDB_out/hla_b_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
colorectal_2 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_2/IEDB_out/hla_b_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")

colorectal_1_vector = colorectal_1[,2]
colorectal_2_vector = colorectal_2[,2]

venn.plot <- venn.diagram(
  x = list("Colorectal\n2015" = colorectal_1_vector, "Colorectal\n2018" = colorectal_2_vector),
  filename = "common_neoepitopes_colorectal_cancers_venn_hlab1.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA),
  main.pos = c(0.5, 0.5),
  cex = 3,
  cat.cex = 1.25,
  cat.fontface = "bold",
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(0, 0),
  cat.dist = c(0.05,0.05),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  sub = "HLA-B*38:01",
  sub.cex = 2.5,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.1),
  inverted = FALSE,
  height = 4.5, width = 5.5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot

# -------
# hla_b_2
# -------

# binding between peptides and HLA is less than 500nM
colorectal_1 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_1/IEDB_out/hla_b_2/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
colorectal_2 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_2/IEDB_out/hla_b_2/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")

colorectal_1_vector = colorectal_1[,2]
colorectal_2_vector = colorectal_2[,2]

venn.plot <- venn.diagram(
  x = list("Colorectal\n2015" = colorectal_1_vector, "Colorectal\n2018" = colorectal_2_vector),
  filename = "common_neoepitopes_colorectal_cancers_venn_hlab2.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA),
  main.pos = c(0.5, 0.5),
  cex = 3,
  cat.cex = 1.25,
  cat.fontface = "bold",
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(0, 0),
  cat.dist = c(0.05,0.05),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  sub = "HLA-B*27:05",
  sub.cex = 2.5,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.1),
  inverted = FALSE,
  height = 4.5, width = 5.5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot

# -------
# hla_c_1
# -------

# binding between peptides and HLA is less than 500nM
colorectal_1 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_1/IEDB_out/hla_c_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
colorectal_2 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_2/IEDB_out/hla_c_1/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")

colorectal_1_vector = colorectal_1[,2]
colorectal_2_vector = colorectal_2[,2]

venn.plot <- venn.diagram(
  x = list("Colorectal\n2015" = colorectal_1_vector, "Colorectal\n2018" = colorectal_2_vector),
  filename = "common_neoepitopes_colorectal_cancers_venn_hlac1.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA),
  main.pos = c(0.5, 0.5),
  cex = 3,
  cat.cex = 1.25,
  cat.fontface = "bold",
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(180, 180),
  cat.dist = c(0.05,0.05),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  sub = "HLA-C*12:03",
  sub.cex = 2.5,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.1),
  inverted = FALSE,
  height = 4.5, width = 5.5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")

venn.plot

# -------
# hla_c_2
# -------

# binding between peptides and HLA is less than 500nM
colorectal_1 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_1/IEDB_out/hla_c_2/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")
colorectal_2 = read.table("/data/kander22/LynchSyndrome/04_run_mhc/colorectal_2/IEDB_out/hla_c_2/output_IEDB.15.17.19.21_MT_minscore_minpeptide_rmdups_scorefiltered.txt")

colorectal_1_vector = colorectal_1[,2]
colorectal_2_vector = colorectal_2[,2]

venn.plot <- venn.diagram(
  x = list("Colorectal\n2015" = colorectal_1_vector, "Colorectal\n2018" = colorectal_2_vector),
  filename = "common_neoepitopes_colorectal_cancers_venn_hlac2.png",
  scaled = TRUE,
  col = "darkgray",
  fill = c(NA, NA),
  main.pos = c(0.5, 0.5),
  cex = 3,
  cat.cex = 1.25,
  cat.fontface = "bold",
  main.cex = 1,
  cat.default.pos = "outer",
  cat.pos = c(0, 0),
  cat.dist = c(0.05,0.05),
  cat.fontfamily = "sans",
  main = "",
  fontfamily = "sans",
  na = "remove",
  sub = "HLA-C*07:04",
  sub.cex = 2.5,
  sub.fontface = "bold",
  sub.pos = c(0.5, 1.1),
  inverted = FALSE,
  height = 4.5, width = 5.5, resolution = 500, imagetype = "png", units = "in", compression = "lzw")


venn.plot