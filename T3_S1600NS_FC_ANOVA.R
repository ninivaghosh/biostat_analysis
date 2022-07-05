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

df_S1600NS_FC <- (T3_S1600NS_FC[,-1])

df_S1600NS_FC$gene = factor(df_S1600NS_FC$gene)

T3_S1600NS_FC_ANOVA_result = aov(FC_normalised ~ gene, data = df_S1600NS_FC)

summary(T3_S1600NS_FC_ANOVA_result)

output1 <- xtable(T3_S1600NS_FC_ANOVA_result)
write.csv(output1, file = "T3_S1600NS_FC_ANOVA_table.csv", sep = ",")

S1600NS_FC_Tukey <-  TukeyHSD(T3_S1600NS_FC_ANOVA_result, "gene", ordered = TRUE)
S1600NS_FC_Tukey_table <- as.data.frame(S1600NS_FC_Tukey$gene)

write.csv(S1600NS_FC_Tukey_table, file = "T3_S1600NS_FC_Tukey_table.csv", sep = ",")