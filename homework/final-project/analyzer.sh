#Run this script after the Pre-Analyzer script

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


