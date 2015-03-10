echo 'case_number|date|location|suspect_status|suspect_weapon|suspects|officers|grand_jury|latitude|longitude|narrative'
# > tables/incidents.psv

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
   | @csv' |  csvfix order -osep '|'  -f 2,3,4,5,6,7,8,9,10,11,12 | while read -r incident; do

#THIRD TRY (use this)

echo "$incident"

blah="geocodes.psv"
latitude=$(cat tables/$blah | grep  -f 2)
longitude=$(cat tables/$blah | grep  -f 3)

blob="data-hold/pdfs/OIS_year_$.txt"
narrative=$(cat $blob | grep 'narrative')

echo "$incident|$latitude|$longitude|$narrative"

# Print all final fields for Incidents
echo "$case_number|$date|$address|$suspect_status|$suspect_weapon|$suspects|$officers|$grand_jury|$latitude|$longitude|$narrative"
# >> tables/incidents.psv
done

#--------------
#FIRST TRY
# stub=$(echo $incident)
# fname="tables/geocodes.psv/$stub.json"
# latitude=$(cat $fname | jq '.results[0] .geometry .location .lat')
# longitude=$(cat $fname | jq '.results[0] .geometry .location .lng')
#--------------
#SECOND TRY
# lala=$(echo $incident)
# blah="tables/geocodes.psv/$lala"
# latitude=$(cat $blah | grep  -f 2)
# longitude=$(cat $blah |grep  -f 3)
#--------------
#PLACEHOLDERS
# latitude="latitude"
# longitude="longitude"
# narrative="narrative"
#--------------

#Header for Officers
#echo 'case_number|date|suspect_killed|suspect_weapon|last_name|first_name|race|gender' > tables/officers.psv

#Header for Suspects
#echo 'case_number|date|suspect_weapon|last_name|first_name' > tables/suspects.psv

