library(ggcorrplot)
library(scales)
library(openxlsx)
library(corrplot)
library(bestNormalize)
library(car)
library (ggplot2)
library(dplyr)
library(tidyr)
require(data.table)
library("FactoMineR")
library("factoextra")
library(xtable)

df_CS5_FC <- (CS5_FC.subtable[,-1])
df_CS5_FC <- (df_CS5_FC[,-1])

df_CS5_FC$gene = factor(df_CS5_FC$gene)

CS5_FC_ANOVA_result_13 = aov(FC_normalised ~ gene, data = df_CS5_FC)

summary(CS5_FC_ANOVA_result_13)

output1 <- xtable(CS5_FC_ANOVA_result_13)
write.csv(output1, file = "CS5_FC_ANOVA_table.csv", sep = ",")

CS5_FC_Tukey <-  TukeyHSD(CS5_FC_ANOVA_result_13, "gene", ordered = TRUE)
CS5_FC_Tukey_table <- as.data.frame(CS5_FC_Tukey$gene)

write.csv(CS5_FC_Tukey_table, file = "CS5_FC_Tukey_table.csv", sep = ",")