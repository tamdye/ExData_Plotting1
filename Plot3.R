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
png(file="plot3.png")
par(mfcol=c(1,1))
with(powerData, plot(datetime, Sub_metering_1, type="n",
                     ylab="Energy sub metering", xlab=" "))
with(powerData, points(datetime, Sub_metering_1, type="l", col="black"))
with(powerData, points(datetime, Sub_metering_2, type="l", col="red"))
with(powerData, points(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()