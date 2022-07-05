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

df_XPC_FC <- (T3_XPC_FC[,-1])

df_XPC_FC$gene = factor(df_XPC_FC$gene)

T3_XPC_FC_ANOVA_result = aov(FC_normalised ~ gene, data = df_XPC_FC)

summary(T3_XPC_FC_ANOVA_result)

output1 <- xtable(T3_XPC_FC_ANOVA_result)
write.csv(output1, file = "T3_XPC_FC_ANOVA_table.csv", sep = ",")

XPC_FC_Tukey <-  TukeyHSD(T3_XPC_FC_ANOVA_result, "gene", ordered = TRUE)
XPC_FC_Tukey_table <- as.data.frame(XPC_FC_Tukey$gene)

write.csv(XPC_FC_Tukey_table, file = "T3_XPC_FC_Tukey_table.csv", sep = ",")
