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

df_FC <- T4_FC_normalised_table[,-1]

df_FC$gene = factor(df_FC$gene)

T4_FC_ANOVA_result = aov(FC_normalised ~ gene, data = df_FC)

summary(T4_FC_ANOVA_result)

output1 <- xtable(T4_FC_ANOVA_result)
write.csv(output1, file = "T4_FC_ANOVA_table.csv", sep = ",")

FC_Tukey_Gene <- TukeyHSD(T4_FC_ANOVA_result, "gene", ordered = TRUE)
FC_Tukey_Gene_table <- as.data.frame(FC_Tukey_Gene$gene)

write.csv(FC_Tukey_Gene_table, file = "T4_FC_Tukey_Gene_table.csv", sep =",")
