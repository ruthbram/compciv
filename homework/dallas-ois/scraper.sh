#Download data
curl http://www.dallaspolice.net/ois/ois.html -o data-hold/ois.html

#Download all Past year pages in the sidebar
for year in $(seq 2003 2012)
do
fname="ois_$year.html"
curl "http://www.dallaspolice.net/ois/$fname" -o "data-hold/$fname"
done

#Download Narrative case files
for pdf in $(cat data-hold/*.html | pup 'a attr{href}' | grep 'pdf')
do
curl "http://www.dallaspolice.net/$pdf" -o "data-hold/pdfs"
done
