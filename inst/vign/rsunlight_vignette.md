<!--
%\VignetteEngine{knitr}
%\VignetteIndexEntry{rsunlight vignette}
-->



rsunlight vignette - Interface to Sunlight Labs APIs
=====================================================

`rsunlight` is an R package to search and retrieve data from the Sunlight Labs APIs. 

Returned objects from functions are simple lists. That is, you likely will want to take output objects and make data.frames, vectors, matrices, etc. In future versions of rsunlight, I will return data.frame's when possible as those are easy to work with in R for beginners, though advanced users may prefer lists or raw responses from the API with lots of info, including header, etc.

## Installation


```r
devtools::install_github("ropengov/rsunlight")
```


```r
library('rsunlight')
```

## Congress API

### Gets details (subcommittees + membership) for a committee by id.


```r
cg_committees(id = 'JSPR')
```

```
#> <Sunlight data>
#>    Dimensions:   [20 X 5]
#> 
#>    chamber committee_id
#> 1   senate       SSGA19
#> 2   senate       SSGA18
#> 3   senate       SSGA16
#> 4   senate       SSGA15
#> 5   senate       SSGA17
#> 6   senate       SSGA01
#> 7   senate       SSFR14
#> 8   senate       SSFR15
#> 9   senate       SSFR13
#> 10  senate       SSFR12
#> ..     ...          ...
#> Variables not shown: name (chr), parent_committee_id (chr), subcommittee
#>      (lgl)
```

### Get districts for a latitude/longitude.


```r
cg_districts(latitude = 35.778788, longitude = -78.787805)
```

```
#> <Sunlight data>
#>    Dimensions:   [1 X 2]
#> 
#>   state district
#> 1    NC        2
```

### Get districts that overlap for a certain zip code.


```r
cg_districts(zip = 27511)
```

```
#> <Sunlight data>
#>    Dimensions:   [3 X 2]
#> 
#>   state district
#> 1    NC        2
#> 2    NC        4
#> 3    NC       13
```

### Search politicians by name


```r
cg_legislators(last_name = 'Reed')
```

```
#> <Sunlight data>
#>    Dimensions:   [2 X 36]
#> 
#>   bioguide_id   birthday chamber
#> 1     R000585 1971-11-18   house
#> 2     R000122 1949-11-12  senate
#> Variables not shown: contact_form (chr), crp_id (chr), district (int),
#>      facebook_id (chr), fax (chr), fec_ids (list), first_name (chr),
#>      gender (chr), govtrack_id (chr), icpsr_id (int), in_office (lgl),
#>      last_name (chr), middle_name (chr), name_suffix (chr), nickname
#>      (chr), oc_email (chr), ocd_id (chr), office (chr), party (chr), phone
#>      (chr), state (chr), state_name (chr), term_end (chr), term_start
#>      (chr), thomas_id (chr), title (chr), twitter_id (chr), votesmart_id
#>      (int), website (chr), youtube_id (chr), lis_id (chr), senate_class
#>      (int), state_rank (chr)
```

### Search politicians by zip code

And get their names and Twitter handles


```r
cg_legislators(zip = 77006)
```

```
#> <Sunlight data>
#>    Dimensions:   [4 X 37]
#> 
#>   bioguide_id   birthday chamber
#> 1     C001098 1970-12-22  senate
#> 2     P000592 1948-09-10   house
#> 3     J000032 1950-01-12   house
#> 4     C001056 1952-02-02  senate
#> Variables not shown: contact_form (chr), crp_id (chr), district (int),
#>      facebook_id (chr), fax (chr), fec_ids (list), first_name (chr),
#>      gender (chr), govtrack_id (chr), icpsr_id (int), in_office (lgl),
#>      last_name (chr), lis_id (chr), middle_name (lgl), name_suffix (lgl),
#>      nickname (lgl), oc_email (chr), ocd_id (chr), office (chr), party
#>      (chr), phone (chr), senate_class (int), state (chr), state_name
#>      (chr), state_rank (chr), term_end (chr), term_start (chr), thomas_id
#>      (chr), title (chr), twitter_id (chr), votesmart_id (int), website
#>      (chr), youtube_id (chr), leadership_role (chr)
```

## Capitol Words API

### Popularity of a phrase through time.

Get a list of how many times the phrase "united states" appears in the Congressional Record in each month between January and June, 2010:


```r
cw_timeseries(phrase='united states', start_date='2009-01-01', end_date='2009-04-30', granularity='month')
```

```
#> <Sunlight data>
#>    Dimensions:   [4 X 2]
#> 
#>   count      month
#> 1  3805 2009-01-01
#> 2  3512 2009-02-01
#> 3  6018 2009-03-01
#> 4  2967 2009-04-01
```

#### Plot data


```r
library('ggplot2')
dat <- cw_timeseries(phrase = 'climate change')
ggplot(dat, aes(day, count)) + 
  geom_line() + 
  theme_grey(base_size=20)
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9-1.png) 

#### Plot more data


```r
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

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10-1.png) 

## Open States API

### Search OpenStates bills.


```r
os_billsearch(terms = 'agriculture', state = 'tx', chamber = 'upper')
```

```
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

### Search Legislators on OpenStates


```r
os_legislatorsearch(state = 'tx', party = 'democratic', active = TRUE)
```

```
#> <Sunlight data>
#>    Dimensions:   [63 X 29]
#> 
#>    last_name          updated_at nimsp_candidate_id         full_name
#> 1   Naishtat 2015-06-29 18:45:42             112047  Elliott Naishtat
#> 2     Romero 2015-06-29 18:45:42                 NA Ramon Romero, Jr.
#> 3  Gutierrez 2015-06-29 18:45:42             111938  Roland Gutierrez
#> 4     Israel 2015-06-29 18:45:42                 NA      Celia Israel
#> 5    Coleman 2015-06-29 18:45:42              99959    Garnet Coleman
#> 6    Guillen 2015-06-29 18:45:42             111937      Ryan Guillen
#> 7    Johnson 2015-06-29 18:45:42                 NA      Eric Johnson
#> 8      Moody 2015-06-29 18:45:42             100029      Joseph Moody
#> 9     Turner 2015-06-29 18:45:42             112130  Sylvester Turner
#> 10   Collier 2015-06-29 18:45:42                 NA    Nicole Collier
#> ..       ...                 ...                ...               ...
#> Variables not shown: +district_address (chr), first_name (chr),
#>      middle_name (chr), district (chr), id (chr), state (chr),
#>      votesmart_id (chr), party (chr), all_ids (list), leg_id (chr), active
#>      (lgl), transparencydata_id (chr), photo_url (chr), +capital_address
#>      (chr), url (chr), country (chr), created_at (chr), level (chr),
#>      nimsp_id (chr), chamber (chr), offices (list), suffixes (chr), email
#>      (chr), nickname (chr), +birth_date (chr)
```

## Influence Explorer API

### Search for entities

That is, politicians, individuals, or organizations with the given name


```r
ie_entities('Nancy Pelosi')
```

```
#> <Sunlight data>
#>    Dimensions:   [2 X 15]
#> 
#>                        name count_given firm_income count_lobbied
#> 1          Nancy Pelosi (D)           0           0             0
#> 2 Nancy Pelosi for Congress           7           0             0
#> Variables not shown: seat (chr), total_received (dbl), state (chr),
#>      lobbying_firm (lgl), count_received (int), party (chr), total_given
#>      (dbl), type (chr), id (chr), non_firm_spending (dbl), is_superpac
#>      (lgl)
```

### Contributions by industries

Return the top contributoring companies by industry, ranked by total dollars given. The `entity_id` of `ba400a177400497680cac90f678ecb8f` is the identifier for _oil and gas_.


```r
ie_industries(method='top_org', entity_id='ba400a177400497680cac90f678ecb8f')
```

```
#>    employee_amount total_amount total_count                         name
#> 1       1686382.70   4198380.29        2767            Chesapeake Energy
#> 2       2736266.00   2788916.00         247              Chief Oil & Gas
#> 3                0   2521532.64         498  TEXAS OIL & GAS ASSOCIATION
#> 4        302130.38   2145832.38        3139                 Marathon Oil
#> 5        832984.00   1574534.00        1074         Occidental Petroleum
#> 6        922226.00   1532870.00        1302                     USX Corp
#> 7       1461206.00   1461206.00         799        Oil & Gas Investments
#> 8       1253908.87   1253908.87         120           Hyperion Resources
#> 9        770779.24   1201643.79         946 American Petroleum Institute
#> 10      1107871.62   1107871.62         275           Beecherl Companies
#>    direct_count employee_count                               id
#> 1          1983            784 4966257e103a45f5b13d901058b0c0be
#> 2            34            213 f2df5e19f0b449beb19c4d3b7f062245
#> 3           498              0 820a996e87254cfbac33884434150ce0
#> 4          2758            381 894b0134033448daa5208aa97455575b
#> 5           815            259 74f871b3928c49d39d004c08aec1e2a2
#> 6           814            488 8e95d7fa12f74aa387b2c880fb20df65
#> 7             0            799                             <NA>
#> 8             0            120 8d348514c5484120b05ee75929650534
#> 9           312            634 83bfbee9757c42308f4c7d0598cbdce3
#> 10            0            275 5d92d3d625f8422db0d630f2ef9693c7
#>    direct_amount
#> 1     2511997.59
#> 2       52650.00
#> 3     2521532.64
#> 4     1843702.00
#> 5      741550.00
#> 6      610644.00
#> 7              0
#> 8              0
#> 9      430864.55
#> 10             0
```

### Contributions by a certain amount


```r
ie_contr(recipient_state='al', for_against='for', amount='>|1000000')
```

```
#> <Sunlight data>
#>    Dimensions:   [8 X 41]
#> 
#>             seat committee_ext_id seat_held recipient_party
#> 1 state:governor                                          R
#> 2 state:governor                                          D
#> 3 state:governor                                          R
#> 4   state:office                                          R
#> 5   state:office                                          R
#> 6 state:governor                                          R
#> 7 state:governor                                          R
#> 8 state:governor                                          D
#> Variables not shown: transaction_type_description (chr), recipient_type
#>      (chr), seat_status (chr), recipient_state (chr), contributor_category
#>      (chr), contributor_gender (chr), contributor_state (chr),
#>      recipient_category (chr), is_amendment (lgl), district (chr),
#>      organization_name (chr), recipient_ext_id (chr),
#>      parent_organization_name (chr), contributor_address (chr),
#>      transaction_id (chr), contributor_occupation (chr), filing_id (chr),
#>      contributor_city (chr), recipient_state_held (chr), district_held
#>      (chr), recipient_name (chr), organization_ext_id (chr),
#>      contributor_zipcode (chr), transaction_namespace (chr), date (chr),
#>      committee_name (chr), candidacy_status (lgl),
#>      parent_organization_ext_id (chr), cycle (int), contributor_name
#>      (chr), contributor_type (chr), contributor_employer (chr),
#>      seat_result (chr), transaction_type (chr), amount (chr),
#>      contributor_ext_id (chr), committee_party (chr)
```
