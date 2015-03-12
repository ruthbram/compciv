#Reference these file names to parse data: 0910cohortdata.txt  1011cohortdata.txt  1112cohortdata.txt  1213cohortdata.txt  locations.txt
#In each file, I'm looking for CDS, Name, NumGraduates, and NumDropouts.
#Then I will attach the addresses, located in locations.txt
#And finally, I will place them in a CSV file titled finaldata.csv


output_file="finaldata.csv"
rm -f $output_file
# add the headers
head -n 1 csv-files/0910.csv > $output_file
for year in 0910 1011 1112 1213; do
    cat csv-files/${year}.csv |  sort -k 5 -t '|' | head -n 50 |
    while read -r line; do
      id=$(echo "$line" | cut -d '|' -f 2)
      # get the locations from the locations
      addr=$(cat data-hold/locations.txt | grep $id | csvfix read_dsv -smq -s '\t' -osep '|' | cut -d '|' -f 14,15)
      echo "$line|$addr" >> $output_file
    done
done


