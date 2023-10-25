#read progress file----

flights = readRDS("data/flights.rds")

str(flights)

FlightsData <- flights$data[[1]]$data_frame

#look at your data
install.packages("dplyr")
dplyr::glimpse(flightsData)

head(flightsData)

class(flightsData$AirlineID)

householdIncomes <- c(
  "middle income", "high income", "middle income", "low income",
  "middle income", "high income", "high income", "low income",
  "high income", "middle income", "high income", "middle income"
)

class(householdIncomes)

householdIncomes[[1]] < "high income"

flightsData$AirlineID <- factor(
  flightsData$AirlineID
)

class(flightsData$AirlineID)




