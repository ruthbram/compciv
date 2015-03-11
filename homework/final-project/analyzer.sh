#Reference these file names to parse data: 0910cohortdata.txt  1011cohortdata.txt  1112cohortdata.txt  1213cohortdata.txt  locations.txt

#Analyze 2009-2010 data
cat data-hold/0910cohortdata.txt | cut -f 1,2,8,10 | grep -v '*'

#Analyze 2010-2011 data
cat data-hold/1011cohortdata.txt | cut -f 1,2,8,10 | grep -v '*'

#Analyze 2011-2012 data
cat data-hold/1112cohortdata.txt | cut -f 1,2,8,10 | grep -v '*'

#Analyze 2012-2013 data
cat data-hold/1213cohortdata.txt | cut -f 1,2,8,10 | grep -v '*'

