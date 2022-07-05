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

df_exp <- (T3_exp_normalised_table)

df_exp$gene = factor(df_exp$gene)
df_exp$treatment = factor(df_exp$treatment)

exp_ANOVA_1 = aov(exp_normalised ~ treatment + gene + treatment * gene, data = df_exp)

summary(exp_ANOVA_1)

output1 <- xtable(exp_ANOVA_1)
write.csv(output1, file = "T3_exp_ANOVA_table.csv", sep = ",")

exp_Tukey_gene <-  TukeyHSD(exp_ANOVA_1, "gene", ordered = TRUE)
exp_Tukey_gene_table <- as.data.frame(exp_Tukey_gene$gene)

write.csv(exp_Tukey_gene_table, file = "T3_exp_Tukey_gene_table.csv", sep = ",")

exp_Tukey_treatment <- TukeyHSD(exp_ANOVA_1, "treatment", ordered = TRUE)
exp_Tukey_treatment_table <- as.data.frame(exp_Tukey_treatment$treatment)

write.csv(exp_Tukey_treatment_table, file = "T3_exp_Tukey_treatment_table.csv", sep = ",")
