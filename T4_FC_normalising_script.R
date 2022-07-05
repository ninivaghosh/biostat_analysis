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
# mes_donnees is the name of the variable corresponding to my original data
# the symbol %>% is intended for piping 
# the "bestNormalize" is package for normalization. the original data is transformed 
#in a way to fit the gaussian distribution

T4_FC_crude %>%
  select(FC) %>% 
  unlist() %>% 
  bestNormalize(standardize = TRUE, k = 10, r = 5, warn = FALSE) -> modelDataAcp.mes_donnees

T4_FC_crude %>% 
  mutate(FC_normalised = predict(modelDataAcp.mes_donnees)) %>% 
  select(-FC) -> T4_FC_normalised_table
View(T4_FC_normalised_table)


write.table(T4_FC_normalised_table, file="T4_FC_normalised_table.txt", sep = "\t", quote = FALSE, row.names = F, col.names = T)
write.xlsx(T4_FC_normalised_table, file = "T4_FC_normalised_table.xlsx")


shapiro.test(T4_FC_normalised_table$FC_normalised)

T4_FC_normalised_table %>% shapiro.test(FC_normalised)

bartlett.test(T4_FC_normalised_table$FC_normalised ~T4_FC_normalised_table$treatment)

leveneTest(FC_normalised ~ treatment, data = T4_FC_normalised_table)
plot(density(T4_FC_normalised_table$FC_normalised))

write.table(T4_FC_normalised_table, file="T4_FC_normalised_table.txt", sep = "\t", quote = FALSE, row.names = F, col.names = T)
write.xlsx(T4_FC_normalised_table, file = "T4_FC_normalised_table.xlsx")