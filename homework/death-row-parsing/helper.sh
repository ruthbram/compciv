# Overall: download files for three states (TX, CA, FL) into a subdirectory called "data-hold"

# Start
mkdir data-hold
cd data-hold

# Download 2 TX html files
curl http://www.tdcj.state.tx.us/death_row/dr_offenders_on_dr.html -o txdrcurr.html
curl http://www.tdcj.state.tx.us/death_row/dr_list_all_dr_1923-1973.html -o txdrpast.html

# Download 3 FL html files
curl http://www.dc.state.fl.us/activeinmates/deathrowroster.asp -o fldrcurr.html
curl http://www.dc.state.fl.us/oth/deathrow/execlist.html -o flexlistcurr.html
curl http://www.dc.state.fl.us/oth/deathrow/execlist2.html -o flexlistpast.html

# Download 1 CA html file
curl http://www.cdcr.ca.gov/capital_punishment/docs/condemnedinmatelistsecure.pdf -o cadrcurr.html

