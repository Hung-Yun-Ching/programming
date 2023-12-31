flights <- readRDS("data/week10/flights_week10.rds")

flightsData <- flights$data[[1]]$data_frame

dplyr::glimpse(flightsData)

# How amny departure time zone?

flightsData$DepartureTimeZone |>
  table() |>
  sort(decreasing = T) -> tb_departureTimeZone

flight$dataSummary$DepartureTimeZone <- te_departureTimeZone

length(tb_departureTimeZone)

# Get unique time zones
unique_time_zones <- unique(flightsData$DepartureTimeZone)

# Count the number of unique time zones
num_time_zones <- length(unique_time_zones)

# Display the number of time zones
cat("Number of time zones:", num_time_zones, "\n")

# Count observations per time zone
observations_per_time_zone <- table(flightsData$DepartureTimeZone)

# Display observations per time zone
cat("Observations per time zone:\n")
print(observations_per_time_zone)

## Split data frame ----

# 3. parse time with time zone
## split flightsData according to its timezone
flightsData |> split(flightsData$DepartureTimeZone) -> split_flightsData

x = 1

split_flightsData[[x]] |> dplyr::glimpse()
split_flightsData[[x]] |> View()

split_flightsData[[x]]$DepartureTime <-
lubridate::ymd_hm(
  split_flightsData[[x]]$DepartureTime,
  tz = split_flightsData[[x]]$DepartureTimeZone[[1]]
)

split_flightsData[[x]]|> dplyr::glimpse()

#

# 3. parse time with time zone
## split flightsData according to its timezone
flightsData |> split(flightsData$DepartureTimeZone) -> split_flightsData

split_flightsData[[.x] |>
  dplyr::mutate(
    lubridate::ymd_hm(
      DepartureTime,
      tz = DepartureTimeZone[[1]])
    )
  
# for every x
flightsData <- flights$data[[1]]$data_frame

flightsData|>
  dplyr::group_by(DepartureTimeZone)|>
  dpyle::mutate(
    DepartureTime =
      lubridate::ymd_hm(
        DepartureTime,
        tz = DepartureTimeZone[[1]])
  ) ->
  dplyr::ungroup() ->
  flightsData

flights$data[[1]]$data_frame <- flightsData

saveRDS(flights, file="data/flights_week11.rds")


flightsData |>
  split(flightsData$AirlineID) -> split.data.frame()
  
  