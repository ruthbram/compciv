#HEADER for INCIDENTS
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
   | @csv' |  csvfix order -osep '|'  -f 1,2,3,4,5,6,7,8,9,10,11 
while read -r incident
do

cat geocodes.psv
echo "$incident"

blah="geocodes.psv"
latitude=$(cat geocodes.psv/$blah | csvfix sort -f 2 | grep 'location' | cut -d "|" -f 2`)
longitude=$(cat tables/$blah | csvfix sort -f 3 | grep 'location' | cut -d "|" -f 3)

blob="data-hold/pdfs/OIS_year_$.txt"
narrative=$(cat $blob | grep 'narrative')


# Print all final fields for Incidents
echo "$case_number|$date|$address|$suspect_status|$suspect_weapon|$suspects|$officers|$grand_jury|$latitude|$longitude|$narrative"
# >> tables/incidents.psv
done


#HEADER for OFFICERS
echo 'case_number|date|suspect_killed|suspect_weapon|last_name|first_name|race|gender'
#> tables/officers.psv

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
   | @csv' |  csvfix order -osep '|'  -f 1,2,4,5,6,7,8,9 | while read -r officer
do

cat data-hold/ois.html
while read -r officer
do
case_number=$(echo $officer | cut -d '|' -f 1)
date=$(echo $officer | cut -d '|' -f 2)
suspect_killed=$(echo $officer | cut -d '|' -f 3)
suspect_weapon=$(echo $officer | cut -d '|' -f 4)
last_name=$(echo $officer | cut -d '|' -f 5)
first_name=$(echo $officer | cut -d '|' -f 5)
race=$(echo $officer | cut -d '|' -f 6)
gender=$(echo $officer | cut -d '|' -f 7)

echo'$case_number|$date|$suspect_killed|$suspect_weapon|$last_name|$first_name|$race|$gender'
# >> tables/officers.psv


#HEADER for SUSPECTS
echo 'case_number|date|suspect_weapon|last_name|first_name'
#> tables/suspects.psv

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
   | @csv' |  csvfix order -osep '|'  -f 1,2,5,6,7
while read -r suspects
do

case_number=$(echo $officer | cut -d '|' -f 1)
date=$(echo $officer | cut -d '|' -f 2)
suspect_weapon=$(echo $officer | cut -d '|' -f 3)
last_name=$(echo $officer | cut -d '|' -f 4)
first_name=$(echo $officer | cut -d '|' -f 5)

echo'$case_number|$date|$suspect_weapon|$last_name|$first_name'
# >> tables/suspects.psv
