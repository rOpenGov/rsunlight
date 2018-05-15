rsunlight 0.7.0
===============

Below changes mostly in response to APIs moving from Sunlight Labs to ProPublica.  (#64) (#67)

## NEW FEATURES

* Now importing packages `crul`, `tibble`, and `data.table` and no longer importing `httr`, `stringr`
* New functions `cg_bills_recent`, `cg_bills_recent_member`, `cg_bills_recent_subject`, `cg_bills_upcoming`, `cg_committee`, `cg_committee_comms`, `cg_committee_hearings`, `cg_committees_comms_category`, `cg_committees_comms_chamber`, `cg_committees_comms_date`, `cg_floor_actions_date`, `cg_floor_actions_recent`, `cg_members`, `cg_members_bill_cosponsors`, `cg_members_compare_bill_sponsors`, `cg_members_compare_votes`, `cg_members_leaving`, `cg_members_new`, `cg_members_state_district`, `cg_members_votes`, `cg_nomination`, `cg_nominations_category`, `cg_nominations_state`, `cg_state_party_countes`, `cg_statements_date`, `cg_statements_member`, `cg_statements_recent`, `cg_statements_search`, `cg_statements_subject`, `cg_statements_subjects`, `cg_votes_date`, `cg_votes_explanations`, `cg_votes_explanations_category`, `cg_votes_explanations_member`, `cg_votes_recent`, `cg_votes_senatenoms`, `cg_votes_type`, `os_committee`, `os_committees`, `os_district`, `os_districts`, `os_legislator`, `os_legislatorgeo`
* replace `httr` with `crul` (#65)

## DEFUNCT

* Now defunct because API services are gone: `cg_votes`, `cg_districts`, `cg_documents`, `cg_floor_updates`, `cg_hearings`, `cg_legislators`, `cw_dates`, `cw_phrases`, `cw_text`, `cw_timeseries` (#64) (#67)



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
