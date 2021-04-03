library("data.table")
powerDaTa<- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
powerDaTa[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDaTa[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerDaTa <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)
plot(x = powerDaTa[, dateTime], y = powerDaTa[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
