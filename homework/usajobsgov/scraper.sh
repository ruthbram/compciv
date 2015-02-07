dir=$(date +%Y-%m-%d)
mkdir -p data-hold/scrapes/$dir

jobcodes=$(cat data-hold/OccupationalSeries.xml | grep -oE '<JobFamily>[0-9]{4}' | grep -oE '[0-9]{4}' | sort | uniq)

url="https://data.usajobs.gov/api/jobs?page=1&numberofjobs=250"


for jobcode in $jobcodes
        do
        #url="https://data.usajobs.gov/api/jobs?page=1&NumberOfJobs=250&series" 
        #fname="$dir/jobcode-$page_number.json"
        #curl -s "$url=$jobcode" -o $fname
        #        echo curl -s "$url=$jobcode" -o $fname
        #total_pages=$(cat $fname | jq -r '.Pages')
echo $jobcodes
done
