datafile='data-hold/namesample.txt'

if [[ $# -eq 0 ]]
then
echo 'Type in at least one name.'
else
	for name in "$@"
	do
	name_matches=$(cat $datafile | grep "$name")
	
	m_count=0
	f_count=0

	for row in $name_matches
	do
		babies=$(echo $row | cut -d ',' -f '3')
	if [[ $row =~ ',M,' ]]
	then
		m_count=$((m_count + babies))
	else
		f_count=$((f_count + babies))
		fi
		done

	total_babies=$((m_count + f_count))

	if [[ $total_babies -eq 0 ]]
	then
	echo "There's 0 babies with the name: $name"
		else
			pct_female=$((100 * f_count / total_babies))
			if [[ $pct_female -ge 50 ]]
			then
				g_and_pct="F,$pct_female"
				echo "$name,$g_and_pct,$total_babies"
			else
				g_and_pct="M,$((100 - pct_female))"
				echo "$name,$g_and_pct,$total_babies"
			fi

fi
done
fi

