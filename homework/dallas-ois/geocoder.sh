#Parse the information (Hint section) & output to CSV file
cat data-hold/*.html | pup 'table table tr json{}' | jq  --raw-output '.[] .children | [
    .[0] .children[0] .href,
    .[0] .children[0] .text,
    .[1] .text ,
    .[2] .text,
    .[3] .text,
    .[4] .text,
    .[5] .text,
    .[6] .text,
    .[7] .text
  ] | @csv' > geocodes_ois.csv

#Create data-hold folder to hold geocodes (a caching strategy)
mkdir -p 'data-hold/geocodes'

#Remove non-alphanum characters
some_location="2502 Grand Avenue"
some_slug=$(echo $some_location | sed s/[^A-z0-9]//g) # 2502GrandAvenue
some_filename="data-hold/geocodes/$some_slug.json"

#Caching strategy
#If file exists and is non-zero, then we don't need to download it
if [[ -s "$some_filename" ]]
then
echo "Already downloaded $some_filename"
else
echo "Going to geocode the file"
curl "https://maps.googleapis.com/maps/api/geocode/json?address=Dallas+TX"
fi

#Output final results & produce PSV text using the printf tool
printf '%s|%s|%s|\n' "$loc" "$lat" "$lng" >> tables/geocodes.psv
done
