library(tidyr)
library(janitor)
library(ggplot2)
library(forcats)
library(dplyr)

library(opendatatoronto)

# get package
package <- show_package("153ea449-b7f4-4c4d-889a-ec0f89b3bbc9")

# get all resources for this package
resources <- list_package_resources("153ea449-b7f4-4c4d-889a-ec0f89b3bbc9")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
df_buildings <- filter(datastore_resources, row_number()==1) |> get_resource() |> clean_names()
df_units <- filter(datastore_resources, row_number()==2) |> get_resource() |> clean_names()

df_units$household_income_limit <- as.numeric(df_units$household_income_limit)
df_units$units_available_in_the_last_12_months <- as.numeric(df_units$units_available_in_the_last_12_months)
df_units$number_of_market_rent_units <- as.numeric(df_units$number_of_market_rent_units)
df_units$number_of_subsidized_units <- as.numeric(df_units$number_of_subsidized_units)

df_buildings$ward <- as.numeric(df_buildings$ward)

size_estimates = data.frame(
  unit_size=c("B", "1B", "2B", "3B", "4B", "5B", "6B"),
  unit_pop_est=c(1, 1, 2, 3, 4, 5, 6)
)

# ward 1 to 25
ward_names = data.frame(
  ward=sort(unique(df_buildings$ward)),
  ward_name=c(
    "Etobicoke North",
    "Etobicoke Centre",
    "Etobicoke-Lakeshare",
    "Parkdale-High Park",
    "York South-Weston",
    "York Centre",
    "Humber River-Black Creek",
    "Eglington-Lawrence",
    "Davenport",
    "Spadina-Fort York",
    "University-Rosedale",
    "Toronto-St. Paul's",
    "Toronto Centre",
    "Toronto-Danforth",
    "Don Valley West",
    "Don Valley East",
    "Don Valley North",
    "Willowdale",
    "Beaches-East York",
    "Scarborough Southwest",
    "Scarborough Centre",
    "Scarborough-Agincourt",
    "Scarborough North",
    "Scarborough-Guildwood",
    "Scarborough-Rouge Park"
  )
)

# join subsidized unit counts on building
df_building_units <- df_buildings |>
  select(
    building_complex_name, 
    provider_name,
    provider_type,
    ward
  ) |>
  merge(df_units, by="building_complex_name") |>
  merge(ward_names, by="ward") |>
  merge(size_estimates, by="unit_size")

df_building_units |>
  select(building_complex_name, unit_size, number_of_subsidized_units, provider_type) |>
  group_by(building_complex_name, provider_type) |>
  summarize(
    tot_units=sum(number_of_subsidized_units)
  ) |>
  ggplot(aes(x=tot_units, fill=provider_type)) +
  geom_density(color="darkgray", alpha=0.7) +
  theme_minimal() + 
  labs(
    title = "CO-OP and PNP buildings have a low unit count",
    subtitle = "Distribution of building units by provider",
    x = "Unit count",
    y = "Density",
    fill="Provider type"
  ) +
  scale_x_continuous(breaks = c(100, 200, 300, 400, 500, 600, 700, 800, 900, 1000))

df_building_units |>
  select(unit_size, number_of_subsidized_units, provider_type) |>
  group_by(provider_type, unit_size) |>
  summarize(
    tot_units = sum(number_of_subsidized_units)
  ) |>
  ggplot(aes(x=reorder(provider_type, -tot_units), y=tot_units, fill=reorder(unit_size, -tot_units))) +
  geom_col(position = "dodge") +
  labs(
    title="TCHC provides the most units of each size",
    subtitle="Subsidized housing units by size and provider type",
    x="Provider type",
    y="Count",
    fill="Unit size"
  )

df_building_units |>
  select(ward, ward_name, unit_pop_est, number_of_subsidized_units, provider_type) |>
  group_by(ward_name, provider_type) |>
  summarize(
    total_capacity=sum(number_of_subsidized_units * unit_pop_est)
  ) |>
  mutate(
    total_ward=sum(total_capacity)
  ) |>
  ggplot(
    aes(
      x=reorder(ward_name, -total_ward), 
      y=total_capacity, 
      fill=provider_type
  )) +
  geom_col() +
  labs(
    title="Toronto Centre has the most subsidized unit capacity",
    subtitle="Estimated subsidized housing capacity by ward and provider type",
    x="Ward",
    y="Capacity",
    fill="Provider Type",
    caption="Estimated capacity is 1 for B, 1 for 1B, 2 for 2B, 3 for 3B, 4 for 4B, 5 for 5B, and 6 for 6B."
  ) +
  coord_flip()
