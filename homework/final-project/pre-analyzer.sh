#Reference these file names to parse data: 0910cohortdata.txt  1011cohortdata.txt $
#In each file, I'm looking for CDS, Name, NumGraduates, and NumDropouts.
#Then I will attach the addresses, located in locations.txt
#And finally, I will place them in a CSV file titled finaldata.csv

#Loop through the four txt files to output
#CDS, Name, NumGraduates, NumDropouts, and Addresses
for year in 0910 1011 1112 1213; do
    fname="csv-files/${year}.csv"
    echo "Cohort data for $year"
    echo 'Date|CDS|Name|NumGraduates|NumDropouts'   > $fname
    cat data-hold/${year}cohortdata.txt |
     csvfix read_dsv -s '\t' -osep '|' -smq |     # converts to pipes (don't change)
     grep 'All|All' | grep '|S|' | grep -v '*' |       # filters for each school
     # finally, select the columns, and add the year
     cut -f 1,2,8,10  -d '|' | sed "s/^/$year|/"   >> $fname
done

# Now run the Analyzer script
