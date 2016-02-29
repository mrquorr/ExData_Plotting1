## reading data
all.df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
date.time <- paste(all.df$Date, all.df$Time)

all.df$DateTime <- strptime(date.time, "%d/%m/%Y %H:%M:%S")
all.df$Date <- as.Date(all.df$Date, "%d/%m/%Y")

used.df <- subset(all.df, Date>="2007-02-01" & Date<="2007-02-02")

rm(all.df)
rm(date.time)


## fouth graph
  # setting up device
  png(filename="plot4.png", width=480, height=480, bg="transparent")
  # setting up board
  par(mfrow=c(2,2))
    # First
    plot(used.df$DateTime, used.df$Global_active_power, type="l",
         xlab = "", ylab = "Global Active Power")
    # Second
    plot(used.df$DateTime, used.df$Voltage, type="l",
         xlab = "datetime", ylab = "Voltage")
    # Third
    colors<-c("black", "red", "blue")
    plot(used.df$DateTime, used.df$Sub_metering_1, type="l",
         col=colors[1], xlab="", ylab="Global Active Power (kilowatts)")
    lines(used.df$DateTime, used.df$Sub_metering_2, type="l", col=colors[2])
    lines(used.df$DateTime, used.df$Sub_metering_3, type="l", col=colors[3])
      # legend
    legendNames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", legendNames, col=colors, lty=1, bty="n")
    # Fouth
    plot(used.df$DateTime, used.df$Global_reactive_power, type="l",
         xlab = "datetime", ylab = "Global_reactive_power")
  # closing device
  dev.off()
