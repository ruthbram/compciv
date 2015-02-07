<<<<<<< HEAD
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
=======
dir=$(date +%Y-%m-%d_%H00)
mkdir -p $dir
cat data-hold | grep -oE '<JobFamily>[0-9]{4}' | grep -oE '[0-9]+' | sort | uniq 
url="https://data.usajobs.gov/api/jobs?page=1&numberofjobs=250

# jobcode for loop (as demoed in class)
for jobcode in $jobcodes  
        do
        url="https://data.usajobs.gov/api/jobs?page=1&NumberOfJobs=250&series" 
        fname="$dir/jobcode-$page_number.json"
        curl -s "$url=$jobcode" -o $fname
                echo curl -s "$url=$jobcode" -o $fname
        total_pages=$(cat $fname | jq -r '.Pages')

# page number for loop (as demoed in class)
for pnum in $(seq 2 $total_pages)
        do
        url="https://data.usajobs.gov/api/jobs?page=pnum&NumberOfJobs=250&series" 
        fname="$dir/jobcode-$pnum.json"
        curl -s "$url=$jobcode" -o $fname       
                echo curl -s "$url=$jobcode" -o $fname
done
done
>>>>>>> 17471fbde1a1878eb857ff3623d3bbf6fd0e48ee
