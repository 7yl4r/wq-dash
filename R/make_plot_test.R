library(testthat)
library(here)
source('make_plot.R')
test_that("make_plot can run", {
  source('data_loader.R')
  result <- make_plot(
    dataframe = load_wq_cleaned_df('../data/df_cleaned.csv'),
    varname = 'Chlorophyll-a',  # str: column name of variable to plot
    ylabel = 'Concentration (ug/L)',  # str: label for y axis
    station_colname = 'epchc_station',  # str: name of column with station ids
    selsit = 'AOML.1'
  )
  print(result)
  # print(class(result))
  expect_s3_class(result, "plotly")
  expect_s3_class(result, "htmlwidget")
})

test_that("make_plot runs for empty data" {
  source(here('R/data_loader.R'))
  result <- make_plot(
    dataframe = load_wq_cleaned_df('./data/df_cleaned.csv'),
    varname = 'fake_name',
    ylabel = 'fake name',
    station_colname = 'epchc_station',
    selsit = 'AOML.1'
  )
})
