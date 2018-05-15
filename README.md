rsunlight
======



[![Build Status](https://travis-ci.org/rOpenGov/rsunlight.svg?branch=master)](https://travis-ci.org/rOpenGov/rsunlight)
[![codecov.io](https://codecov.io/github/rOpenGov/rsunlight/coverage.svg?branch=master)](https://codecov.io/github/rOpenGov/rsunlight?branch=master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/rsunlight)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/rsunlight)](https://cran.r-project.org/package=rsunlight)


+ Maintainer: [Scott Chamberlain](https://github.com/sckott/)
+ License: [MIT](http://opensource.org/licenses/MIT)
+ Report any problems in the [Issues Tracker](https://github.com/ropengov/rsunlight/issues), or just fork and submit changes, etc.


> NOTE: Capitol Words API is defunct

`rsunlight` is a collection of functions to search and acquire data from the various APIs that used to be housed under Sunlight Labs, but which are now housed under ProPublica.

`rsunlight` wraps functions in APIs for:

* Congress API (`cg`) - Run by ProPublica
* Open States API (`os`) - Run by OpenStates foundation

Functions that wrap these sets of APIs will be prefixed by `cg` or `os` for the different methods listed above:

* `cg` + `fxn`
* `os` + `fxn`

where `fxn` would be a function to a interface with a specific API.


You need API keys for Propublica APIs. Get them at
<https://www.propublica.org/datastore/apis>

You need an API key for the OpenStates API. Get it at
<https://openstates.org/api/register/>


We set up the functions so that you can use either env vars, or R options.
For env vars, put an entry in your `.Renviron` file with the names
`PROPUBLICA_API_KEY` and `OPEN_STATES_KEY`.

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

Search for congress members by chamber and state


```r
cg_members_state_district('senate', 'RI')
#> # A tibble: 2 x 16
#>   id     name   first_name middle_name last_name suffix role  gender party
#>   <chr>  <chr>  <chr>      <chr>       <chr>     <chr>  <chr> <chr>  <chr>
#> 1 W0008… Sheld… Sheldon    <NA>        Whitehou… <NA>   Sena… M      D
#> 2 R0001… Jack … Jack       <NA>        Reed      <NA>   Sena… M      D
#> # ... with 7 more variables: times_topics_url <chr>, twitter_id <chr>,
#> #   facebook_account <chr>, youtube_id <chr>, seniority <chr>,
#> #   next_election <chr>, api_uri <chr>
```

Search for committees by congress and chamber


```r
cg_committees(115, "senate")[[1]]$committees[[1]]
#> $id
#> [1] "SCNC"
#>
#> $name
#> [1] "Caucus on International Narcotics Control"
#>
#> $chamber
#> [1] "Senate"
#>
#> $url
#> [1] "http://www.drugcaucus.senate.gov/"
#>
#> $api_uri
#> [1] "https://api.propublica.org/congress/v1/115/senate/committees/SCNC.json"
#>
#> $chair
#> [1] "Charles E. Grassley"
#>
#> $chair_id
#> [1] "G000386"
#>
#> $chair_party
#> [1] "R"
#>
#> $chair_state
#> [1] "IA"
#>
#> $chair_uri
#> [1] "https://api.propublica.org/congress/v1/members/G000386.json"
#>
#> $ranking_member_id
#> [1] "F000062"
#>
#> $subcommittees
#> list()
```

## Open States API

Bill Search - Search for bills with the term _agriculture_, in Texas, and in the upper chamber.


```r
os_billsearch(terms = 'agriculture', state = 'tx', chamber = 'upper')
#> # A tibble: 26 x 10
#>    title  created_at updated_at id    chamber state session type  subjects
#>  * <chr>  <chr>      <chr>      <chr> <chr>   <chr> <chr>   <chr> <chr>
#>  1 Relat… 2017-03-1… 2017-06-0… TXB0… upper   tx    85      bill  <NA>
#>  2 Recog… 2017-02-2… 2017-06-0… TXB0… upper   tx    85      reso… <NA>
#>  3 Recog… 2017-02-2… 2017-06-0… TXB0… upper   tx    85      reso… <NA>
#>  4 Relat… 2017-01-3… 2017-06-0… TXB0… upper   tx    85      bill  <NA>
#>  5 Relat… 2015-03-0… 2016-04-2… TXB0… upper   tx    84      bill  <NA>
#>  6 Relat… 2015-03-1… 2015-07-0… TXB0… upper   tx    84      bill  <NA>
#>  7 Urgin… 2015-05-1… 2016-04-2… TXB0… upper   tx    84      conc… <NA>
#>  8 Relat… 2015-03-1… 2015-03-2… TXB0… upper   tx    84      bill  <NA>
#>  9 Relat… 2015-03-1… 2015-03-2… TXB0… upper   tx    84      bill  <NA>
#> 10 Relat… 2015-03-0… 2015-03-1… TXB0… upper   tx    84      bill  <NA>
#> # ... with 16 more rows, and 1 more variable: bill_id <chr>
```

Legislator Search - Search for Republican legislators in Nevada


```r
os_legislatorsearch(state = 'nv', party = 'republican')
#> # A tibble: 24 x 26
#>    last_name updated_at   full_name  id    first_name middle_name district
#>  * <chr>     <chr>        <chr>      <chr> <chr>      <chr>       <chr>
#>  1 Hambrick  2018-05-14 … John Hamb… NVL0… John       ""          2
#>  2 Woodbury  2018-05-14 … Melissa W… NVL0… Melissa    ""          23
#>  3 Ellison   2018-05-14 … John Elli… NVL0… John C.    ""          33
#>  4 Hansen    2018-05-14 … Ira Hansen NVL0… Ira        ""          32
#>  5 Anderson  2018-05-14 … Paul Ande… NVL0… Paul       ""          13
#>  6 Oscarson  2018-05-14 … James Osc… NVL0… James      ""          36
#>  7 Wheeler   2018-05-14 … Jim Wheel… NVL0… Jim        ""          39
#>  8 Titus     2018-05-14 … Robin L. … NVL0… Robin L.   ""          38
#>  9 Edwards   2018-05-14 … Chris Edw… NVL0… Chris      ""          19
#> 10 Kramer    2018-05-14 … Al Kramer  NVL0… Al         ""          40
#> # ... with 14 more rows, and 19 more variables: state <chr>,
#> #   votesmart_id <chr>, party <chr>, email <chr>, all_ids <chr>,
#> #   leg_id <chr>, active <lgl>, transparencydata_id <chr>, nickname <chr>,
#> #   photo_url <chr>, url <chr>, country <chr>, created_at <chr>,
#> #   level <chr>, chamber <chr>, offices <chr>, `+address` <chr>,
#> #   suffixes <chr>, csrfmiddlewaretoken <chr>
```

## Meta

* Please [report any issues or bugs](https://github.com/ropengov/rsunlight/issues).
* License: MIT
* Get citation information for `rsunlight` in R doing `citation(package = 'rsunlight')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
