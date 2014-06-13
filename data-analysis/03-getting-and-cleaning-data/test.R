setwd("~/Desktop/OTHERSonDESKTOP/CourseraCourses/DataAnalysis-courseraCourse/03-GettingAndCleaningData")

if (!file.exists("data")) {
    dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/ss06hid.csv", method = "curl")
list.files("./data")

#TYPE=1 (housing unit)
#VAL=24 (+$1,000,000)
