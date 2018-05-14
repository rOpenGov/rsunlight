#' Members functions
#'
#' @export
#' @name members
#' @param congress The number of the Congress this update took place during.
#' @param chamber The chamber this update took place in. 'house' or 'senate'.
#' @param member,member1,member2 A member ID
#' @param state A two character state code
#' @param district House of Representatives district number (House requests only)
#' @param type Type of bill. cosponsored or withdrawn
#' @param key your ProPublica API key; pass in or loads from environment variable
#' stored as `PROPUBLICA_API_KEY` in either your .Renviron, or similar file
#' locatd in your home directory
#' @param as (character) IGNORED FOR NOW
#' @param ... optional curl options passed on to [crul::HttpClient].
#' See [curl::curl_options()]
#' @return various things for now, since return objects vary quite a bit
#' among the different members routes
#' @examples \dontrun{
#' cg_members(congress = 115, chamber = "senate")
#' cg_member(member = 'K000388')
#' cg_members_new()
#' cg_members_state_district('senate', 'RI')
#' cg_members_leaving(congress = 115, chamber = "house")
#' cg_members_votes('K000388')
#' cg_members_compare_votes("G000575", "D000624", 114, "house")
#' cg_members_compare_bill_sponsors("G000575", "D000624", 114, "house")
#' cg_members_bill_cosponsors("B001260", "cosponsored")
#' }
cg_members <- function(congress, chamber, key = NULL, as = 'table', ...) {
  path <- file.path("congress/v1", congress, chamber, "members.json")
  res <- foo_bar(as, cgurl(), path, args = list(), key, ...)
  parse_members(res)
}

#' @export
#' @rdname members
cg_member <- function(member, key = NULL, as = 'table', ...) {
  path <- file.path("congress/v1/members", paste0(member, ".json"))
  foo_bar(as, cgurl(), path, args = list(), key, TRUE)
}

#' @export
#' @rdname members
cg_members_new <- function(key = NULL, as = 'table', ...) {

  path <- "congress/v1/members/new.json"
  res <- foo_bar(as, cgurl(), path, args = list(), key, ...)
  parse_members(res)
}

#' @export
#' @rdname members
cg_members_state_district <- function(chamber, state, district = NULL, key = NULL,
    as = 'table', ...) {

  path <- if (is.null(district)) {
    file.path("congress/v1/members", chamber, state, "current.json")
  } else {
    file.path("congress/v1/members", chamber, state, district, "current.json")
  }
  res <- foo_bar(as, cgurl(), path, args = list(), key, ...)
  tibble::as_tibble(as_dt(lapply(res$results, function(z) {
      z[vapply(z, class, character(1)) == "NULL"] <- NA_character_
      return(z)
  })))
}

#' @export
#' @rdname members
cg_members_leaving <- function(congress, chamber, key = NULL, as = 'table', ...) {

  path <- file.path("congress/v1", congress, chamber, "members/leaving.json")
  res <- foo_bar(as, cgurl(), path, args = list(), key, ...)
  parse_members(res)
}

#' @export
#' @rdname members
cg_members_votes <- function(member, key = NULL, as = 'table', ...) {

  path <- file.path("congress/v1/members", member, "votes.json")
  foo_bar(as, cgurl(), path, args = list(), key, TRUE, ...)
}

#' @export
#' @rdname members
cg_members_compare_votes <- function(member1, member2, congress, chamber, key = NULL,
    as = 'table', ...) {

  path <- file.path("congress/v1/members", member1, "votes", member2,
    congress, paste0(chamber, ".json"))
  foo_bar(as, cgurl(), path, args = list(), key, TRUE, ...)
}

#' @export
#' @rdname members
cg_members_compare_bill_sponsors <- function(member1, member2, congress, chamber, key = NULL,
    as = 'table', ...) {

  path <- file.path("congress/v1/members", member1, "bills", member2,
    congress, paste0(chamber, ".json"))
  res <- foo_bar(as, cgurl(), path, args = list(), key, ...)
  bills <- tibble::as_tibble(as_dt(lapply(res$results[[1]]$bills, function(z) {
      z[vapply(z, class, character(1)) == "NULL"] <- NA_character_
      return(z)
  })))
  res$results[[1]]$bills <- bills
  return(res)
}

#' @export
#' @rdname members
cg_members_bill_cosponsors <- function(member, type, key = NULL, as = 'table', ...) {

  path <- file.path("congress/v1/members", member, "bills", paste0(type, ".json"))
  res <- foo_bar(as, cgurl(), path, args = list(), key, ...)
  bills <- lapply(res$results[[1]]$bills, function(z) {
      z[vapply(z, class, character(1)) == "NULL"] <- NA_character_
      return(z)
  })
  res$results[[1]]$bills <- bills
  return(res)
}



## helpers -----
parse_members <- function(x) {
  out <- tibble::as_tibble(as_dt(lapply(x$results[[1]]$members, function(z) {
      z[vapply(z, class, character(1)) == "NULL"] <- NA_character_
      return(z)
  })))
  structure(out, found = x$results[[1]]$num_results)
}
