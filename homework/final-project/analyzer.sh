#Reference these file names to parse data: 0910cohortdata.txt  1011cohortdata.txt  1112cohortdata.txt  1213cohortdata.txt  locations.txt
#In each file, I'm looking for CDS, Name, NumGraduates, and NumDropouts.
#Then I will attach the addresses, located in locations.txt


#Make new directory to hold csv files

#Loop through the four txt files to output
#CDS, Name, NumGraduates, NumDropouts, and Addresses
for thing in 0910 1011 1112 1213; do
    fname="csv-files/${thing}.csv"
    echo 'Cohord data for $thing' > $fname/finaldata.csv
    echo 'CDS|Name|NumGraduates|NumDropouts' >> $fname/finaldata.csv
    echo $thing
    cat data-hold/${thing}cohortdata.txt | cut -f 1,2,8,10 | grep -v '*' >> $fname/finaldata.csv

#Continue lool to attach the addresses
    cat data-hold/${thing}cohortdata.txt | grep 'FEM' | grep '9' |
    csvfix read_dsv -s '\t' -osep '|' -smq |
    while read -r line; do 
    # thing|thing2|thing3
    id=$(echo "$line" | cut -d '|' -f 1)
    addr=$(cat data-hold/locations.txt | grep $id | csvfix read_dsv -smq -s '\t' -osep '|' | cut -d '|' -f 14,15)
    stuff=$(echo "$line" | cut -d '|' -f 2,8,10)
    echo "$id|$addr|$stuff"
    done | grep -v '*' 
    >> finaldata.csv
done


