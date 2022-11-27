# Install and load libraries
pkg_load <- function(pkg_name) {
  if(!require(pkg_name, quietly = TRUE)) {
    install.packages(pkg_name)
  }
}
pkg_load("tidyverse")
pkg_load("reutils")

# search for staph data in pubmed db
ids <- reutils::esearch("staph[mesh]", "pubmed")
# use first UID for testing
staph <- ids[1]
print(staph)
# upload UIDs to Entrez history server
query_key <- epost(staph)
# parse the XML output 
ds <- esummary(query_key)
ds
df <- content(ds, "parsed")
df