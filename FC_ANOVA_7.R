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

df_FC <- (FC_normalised_table[,-1])

df_FC$treatment = factor(df_FC$treatment)
df_FC$gene = factor(df_FC$gene)

FC_ANOVA_result_7 = aov(FC_normalised ~ treatment + gene + treatment * gene, data = df_FC)

summary(FC_ANOVA_result_7)

output1 <- xtable(FC_ANOVA_result_7)
write.csv(output1, file = "FC_ANOVA_table.csv", sep = ",")

FC_Tukey_Treatment <-  TukeyHSD(FC_ANOVA_result_7, "treatment", ordered = TRUE)
FC_Tukey_Treatment_table <- as.data.frame(FC_Tukey_Treatment$treatment)

write.csv(FC_Tukey_Treatment_table, file = "FC_Tukey_Treatment_table.csv", sep = ",")

FC_Tukey_Gene <- TukeyHSD(FC_ANOVA_result_7, "gene", ordered = TRUE)
FC_Tukey_Gene_table <- as.data.frame(FC_Tukey_Gene$gene)

write.csv(FC_Tukey_Gene_table, file = "FC_Tukey_Gene_table.csv", sep =",")
