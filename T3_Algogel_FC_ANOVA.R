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

df_Algogel_FC <- (T3_Algogel_FC[,-1])

df_Algogel_FC$gene = factor(df_Algogel_FC$gene)

T3_Algogel_FC_ANOVA_result = aov(FC_normalised ~ gene, data = df_Algogel_FC)

summary(T3_Algogel_FC_ANOVA_result)

output1 <- xtable(T3_Algogel_FC_ANOVA_result)
write.csv(output1, file = "T3_Algogel_FC_ANOVA_table.csv", sep = ",")

Algogel_FC_Tukey <-  TukeyHSD(T3_Algogel_FC_ANOVA_result, "gene", ordered = TRUE)
Algogel_FC_Tukey_table <- as.data.frame(Algogel_FC_Tukey$gene)

write.csv(Algogel_FC_Tukey_table, file = "T3_Algogel_FC_Tukey_table.csv", sep = ",")