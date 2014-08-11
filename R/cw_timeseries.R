#' Find the popularity of a phrase over a period of time.
#'
#' @import httr
#' @importFrom plyr rbind.fill
#' @importFrom stringr str_sub
#' @template cw
#' @template cw_timeseries
#' @return A data.frame with number of times (and percentages of the text result,
#' if selected).
#' @export
#' @examples \dontrun{
#' # Search for a phrase to get a time series of
#' cw_timeseries(phrase='climate change')
#'
#' # Get percentages back, which are not returned by default
#' cw_timeseries(phrase='climate change', percentages='true')
#'
#' # Get a list of how many times the phrase "united states" was said by
#' # legislators from Virginia on each day of the most recent Congress:
#' cw_timeseries(phrase='united states', entity_type='state',
#' entity_value='VA')
#'
#' # Get a list of how many times the phrase "united States" appears in the
#' # Congressional Record on each day between Jan. 1, 2010, and June 1, 2010:
#' cw_timeseries(phrase='united states', start_date='2009-01-01',
#' end_date='2009-06-01')
#'
#' # Get a list of how many times the phrase "united states" appears in the
#' # Congressional Record in each month between January and June, 2010:
#' cw_timeseries(phrase='united states', start_date='2009-01-01',
#' end_date='2009-04-30', granularity='month')
#'
#' # Plot data
#' library('ggplot2')
#' dat <- cw_timeseries(phrase='climate change')
#' ggplot(dat, aes(day, count)) +
#'    geom_line() +
#'    theme_grey(base_size=20)
#'
#' dat_d <- cw_timeseries(phrase='climate change', party="D")
#' dat_d$party <- rep("D", nrow(dat_d))
#' dat_r <- cw_timeseries(phrase='climate change', party="R")
#' dat_r$party <- rep("R", nrow(dat_r))
#' dat_both <- rbind(dat_d, dat_r)
#' ggplot(dat_both, aes(day, count, colour=party)) +
#'    geom_line() +
#'    theme_grey(base_size=20) +
#'    scale_colour_manual(values=c("blue","red"))
#'
#'
#' ## interactive version with Morris.js from rCharts
#' dream <- lapply(c('D','R'), function(x) cw_timeseries(phrase='climate change', party=x,
#'    granularity='month'))
#' df <- merge(dream[[1]], dream[[2]], by='month', all=TRUE)
#' df[is.na(df)] <- 0
#' names(df) <- c('date','D','R')
#' df$date <- as.character(df$date)
#'
#' library(rCharts)
#' m1 <- mPlot(x = "date", y = c("D", "R"), type = "Line", data = df)
#' m1$set(pointSize = 0, lineWidth = 1)
#' m1
#' m1$publish("My Chart", host = 'rpubs') # publish to rpubs
#' }

cw_timeseries <- function(phrase=NULL, date = NULL, start_date=NULL, end_date=NULL,
  chamber=NULL, state=NULL, party=NULL, bioguide_id=NULL, mincount=NULL,
  percentages=NULL, granularity='day', entity_type=NULL, entity_value=NULL, return='table',
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")), ...)
{
  splitt<-function(x) paste(str_sub(x, 1, 4), "-", str_sub(x, 5, 6), sep="")
  url = "http://capitolwords.org/api/dates.json"
  args <- suncompact(list(apikey=key, phrase=phrase, start_date=start_date,
                       date = date, end_date=end_date, chamber=chamber, state=state,
                       party=party, bioguide_id=bioguide_id, mincount=mincount,
                       percentages=percentages, granularity=granularity,
                       entity_type=entity_type, entity_value=entity_value))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  tmp <- return_obj(return, tt)
  if(return %in% c('response','list')){ tmp } else { 
    data <- tmp$results
    if(granularity=='day'){ data$day <- as.Date(data$day) } else
      if(granularity=='month'){ data$month <- as.Date(sprintf("%s-01", sapply(data$month, splitt))) } else
        if(granularity=='year'){ data$year <- as.Date(sprintf("%s-01-01", data$year)) }
    data
  }
}
