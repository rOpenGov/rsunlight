# `govdat` #

`govdat` is a collection of functions to search and acquire data from various APIs for government data, including the Sunlight Labs Project at http://services.sunlightlabs.com/, and the New York Times Congress API at http://developer.nytimes.com/docs/congress_api.  

`govdat` wraps functions in APIs for:

 * Sunlight Labs Congress API (`cg`)
 * Sunlight Labs Transparency API (`ts`)
 * Sunlight Labs Open States API (`os`)
 * Sunlight Labs Real Time Congress API (`rt`) 
 * Sunlight Labs Capitol Words API (`cw`)
 * New York Times Congress API (`cg`)

Functions that wrap these sets of APIs will be prefixed by `sll` for Sunlight Labs, `nyt` for New York Times, and `cg`, `ts`, `os`, `rt`, and `cw` for the different methods above:

 * `sll` + `cg` + `fxn` 
 * `sll` + `ts` + `fxn` 
 * `sll` + `os` + `fxn` 
 * `sll` + `rt` + `fxn` 
 * `sll` + `cw` + `fxn`
 * `nyt` + `cg` + `fxn`

where `fxn` would be a wrapper function to a specific API method.  Other functions will be written to search across multiple API providers, and will not follow this format. 

Please get your own API keys if you plant to use these functions for Sunlight Labs (http://services.sunlightlabs.com/) and New York Times (http://developer.nytimes.com/apps/register).

Data from the New York Times API is provided by The New York Times.

<a border="0" href="http://developer.nytimes.com" ><img src="http://graphics8.nytimes.com/packages/images/developer/logos/poweredby_nytimes_200b.png" alt="NYT API" /></a>

Data from the Sunlight Foundation API is provided by Sunlight Foundation.

<a border="0" href="http://services.sunlightlabs.com/" ><img src="http://www.altweeklies.com/imager/b/main/5866471/f291/SunlightFoundationLogo_500wide.gif" alt="NYT API" /></a>

I set up the functions so that you can put the key in your .Rprofile file, which will be called on startup of R, and then you don't have to enter your API key for each run of a function. For example, put this in your .Rprofile file:

	# key for API access to the Sunlight Labs API methods
	options(SunlightLabsKey = "YOURKEYHERE")


This is a work in progress, so please fork and add to, suggest changes, etc. 