sort "data-hold/names-nationwide/yob$1.txt" | cut -d ',' -f 1,2 > "data-hold/lost-$1.txt"
sort "data-hold/names-nationwide/yob$2.txt" | cut -d ',' -f 1,2 > "data-hold/lost-$2.txt"
grep -Fvf "data-hold/lost-$2.txt" "data-hold/lost-$1.txt"
