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

df_CS6_FC <- (CS6_FC.subtable[,-1])
df_CS6_FC <- (df_CS6_FC[,-1])

df_CS6_FC$gene = factor(df_CS6_FC$gene)

CS6_FC_ANOVA_result_14 = aov(FC_normalised ~ gene, data = df_CS6_FC)

summary(CS6_FC_ANOVA_result_14)

output1 <- xtable(CS6_FC_ANOVA_result_14)
write.csv(output1, file = "CS6_FC_ANOVA_table.csv", sep = ",")

CS6_FC_Tukey <-  TukeyHSD(CS6_FC_ANOVA_result_14, "gene", ordered = TRUE)
CS6_FC_Tukey_table <- as.data.frame(CS6_FC_Tukey$gene)

write.csv(CS6_FC_Tukey_table, file = "CS6_FC_Tukey_table.csv", sep = ",")