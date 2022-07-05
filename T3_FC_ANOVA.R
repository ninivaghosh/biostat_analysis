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

df_FC <- T3_FC_normalised_table

df_FC$treatment = factor(df_FC$treatment)
df_FC$gene = factor(df_FC$gene)

T3_FC_ANOVA_result = aov(FC_normalised ~ treatment + gene + treatment * gene, data = df_FC)

summary(T3_FC_ANOVA_result)

output1 <- xtable(T3_FC_ANOVA_result)
write.csv(output1, file = "T3_FC_ANOVA_table.csv", sep = ",")

FC_Tukey_Treatment <-  TukeyHSD(T3_FC_ANOVA_result, "treatment", ordered = TRUE)
FC_Tukey_Treatment_table <- as.data.frame(FC_Tukey_Treatment$treatment)

write.csv(FC_Tukey_Treatment_table, file = "T3_FC_Tukey_Treatment_table.csv", sep = ",")

FC_Tukey_Gene <- TukeyHSD(T3_FC_ANOVA_result, "gene", ordered = TRUE)
FC_Tukey_Gene_table <- as.data.frame(FC_Tukey_Gene$gene)

write.csv(FC_Tukey_Gene_table, file = "T3_FC_Tukey_Gene_table.csv", sep =",")
