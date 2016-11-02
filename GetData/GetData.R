
## Case Study 1 - Hassan Azhar

#Getting the data from the server.

FEDSTATS <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", na.strings = c("", "NA"))
GDP <-  read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", na.strings = c("", "NA"))
