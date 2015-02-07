dir=$(date +%Y-%m-%d_%H00)
mkdir -p data-hold/scrapes/$dir

jobcodes=$(cat data-hold | grep -oE '<JobFamily>[0-9]{4}' | grep -oE '[0-9]$)

url="https://data.usajobs.gov/api/jobs?page=1&numberofjobs=250

for jobcode in $jobcodes  
        do
        url="https://data.usajobs.gov/api/jobs?page=1&NumberOfJobs=250&series" 
        fname="$dir/jobcode-$page_number.json"
        curl -s "$url=$jobcode" -o $fname
                echo curl -s "$url=$jobcode" -o $fname
        total_pages=$(cat $fname | jq -r '.Pages')
for pnum in $(seq 2 $total_pages)
        do
        url="https://data.usajobs.gov/api/jobs?page=pnum&NumberOfJobs=250&series" 
        fname="$dir/jobcode-$pnum.json"
        curl -s "$url=$jobcode" -o $fname
        echo curl -s "$url=$jobcode" -o $fname
        done
done