# Name: Christopher Kingston
# Date: 02/15/2023
# Assignment 5c

# Download data set and import to R
getwd()
setwd('C:/CODING/Math17/Week05/')
list.files()
library('readxl')
MelbourneHousing <- read_excel('MelbourneHousing.xlsx')
names(MelbourneHousing)

# Extract property addresses with missing landsizes
M <- ifelse(MelbourneHousing$Landsize==0,'M','P')
M
Addresses <- subset(MelbourneHousing,Landsize == 0, select = Address)
Addresses

# Extract year built of properties missing landsizes
YearBuilt <- subset(MelbourneHousing,Landsize == 0, select = YearBuilt)
YearBuilt

# NAs present in YearBuilt Data

# Match addresses to yearbuilt
AddressBYear <- data.frame(Addresses,YearBuilt)
AddressBYear
FinalListAddresses <- na.omit(AddressBYear)
FinalListAddresses
options(max.print = 9999)
print(FinalListAddresses)
