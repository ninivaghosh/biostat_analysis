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

FC_crude_data %>%
  select(FC) %>% 
  unlist() %>% 
  bestNormalize(standardize = TRUE, k = 10, r = 5, warn = FALSE) -> modelDataAcp.mes_donnees

FC_crude_data %>% 
  mutate(FC_normalised = predict(modelDataAcp.mes_donnees)) %>% 
  select(-FC) -> FC_normalised_table
View(FC_normalised_table)


write.table(FC_normalised_table, file="FC_normalised_table.txt", sep = "\t", quote = FALSE, row.names = F, col.names = T)
write.xlsx(FC_normalised_table, file = "FC_normalised_table.xlsx")


boxplot(FC_normalised_table$FC_normalised ~FC_normalised_table$replicate)


shapiro.test(FC_normalised_table$FC_normalised)

FC_normalised_table %>% shapiro.test(FC_normalised)


################"
shapiro.test(FC_normalised_table$FC_normalised)
#################
bartlett.test(FC_normalised_table$FC_normalised ~FC_normalised_table$treatment)

leveneTest(FC_normalised ~ treatment, data = FC_normalised_table)
plot(density(FC_normalised_table$FC_normalised))

write.table(FC_normalised_table, file="FC_normalised_table.txt", sep = "\t", quote = FALSE, row.names = F, col.names = T)
write.xlsx(FC_normalised_table, file = "FC_normalised_table.xlsx")