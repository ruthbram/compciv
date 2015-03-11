storedcodes="data-hold/geocodes/"
mkdir -p $storedcodes

baseurl="https://maps.googleapis.com/maps/api/geocode/json?address="

#Parse the information & output to CSV file (Hint section)
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
   | @csv' |  csvfix order  -f 4 | tr -d '"' | grep -v 'Location'
while read -r address
do

 url=$(echo "https://maps.googleapis.com/maps/api/geocode/json?address=$address,Dallas,TX" | tr ' ' '+')
 echo $url

#download all urls with addresses (use sleep command)
fname="$(echo $address | tr ' ' '+').json"
curl -s "$url" > data-hold/geocodes/$fname
Sleep 2
echo $fname
# curl -s "$url" >> data-hold/geocodes/geocodes.json

done

