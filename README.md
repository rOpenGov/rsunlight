rsunlight
======



[![Build Status](https://api.travis-ci.org/rOpenGov/rsunlight.png)](https://travis-ci.org/rOpenGov/rsunlight)
[![Build status](https://ci.appveyor.com/api/projects/status/ytc2qdo3u2t3ltm6/branch/master)](https://ci.appveyor.com/project/sckott/rsunlight)
[![codecov.io](https://codecov.io/github/rOpenGov/rsunlight/coverage.svg?branch=master)](https://codecov.io/github/rOpenGov/rsunlight?branch=master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/grand-total/rsunlight)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/rsunlight)](http://cran.rstudio.com/web/packages/rsunlight)

+ Maintainer: [Scott Chamberlain](https://github.com/sckott/)
+ License: [MIT](http://opensource.org/licenses/MIT)
+ Report any problems in the [Issues Tracker](https://github.com/ropengov/rsunlight/issues), or just fork and submit changes, etc.

## Description

`rsunlight` is a collection of functions to search and acquire data from the various Sunlight Labs APIs for government data, at [http://sunlightfoundation.com/api/](http://sunlightfoundation.com/api/).

`rsunlight` wraps functions in APIs for:

* Congress API (`cg`)
* Open States API (`os`)
* Capitol Words API (`cw`)

Functions that wrap these sets of APIs will be prefixed by `cg`, `os`, or `cw` for the different methods listed above:

* `cg` + `fxn`
* `os` + `fxn`
* `cw` + `fxn`

where `fxn` would be a function to a interface with a specific Sunlight Foundation API.

Please get your own API keys if you plant to use these functions for Sunlight Labs (http://sunlightfoundation.com/api/).

Data from the Sunlight Foundation API is provided by Sunlight Foundation.

<a href="http://sunlightfoundation.com/api/"><img src="http://www.altweeklies.com/imager/b/main/5866471/f291/SunlightFoundationLogo_500wide.gif" alt="NYT API" /></a>

You need API keys for Sunlight Foundation APIs. Please get your own API keys if you
plant to use these functions for Sunlight Labs (http://services.sunlightlabs.com/).
We set up the functions so that you can use either env vars, or R options. For env
vars, put an entry in your `.Renviron` file with the name `SUNLIGHT_LABS_KEY`,
so the full thing would be `SUNLIGHT_LABS_KEY=<key>`. For R options, put the key in
your `.Rprofile` file like `options(SunlightLabsKey = "key")`. Both are called
on R startup, and then you don't have to enter your API key for each run of a function.

**Note** that Puerto Rico is not included in Sunlight Foundation data.

## Install rsunlight

From CRAN


```r
install.packages("rsunlight")
```

Or development version from Github


```r
devtools::install_github("ropengov/rsunlight")
```


```r
library("rsunlight")
```

## Congress API

### Get districts for a latitude/longitude.


```r
cg_districts(latitude = 35.778788, longitude = -78.787805)
#> <Sunlight data>
#>    Dimensions:   [1 X 2]
#> 
#>   state district
#> 1    NC        2
```

### Search congress people and senate members.


```r
out <- cg_legislators(last_name = 'Reed')
```

## Open States API

### Bill Search

Search for bills with the term _agriculture_, in Texas, and in the upper chamber.


```r
os_billsearch(terms = 'agriculture', state = 'tx', chamber = 'upper')
#> <Sunlight data>
#>    Dimensions:   [320 X 10]
#> 
#>                                                                          title
#> 1  Relating to certain committees and programs to develop the wine industry in
#> 2  Relating to a waiver of fees by the Department of Agriculture and the Parks
#> 3  Urging the United States Department of Agriculture Food and Nutrition Servi
#> 4  Relating to the designation of an office in the Department of Agriculture t
#> 5  Relating to the office of water and the water advisory committee in the Dep
#> 6  Relating to establishing an agriculture ombudsman office in the Department 
#> 7  Relating to authorizing the issuance of revenue bonds to fund capital proje
#> 8  Relating to authorizing the issuance of revenue bonds to fund capital proje
#> 9  Relating to authorizing the issuance of revenue bonds to fund capital proje
#> 10 Relating to authorizing the issuance of revenue bonds to fund capital proje
#> ..                                                                         ...
#> Variables not shown: created_at (chr), updated_at (chr), id (chr), chamber
#>      (chr), state (chr), session (chr), type (list), subjects (list),
#>      bill_id (chr)
```

### Legislator Search

Search for Republican legislators in Nevada


```r
os_legislatorsearch(state = 'nv', party = 'republican')
#> <Sunlight data>
#>    Dimensions:   [36 X 26]
#> 
#>    last_name          updated_at           full_name        id  first_name
#> 1    O'Neill 2015-12-15 08:41:55 Philip P.K. O'Neill NVL000291      Philip
#> 2    Dooling 2015-12-15 08:42:35 Victoria A. Dooling NVL000273 Victoria A.
#> 3      Fiore 2015-12-15 08:42:36       Michele Fiore NVL000252     Michele
#> 4    Edwards 2015-12-15 08:42:36       Chris Edwards NVL000287       Chris
#> 5   Hambrick 2015-12-15 08:42:36       John Hambrick NVL000082        John
#> 6   Woodbury 2015-12-15 08:42:36    Melissa Woodbury NVL000105     Melissa
#> 7    Gardner 2015-12-15 08:42:36    David M. Gardner NVL000290    David M.
#> 8     Nelson 2015-12-15 08:42:36     Erven T. Nelson NVL000270    Erven T.
#> 9     Kirner 2015-12-15 08:42:36        Randy Kirner NVL000131       Randy
#> 10 Armstrong 2015-12-15 08:42:36     Derek Armstrong NVL000292       Derek
#> ..       ...                 ...                 ...       ...         ...
#> Variables not shown: middle_name (chr), district (chr), state (chr), party
#>      (chr), email (chr), all_ids (list), leg_id (chr), active (lgl),
#>      transparencydata_id (chr), nickname (chr), photo_url (chr), url
#>      (chr), created_at (chr), chamber (chr), offices (list), suffixes
#>      (chr), votesmart_id (chr), country (chr), level (chr), +address
#>      (chr), csrfmiddlewaretoken (chr)
```


## Capitol Words API

### Find the popularity of a phrase over a period of time.

Get a list of how many times the phrase "united states" appears in the Congressional Record in each month between January and June, 2010:


```r
cw_timeseries(phrase='united states', start_date='2009-01-01', end_date='2009-04-30', granularity='month')
#> <Sunlight data>
#>    Dimensions:   [4 X 2]
#> 
#>   count      month
#> 1  3805 2009-01-01
#> 2  3512 2009-02-01
#> 3  6018 2009-03-01
#> 4  2967 2009-04-01
```


```r
library("ggplot2")
dat_d <- cw_timeseries(phrase='climate change', party="D")
dat_d$party <- rep("D", nrow(dat_d))
dat_r <- cw_timeseries(phrase='climate change', party="R")
dat_r$party <- rep("R", nrow(dat_r))
dat_both <- rbind(dat_d, dat_r)
ggplot(dat_both, aes(day, count, colour=party)) +
  geom_line() +
  theme_grey(base_size=20) +
  scale_colour_manual(values=c("blue","red"))
```

![plot of chunk unnamed-chunk-10](inst/img/unnamed-chunk-10-1.png) 
