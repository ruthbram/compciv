cat data-hold/names-nationwide/yob$1.txt | cut -d ',' -f 1,2 > "data-hold/$1-names.txt"
cat data-hold/names-nationwide/yob$2.txt | cut -d ',' -f 1,2 > "data-hold/$2-names.txt"

echo "data-hold/$2-names.txt  data-hold/$1-names.txt"



grep -vFf "data-hold/$2-names.txt" "data-hold/$1-names.txt" | sort
