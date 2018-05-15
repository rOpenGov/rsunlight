rsunlight 0.7.0
===============

## NEW FEATURES

* xx (#xx)
* xx (#xx)
* xx (#xx)

## MINOR IMPROVEMENTS

* xx (#xx)
* xx (#xx)
* xx (#xx)

## DEFUNCT

* xx (#xx)
* xx (#xx)
* xx (#xx)



rsunlight 0.4.2
===============

## DEFUNCT

* Influence Explorer defunct as of January 2016. Thus, `ie_` functions
are now defunct in this package. (#57)


rsunlight 0.4
===============

## NEW FEATURES

* API keys can be now be stored as both an env var and an option. (#54)
* Most outputs by default are data.frames, and use the `dplyr::tbl_df` style  (#50)
* New function added `cg_documents()` for the [Congressional documents route](https://sunlightlabs.github.io/congress/congressional_documents.html) (#35)

## MINOR IMPROVEMENTS

* `rCharts` dependency removed. This package is still not on CRAN, so this is
simpler. In addition, CRAN wants all deps in a "mainstream" CRAN like repo. (#53)
* Started test suite (#32)
* Added ability to vectorize some parameters in some functions (#21)
* Added description of `n` parameter in the `cw_dates()` function man page (#2)
* Non base R functions are now explicitly imported, from `methods` and `utils` packages (#55)
* Set base URLs for each of the four Sunlight APIs in one place, less error prone in case they change their base URLs (#46)

## BUG FIXES

* Fixed bug due to unconventional object (`[`) returned when no data found in some Sunlight API routes (#51)
* Bug fixes to bills functions (#42)

rsunlight 0.3
===============

## NEW FEATURES

* Complete reworking of the package, function names, et.
* New Congress API, in functions `cg_*`
* Transparency API is now in function `ie_*`
* Beware: those that have used this package before. Most or all function names have changed. This version is _very_ breaking.

rsunlight 0.2
===============

## NEW FEATURES

* Changed package name to rsunlight, only holds functions to interact with Sunlight Labs APIs. NYtimes congress API functions moved to a new pacakge rtimes.


rsunlight 0.1
===============

## NEW FEATURES

* released to CRAN
