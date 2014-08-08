#' @return THe output fields for each element are as follows.
#' 
#' \itemize{ 
#'  \item fiscal_year The fiscal year for the bill in which the earmark appears. 
#'  \item final_amount The earmark amount in the final version of the bill. 
#'  \item budget_amount The earmark amount in the President's budget proposal. 
#'  \item house_amount The earmark amount in the version of the bill passed by the House. 
#'  \item senate_amount The earmark amount in the version of the bill passed by the Senate. 
#'  \item omni_amount The earmark amount in the omnibus appropriations bill. 
#'  \item bill, bill_section, bill_subsection The bill, section and subsection where the earmark 
#'  appears. 
#'  \item description The earmark description. 
#'  \item notes Notes added by Taxpayers for Common Sense. 
#'  \item presidential Presidential earmarks are earmarks that appear in the President's initial 
#'  budget proposal.
#'   \tabular{ll}{
#'     blank \tab Not in the President's budget.\cr
#'     p \tab Included in the President's budget and disclosed by congress. R\cr
#'     u \tab Included in the President's budget and not disclosed by congress.\cr
#'     m \tab Included in the President's budget and sponsored by members.\cr
#'     j \tab Included at the request of the judiciary. 
#'   }
#'  \item undisclosed Taxpayers for Common Sense's determination of whether the earmarks was 
#'  disclosed by congress. Undisclosed earmarks are found by reading the bill text.
#'   \tabular{ll}{
#'     blank \tab Disclosed in congressional earmark reports.\cr
#'     u \tab Not disclosed by congress but found in bill text.\cr
#'     p \tab Not disclosed and in President's budget.\cr
#'     o \tab Disclosed Operations & Maintenance earmark.\cr
#'     m \tab tab Undisclosed Operations & Maintenance earmark. 
#'   }
#'  \item members The members that sponsored the earmark. Taxpayers for Common Sense lists the 
#'  members by last name, state and party. We have attempted to expand these to full names, where 
#'  possible. Due to formatting irregularities, state, party or full name are sometimes missing. 
#'  \item location The city and states where the earmark will be spent, when known. 
#'  \item recipients The organization that will receive the earmark, when known
#' }

