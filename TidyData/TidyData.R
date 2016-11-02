
## Case Study 1 - Hassan Azhar

#Loading libraries
library(plyr)

#CLEANING GDP DATA
#analyze the columns and data types for the columns
str(GDP)

GDP$X.3 = as.numeric(gsub(",","",GDP$X.3)) 

#Renaming the columns
GDP.NEWNAMES <-rename(GDP, c("X"="CountryCode","Gross.domestic.product.2012" ="Ranking" ,"X.2"="Country","X.3"="GDP","X.4" = "Category"))

#removing the bad data 
GDP.HEADER <- GDP.NEWNAMES[5:235,]

#Droping the column with empty data
GDP.DROP <- GDP.HEADER [ -c(3, 7:10) ]

#Removing countries with no ranking
GDP.DROP <- GDP.DROP[!(is.na(GDP.DROP$Ranking)), ]

GDP.VALUES <- as.numeric(gsub(",", "", GDP.DROP$GDP))

#Saving tidy data in new data frame
GDP.CLEAN <- GDP.DROP

#CLEANING FED STAT DATA

#analyze the columns and data types for the columns
str(FEDSTATS)

#Analyze the chunks of data
head(FEDSTATS,10)
tail(FEDSTATS,10)

#Renaming the columns
FEDSTATS.NEWNAMES <-rename(FEDSTATS, c("Long.Name"= "CountryName" , "Income.Group"="IncomeGroup", "Lending.category"="LendingCategoy","Other.groups"="OtherGroups", "Currency.Unit"="Currency" ))

#We can Keep only the columns we need. 
#FEDSTATS.NEWNAMES <- FEDSTATS.NEWNAMES[c("CountryCode", "CountryName", "IncomeGroup")]

#remove all the NA's from Income Group
FEDSTATS.CLEAN<- FEDSTATS.NEWNAMES[!is.na(FEDSTATS.NEWNAMES$IncomeGroup),]

