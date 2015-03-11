#Make directory to hold txt files
mkdir -p data-hold
cd data-hold

#Scrape Cohort Data 
curl http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=All&cYear=2012-13&cCat=Cohort&Cpage=filescohort > 1213cohortdata.txt
sleep1
curl http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=All&cYear=2011-12&cCat=Cohort&Cpage=filescohort > 1112cohortdata.txt
sleep1
curl http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=All&cYear=2010-11&cCat=Cohort&Cpage=filescohort > 1011cohortdata.txt
sleep 1
curl http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=All&cYear=2009-10&cCat=Cohort&cPage=filescohort > 0910cohortdata.txt
sleep 1

#Scrape locations of each school
curl ftp://ftp.cde.ca.gov/demo/schlname/pubschls.txt > locations.txt


