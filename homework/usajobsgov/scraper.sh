dir=$(date +%Y-%m-%d)
mkdir -p data-hold/scrapes/$dir

cat data-hold | grep -oE '<JobFamily>[0-9]{4}' | grep -oE '[0-9]+' | sort | uniq 

url="https://data.usajobs.gov/api/jobs?page=1&numberofjobs=$

for jobcode in $jobcode  
        do
        url="https://data.usajobs.gov/api/jobs?page=1&NumberOfJobs=250&series" 
        fname="$dir/jobcode-$page_number.json"
        curl -s "$url=$jobcode" -o $fname
                echo curl -s "$url=$jobcode" -o $fname
        total_pages=$(cat $fname | jq -r '.Pages')
done
