yearly_jobs=$(cat data-hold/scrapes/$1/*.json | jq '.JobData[] | select(.SalaryBasis == "Per Year")')
simple_rows=$(echo $yearly_jobs | jq '. | {JobTitle, SalaryMin, SalaryMax}')

echo $simple_rows | jq -r '.JobTitle' | sort | uniq -c | sort -r | head -n 25 | \
while read line; do
	job_title=$(echo $line | grep -oE '[[:alpha:]].*')
	job_listings=$(echo $simple_rows | jq -r "select(.JobTitle == \"$job_title\")") 
	#echo $job_listings | jq '.'
	min_salary=$(echo $job_listings | jq -r '.SalaryMin'| tr -d '$,' | sort -n | head -n 1)
	max_salary=$(echo $job_listings | jq -r '.SalaryMax'| tr -d '$,' | sort -nr | head -n 1)
	echo "$job_title | $min_salary | $max_salary"
done
