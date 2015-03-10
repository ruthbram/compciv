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
   | @csv' | while read -r line; do

pdfurl=$(echo $line | csvfix order -smq -f 1)
full_url="http://www.dallaspolice.net/$pdfurl"
#curl -s $full_url -o /tmp/something.pdf
#pdftotext /tmp/something.pdf /tmp/something.txt
wget $full_url
echo "$line|$(cat /tmp/something.txt)"
sleep 1
done
