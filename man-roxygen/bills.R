#' @param query Allows wildcards, quoting for phrases, and nearby word operators (full reference).
#' You can also retrieve highlighted excerpts, and all normal operators and filters.
#' @param highlight (logical) If TRUE, looks for words in query param close to each other.
#' @param bill_id The unique ID for this bill. Formed from the bill_type, number, and congress.
#' @param bill_type The type for this bill. For the bill 'H.R. 4921', the bill_type represents the
#' 'H.R.' part. Bill types can be: hr, hres, hjres, hconres, s, sres, sjres, sconres.
#' @param number The number for this bill. For the bill 'H.R. 4921', the number is 4921.
#' @param congress The Congress in which this bill was introduced. For example, bills introduced in
#' the '111th Congress' have a congress of 111.
#' @param chamber The chamber in which the bill originated.
#' @param introduced_on The date this bill was introduced.
#' @param last_action_at The date or time of the most recent official action. In the rare case that
#' there are no official actions, this field will be set to the value of introduced_on.
#' @param last_vote_at The date or time of the most recent vote on this bill.
#' @param last_version_on The date the last version of this bill was published. This will be set to
#' the introduced_on date until an official version of the bill's text is published.
#' @param nicknames An array of common nicknames for a bill that don't appear in official data.
#' These nicknames are sourced from a public dataset at unitedstates/bill-nicknames, and will only
#' appear for a tiny fraction of bills. In the future, we plan to auto-generate acronyms from bill
#' titles and add them to this array.
#' @param keywords A list of official keywords and phrases assigned by the Library of Congress.
#' These keywords can be used to group bills into tags or topics, but there are many of them (1,023
#' unique keywords since 2009, as of late 2012), and they are not grouped into a hierarchy. They
#' can be assigned or revised at any time after introduction.
#' @param sponsor_id The bioguide ID of the bill's sponsoring legislator, if there is one. It is
#' possible, but rare, to have bills with no sponsor.
#' @param cosponsor_ids An array of bioguide IDs for each cosponsor of the bill. Bills do not
#' always have cosponsors.
#' @param cosponsors_count The number of active cosponsors of the bill.
#' @param withdrawn_cosponsor_ids An array of bioguide IDs for each legislator who has withdrawn
#' their cosponsorship of the bill.
#' @param withdrawn_cosponsors_count The number of withdrawn cosponsors of the bill.
#' @param committee_ids A list of IDs of committees related to this bill.
#' @param related_bill_ids A list of IDs of bills that the Library of Congress has declared
#' 'related'. Relations can be pretty loose, use this field with caution.
#' @param enacted_as.congress The Congress in which this bill was enacted into law.
#' @param enacted_as.law_type Whether the law is a public or private law. Most laws are public
#' laws; private laws affect individual citizens. 'public' or 'private'.
#' @param enacted_as.number The number the law was assigned.
#' @param history.active Whether this bill has had any action beyond the standard action all bills
#' get (introduction, referral to committee, sponsors' introductory remarks). Only a small
#' percentage of bills get this additional activity.
#' @param history.active_at If this bill got any action beyond initial introduction, the date or
#' time of the first such action. This field will stay constant even as further action occurs. For
#' the time of the most recent action, look to the last_action_at field.
#' @param history.house_passage_result The result of the last time the House voted on passage. Only
#' present if this vote occurred. 'pass' or 'fail'.
#' @param history.house_passage_result_at   The date or time the House last voted on passage. Only
#' present if this vote occurred.
#' @param history.senate_cloture_result The result of the last time the Senate voted on cloture.
#' Only present if this vote occurred. 'pass' or 'fail'.
#' @param history.senate_cloture_result_at The date or time the Senate last voted on cloture. Only
#' present if this vote occurred.
#' @param history.senate_passage_result The result of the last time the Senate voted on passage.
#' Only present if this vote occurred. 'pass' or 'fail'.
#' @param history.senate_passage_result_at The date or time the Senate last voted on passage. Only
#' present if this vote occurred.
#' @param history.vetoed Whether the bill has been vetoed by the President. Always present.
#' @param history.vetoed_at The date or time the bill was vetoed by the President. Only present if
#' this happened.
#' @param history.house_override_result The result of the last time the House voted to override a
#' veto. Only present if this vote occurred. 'pass' or 'fail'.
#' @param history.house_override_result_at The date or time the House last voted to override a veto.
#' Only present if this vote occurred.
#' @param history.senate_override_result The result of the last time the Senate voted to override
#' a veto. Only present if this vote occurred. 'pass' or 'fail'.
#' @param history.senate_override_result_at The date or time the Senate last voted to override a
#' veto. Only present if this vote occurred.
#' @param history.awaiting_signature Whether the bill is currently awaiting the President's
#' signature. Always present.
#' @param history.awaiting_signature_since The date or time the bill began awaiting the President's
#' signature. Only present if this happened.
#' @param history.enacted Whether the bill has been enacted into law. Always present.
#' @param history.enacted_at The date or time the bill was enacted into law. Only present if this
#' happened.
#' @param sponsor.party XXX
#' @param bill_type__in XXX
#' @param history.house_passage_result__exists XXX
#' @param history.senate_passage_result__exists XXX
