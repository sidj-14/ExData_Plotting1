## Downloading the file, unzipping and saving it. Commented as reading data is asked in the assignment.
##fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##temp <- tempfile()
##download.file(fileUrl, destfile=temp)
##unzip(temp)
##unlink(temp)

colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
feb_1_2_Data_temp <- read.table(pipe('grep "^[12]/2/2007" household_power_consumption.txt'),sep=";",col.names=colnames)

## if not Windows machine. Please use the following method.
## x <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
## feb_1_2_Data_temp <- subset(x, Date %in% c("01/02/2007","02/02/2007"))

feb_1_2_Data_temp <- transform(feb_1_2_Data_temp,DateTime = as.POSIXlt(paste(Date,Time, sep=" "),format="%d/%m/%Y %H:%M:%S"))
feb_1_2_Data <- feb_1_2_Data_temp[,c(length(feb_1_2_Data_temp),3:(length(feb_1_2_Data_temp)-1))]
png(filename="plot2.png",width=480,height=480)
with(feb_1_2_Data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
