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

df_To_FC <- (To_FC.subtable[,-1])
df_To_FC <- (df_To_FC[,-1])

df_To_FC$gene = factor(df_To_FC$gene)

To_FC_ANOVA_result_15 = aov(FC_normalised ~ gene, data = df_To_FC)

summary(To_FC_ANOVA_result_15)

output1 <- xtable(To_FC_ANOVA_result_15)
write.csv(output1, file = "To_FC_ANOVA_table.csv", sep = ",")

To_FC_Tukey <-  TukeyHSD(To_FC_ANOVA_result_15, "gene", ordered = TRUE)
To_FC_Tukey_table <- as.data.frame(To_FC_Tukey$gene)

write.csv(To_FC_Tukey_table, file = "To_FC_Tukey_table.csv", sep = ",")