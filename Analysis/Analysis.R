
## Case Study 1 - Hassan Azhar

##Question 1

#Merge clean Data
data <- merge(FEDSTATS.CLEAN, GDP.CLEAN,by="CountryCode")

#Number of IDs match?
nrow(data)

#Question 2

#Sorting data in ascending order
data.ascending <-data[order(data[,34]),]

#The 13th country in the resulting data frame
data.ascending[13,]

#Question 3

#Part 3: Average GDP rankings

AverageGDPRankingOECD <- mean(which(data$IncomeGroup =="High income: OECD"),)
message("Average GDP rankings for the High income: OECD: ", AverageGDPRankingOECD)
AverageGDPRankingnonOECD <- mean(which(data$IncomeGroup =="High income: nonOECD"),)
message("Average GDP rankings for the High income: non OECD: ", AverageGDPRankingnonOECD)

#Question 4
#Loading required libraries

library(ggplot2)

#Creating a GDP Plot by Income Group

GDPPLOT<-ggplot(data,aes(x=factor(data$IncomeGroup), y=data$GDP, fill=factor(data$IncomeGroup)))+ geom_bar(width=.5,stat="identity", position=position_dodge())+xlab("Income Group")+ylab("GDP")+labs(fill="Income Group")
print(GDPPLOT)

#Question 5

#Cut the GDP ranking into 5 separate quantile groups

data.ascending$Ranking<- as.numeric(gsub(",","",data.ascending$Ranking)) 
Quantiles<- cut(data.ascending$Ranking, breaks = 5)
quant <- table(data.ascending$IncomeGroup,Quantiles)
quant

#Countries with Lower middle income but among the 38 nations with highest GDP

data.ascending[ data.ascending$IncomeGroup == "Lower middle income" & data.ascending$Ranking <= 38,]
