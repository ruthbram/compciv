#assign variable and make directory
username=$1
mkdir -p ./data-hold
file="./data-hold/$1"

#fetch & analyze tweetsy
echo "Fetching tweets for $1 into ./data-hold/$1"
t timeline -n 3200 --csv $1 > data-hold/$1
count=$(csvfix order -f 1 $file | wc -l)
lastdate=$(csvfix order -fn 'Posted at' $file | tail -n 1)
echo "Analyzing $count tweets by $1 since $lastdate"

#top 10 hashtags (#)
echo "Top 10 hashtags by $1"
cat $file | csvfix order -fn 'Text' | grep -oE '#[A-z0-9_]+' | sort | tr "[:upper:]" "[:lower:]" | uniq -c | sort -rn | head -n 10

#top 10 retweeted (RT) users
echo "Top 10 retweeted users by $1"
cat $file | csvfix order -fn 'Text' | grep -v "RT" | grep -oE '@[A-z0-9_]+' | sort | tr "[:upper:]" "[:lower:]" | uniq -c | sort -rn | head -n 10

#top 10 mentioned (@) users
echo "Top 10 mentioned users (not including retweets) by $1"
cat $file | csvfix order -fn 'Text' | grep -oE 'RT @[A-z0-9_]+' | grep -oE '@[A-z0-9_]+' | sort | tr "[:upper:]" "[:lower:]" | uniq -c | sort -rn | head -n 10

#top 10 tweeted words w/ >5 letters
echo "Top 10 tweeted words with >5 letters by $1"
cat $file | csvfix order -fn 'Text' | grep -oE '[[:alpha:]]{5,}' | sort | uniq -c | sort -rn | head -n 10

