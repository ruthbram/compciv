#this code produces final readable results
#Parse the information & output to CSV file (Hint section)
mkdir -p tables
echo 'location|latitude|longitude' > tables/geocodes.psv


cat data-hold/*.html | pup 'table table tr json{}' | jq  --raw-output '.[] .children | [
    .[0] .children[0] .href,
    .[0] .children[0] .text,
    .[1] .text,
    .[2] .text,
    .[3] .text,
    .[4] .text,
    .[5] .text,
    .[6] .text,
    .[7] .text]
   | @csv' |  csvfix order  -f 4 | tr -d '"' | grep -v 'Location' | while read -r address; do

 stub=$(echo $address | tr ' ' '+')

 fname="data-hold/geocodes/$stub.json"

 latitude=$(cat $fname | jq '.results[0] .geometry .location .lat')
 longitude=$(cat $fname | jq '.results[0] .geometry .location .lng')
sleep1

 echo "$address|$latitude|$longitude" >> tables/geocodes.psv

done
