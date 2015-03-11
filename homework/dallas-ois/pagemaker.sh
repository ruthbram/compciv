#I tried to make a webpage, but I do not think it is completely right. I really tried, though!


#according to http://stackoverflow.com/questions/10006958/open-an-html-file-with-default-browser-using-bash-on-mac 
#how to open an html in browser
#my .html file titled untitled.html is stored on my desktop
#opened html file in browswer
open -a "$(/usr/local/bin/DefaultApplication -url 'http:')" "/afs/ir/users/r/c/rcbram/Desktop/untitled.html"

#inside my untitled.html file on my desktop, I have this information stored 
#html code taken from W3Schools website
<!DOCTYPE html>
<html>

<head>
  <title>Dallas Incidents Chart</title>
</head>

<body>
<p>
 <table bgcolor="white" border="1" bordercolor="black" cellpadding="2" cellspacing="0">
    <tbody><tr>

#Table for Incidents
#note: i don't have my incidents.psv file working, so this is not going to work. but, if it did, this could work.
cat tables/incidents.psv
while read -r incident
do
case_number=$(echo $incident | cut -d '|' -f 1)
date=$(echo $incident | cut -d '|' -f 2)
location=$(echo $incident | cut -d '|' -f 3)
suspect_status=$(echo $incident | cut -d '|' -f 4)
suspect_weapon=$(echo $incident | cut -d '|' -f 5)
suspects=$(echo $incident | cut -d '|' -f 6)
officers=$(echo $incident| cut -d '|' -f 7)
grand_jury=$(echo $incident | cut -d '|' -f 8)
latitude=$(echo $incident | cut -d '|' -f 9)
longitude=$(echo $incident | cut -d '|' -f 10)
narrative=$(echo $incident | cut -d '|' -f 11)
</p>
</body>
</html>
</tr>

#inside my untitled.html file on my desktop, I have this information stored 
#html code taken from W3Schools website
<!DOCTYPE html>
<html>

<head>
  <title>Dallas Officers Chart</title>
</head>

<body>
<p>
<table bgcolor="white" border="1" bordercolor="black" cellpadding="2" cellspacing="0">
    <tbody><tr>

#Table for Officers
#note: i don't have my officers.psv file working, so this is not going to work. but, if it did, this could work.
cat officers.psv
while read -r officer
do
case_number=$(echo $officer | cut -d '|' -f 1)
date=$(echo $officer| cut -d '|' -f 2)
location=$(echo $officer | cut -d '|' -f 3)
suspect_status=$(echo $officer | cut -d '|' -f 4)
suspect_weapon=$(echo $officer | cut -d '|' -f 5)
suspects=$(echo $officer | cut -d '|' -f 6)
officers=$(echo $officer | cut -d '|' -f 7)
grand_jury=$(echo $officer | cut -d '|' -f 8)
latitude=$(echo $officer | cut -d '|' -f 9)
longitude=$(echo $officer | cut -d '|' -f 10)
narrative=$(echo $officer | cut -d '|' -f 11)
</tr>
</p>
</body>
</html>
</tr>

#inside my untitled.html file on my desktop, I have this information stored 
#html code taken from W3Schools website
<!DOCTYPE html>
<html>

<head>
  <title>Dallas Suspects Chart</title>
</head>

<body>
<p>
<table bgcolor="white" border="1" bordercolor="black" cellpadding="2" cellspacing="0">
    <tbody><tr>
#Table for Suspects
#note: i don't have my suspects.psv file working, so this is not going to work. but, if it did, this could work.
cat suspects.psv 
while read -r suspects 
do
case_number=$(echo $suspect | cut -d '|' -f 1)
date=$(echo $suspect | cut -d '|' -f 2)
location=$(echo $suspect | cut -d '|' -f 3)
suspect_killed=$(echo $suspect | cut -d '|' -f 4)
suspect_weapon=$(echo $suspect | cut -d '|' -f 5)
last_name=$(echo $suspect | cut -d '|' -f 6)
first_name=$(echo $suspect | cut -d '|' -f 7)
race=$(echo $suspect | cut -d '|' -f 8)
gender=$(echo $suspect | cut -d '|' -f 9)
</tr>
</p>
</body>
</html>
</tr>
