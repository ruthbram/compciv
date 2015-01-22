cat data-hold/* | pup "p text{}" > textonly.txt
cat data-hold/* | pup "div.legacy-para text{}" >  othertext.txt

cat textonly.txt othertext.txt| grep -o -E '[[:alpha:]]{7,}' | sort | uniq -c | sort -r | head -n 10

