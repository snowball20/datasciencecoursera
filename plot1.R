
library("data.table")
powerDaTa <- data.table::fread(input = "household_power_consumption.txt" , na.strings="?")
powerDaTa[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDaTa[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
powerDaTa <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("plot1.png", width=480, height=480)
hist(powerDaTa[, Global_active_power], main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
