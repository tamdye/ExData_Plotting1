##read the data
##before reading data, download it to a /data folder under the
##working directory
powerData <- read.table("./data/household_power_consumption.txt",
                        header = FALSE, comment.char = "", sep = ";",
                        colClasses = c("character", "character", "numeric",
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric"),
                        col.names = c("Date","Time","Global_active_power",
                                      "Global_reactive_power","Voltage",
                                      "Global_intensity","Sub_metering_1",
                                      "Sub_metering_2","Sub_metering_3"),
                        skip = 66637, nrows=2880)

##create a new column datetime
powerData$datetime <- paste(powerData$Date,powerData$Time)
powerData$datetime <- strptime(powerData$datetime,
                               format="%d/%m/%Y %H:%M:%S")

##create the graph
png(file="plot2.png")
par(mfcol=c(1,1))
with(powerData,plot(datetime, Global_active_power, type="l",
                    ylab="Global Active Power (kilowatts)",
                    xlab=" "))
dev.off()