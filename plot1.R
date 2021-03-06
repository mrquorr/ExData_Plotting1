## reading data
all.df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
date.time <- paste(all.df$Date, all.df$Time)

all.df$DateTime <- strptime(date.time, "%d/%m/%Y %H:%M:%S")
all.df$Date <- as.Date(all.df$Date, "%d/%m/%Y")

used.df <- subset(all.df, Date>="2007-02-01" & Date<="2007-02-02")

rm(all.df)
rm(date.time)


## first graph
  # setting up device
  png(filename="plot1.png", width=480, height=480, bg="transparent")
  # drawing plot
  hist(used.df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  # closing device
  dev.off()
