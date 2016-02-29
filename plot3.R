## reading data
all.df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
date.time <- paste(all.df$Date, all.df$Time)

all.df$DateTime <- strptime(date.time, "%d/%m/%Y %H:%M:%S")
all.df$Date <- as.Date(all.df$Date, "%d/%m/%Y")

used.df <- subset(all.df, Date>="2007-02-01" & Date<="2007-02-02")

rm(all.df)
rm(date.time)


## third graph
  # setting up device
  png(filename="plot3.png", width=480, height=480, bg="transparent")
  # drawing plot
  colors<-c("black", "red", "blue")
  plot(used.df$DateTime, used.df$Sub_metering_1, type="l",
       col=colors[1], xlab="", ylab="Global Active Power (kilowatts)")
  lines(used.df$DateTime, used.df$Sub_metering_2, type="l", col=colors[2])
  lines(used.df$DateTime, used.df$Sub_metering_3, type="l", col=colors[3])
  # legend
  legendNames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  legend("topright", legendNames, col=colors, lty=1)
  # closing device
  dev.off()
