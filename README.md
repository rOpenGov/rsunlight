# govdat

`govdat` is a collection of functions to search and acquire data from various APIs for government data, including the Sunlight Labs Project at http://services.sunlightlabs.com/, and the New York Times Congress API at http://developer.nytimes.com/docs/congress_api.  

`govdat` wraps functions in APIs for:

 * Sunlight Labs Congress API 
 * Sunlight Labs Transparency API 
 * Sunlight Labs Open States API 
 * Sunlight Labs Real Time Congress API 
 * Sunlight Labs Capitol Words API 
 * New York Times Congress API

Functions that wrap these sets of APIs will be prefixed by (respectively from list above):

 * sll_cg_`fxn` 
 * sll_ts_`fxn` 
 * sll_os_`fxn` 
 * sll_rt_`fxn` 
 * sll_cw_`fxn`
 * nyt_cg_`fxn`

where `fxn` would be a wrapper function to a specific API method. 

Please get your own API keys if you plant to use these functions for Sunlight Labs (http://services.sunlightlabs.com/) and New York Times (http://developer.nytimes.com/apps/register).

I set up the functions so that you can either enter your API key on the actual call to each function or enter in your .Rprofile file, which will be called on startup of R, and then you don't have to enter your API key for each run of a function. 

See the Wiki for examples of function use. 

This is a work in progress, so please fork and add to, suggest changes, etc. 
