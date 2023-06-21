renv::init() # select 1 to restore from lock file

library(googleAnalyticsR) # for working with Google Analytics
library(jsonlite) # for our json files

ga_auth() # authenticate

accounts_list <- ga_account_list()
view_id <- Sys.getenv("GA_VIEW_ID")

# get history of pageviews per month
pageviews <- google_analytics(view_id,
                              date_range = c("2013-01-01", "2023-01-01"),
                              metrics = c("uniquePageviews", "sessions"),
                              dimensions = c("yearMonth"),
                              anti_sample = TRUE)

make_csv <- write.csv(pageviews, "~/projects/ga-history/data/pageviews.csv")

# get history of device categories
device_cat <- google_analytics(view_id,
                               date_range = c("2013-01-01", "2023-01-01"),
                               metrics = c("uniquePageviews", "sessions"),
                               dimensions = c("yearMonth", "deviceCategory"),
                               anti_sample = TRUE)

make_csv <- write.csv(device_cat, "~/projects/ga-history/data/device_cat.csv")

# get history of device screen size 


