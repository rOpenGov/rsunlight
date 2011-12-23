#' Lookup bills on OpenStates.
#' @import RJSONIO RCurl stringr
#' @param state state two-letter abbreviation (character), required
#' @param session session of congress (integer), e.g., 2009-2010 = 20092010, required
#' @param billid identification number of bill (character), required
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_os_billlookup('ca', 20092010, 'AB667')
#' }
sll_os_billlookup <-

function(state, session, billid,
    url = "http://openstates.org/api/v1/bills/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs"))) 
{
  billid_ <- paste(str_extract(billid, ignore.case('[a-z]+')), 
      '%20', str_extract(billid, '[0-9]+'), sep = "")
  urlget <- paste(url, state, '/', session, '/', billid_, '/', '?apikey=', key, sep='')
  fromJSON(urlget)
}