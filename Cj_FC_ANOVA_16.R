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

df_Cj_FC <- (Cj_FC.subtable[,-1])
df_Cj_FC <- (df_Cj_FC[,-1])

df_Cj_FC$gene = factor(df_Cj_FC$gene)

Cj_FC_ANOVA_result_16 = aov(FC_normalised ~ gene, data = df_Cj_FC)

summary(Cj_FC_ANOVA_result_16)

output1 <- xtable(Cj_FC_ANOVA_result_16)
write.csv(output1, file = "Cj_FC_ANOVA_table.csv", sep = ",")

Cj_FC_Tukey <-  TukeyHSD(Cj_FC_ANOVA_result_16, "gene", ordered = TRUE)
Cj_FC_Tukey_table <- as.data.frame(Cj_FC_Tukey$gene)

write.csv(Cj_FC_Tukey_table, file = "Cj_FC_Tukey_table.csv", sep = ",")