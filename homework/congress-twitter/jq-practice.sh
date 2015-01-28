# 1. In legislators-current.json, print the last name of the first Congressmember listed in the array

echo '1.'
cat data-hold/legislators-current.json | jq '.[0] .name .last'


# 2. In legislators-current.json, print the bioguide id of the 112th Congressmember

echo '2.'
cat data-hold/legislators-current.json | jq '.[111] .id .bioguide'


# 3. * In legislators-current.json, print the start date of the 3rd term of the 14th-listed Congressmember

echo '3.'
cat data-hold/legislators-current.json | jq '.[13] .terms[2] .start'


# 4. * In legislators-current.json, print the first name, last name, and the birthdate date of the 5th-listed congressmember - one item on each line is fine

echo '4.'
cat data-hold/legislators-current.json | jq '.[4] | .name .first, .name .last, .bio .birthday'


# 5. * In legislators-current.json, print the birthdates of the 10 youngest congressmembers

echo '5.'
cat data-hold/legislators-current.json | jq '.[] .bio .birthday' | sort -r | head -n 10 | tr -d '"'


# 6. In legislators-current.json, print the list of religious affiliations - including null, in descending-order of frequency

echo '6.'
cat data-hold/legislators-current.json | jq '.[] .bio .religion' | sort | uniq -c| sort -n -r


# 7. * In legislators-current.json, Print the number of incoming Congressmembers

echo '7.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[0] .start' | sort | cut -d '-' -f 1 | grep -c '2015'

# 8. In legislators-current.json, Print the start year of the longest-serving Congressmember

echo '8.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[0] .start' | uniq | sort | cut -d '-' -f 1 | head -n 1

# 9. * In legislators-current.json, print the number of Republican congressmembers

echo '9.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[-1:][0].party' | grep -c 'Republican'


# 10. In legislators-current.json, print the number of Congressmembers who are neither Republican nor Democratic

echo '10.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[-1:][0].party' | grep -c 'Independent'


# 11. * In legislators-current.json, get the list of all .rss_url entries, with duplicates removed, and in alphabetical order, and print just the first 10 lines:

echo '11.'
cat data-hold/legislators-current.json | jq --raw-output '.[] .terms[] .rss_url' | grep -v 'null' | sort | uniq | head -n 10


# 12. * In legislators-social-media.json, print the number of Twitter accounts

echo '12.'
cat data-hold/legislators-social-media.json | jq '.[] .social .twitter' | grep -v 'null' | wc -l


# 13. In legislators-social-media.json, print the number of Facebook accounts

echo '13.'
cat data-hold/legislators-social-media.json | jq '.[] .social .facebook' | grep -v 'null' | wc -l


# 14. * In legislators-social-media.json, print the first 10 lines of a comma-separated list of all bioguideIDs, along with Twitter screen names (if they have one), in alphabetical order of Twitter screen names

echo '14.'
cat data-hold/legislators-social-media.json | jq --raw-output '.[] | [.id .bioguide, .social .twitter] | @csv' | head -n 10


# 15. In legislators-social-media.json, repeat Step 14, but filter it to print only the lines that do not have a Twitter account listed

echo '15.'
cat data-hold/legislators-social-media.json | jq --raw-output '.[] | [.id .bioguide, .social .twitter] | @csv' | grep '-v' '[.social .twitter]'| head -n 16


# 16. * In congress-twitter-profiles.json, print the number of verified Twitter accounts.

echo '16.'
cat data-hold/congress-twitter-profiles.json | jq '.[] .verified' | grep 'true' | wc -l


# 17. In congress-twitter-profiles.json, print the largest follower count

echo '17.'
cat data-hold/congress-twitter-profiles.json | jq '.[] .followers_count' | sort -n -r | head -n 1


# 18. * In congress-twitter-profiles.json, print the first 10 lines of: CSV of name, screen_name, followers_count, verified, and created_at - when the account was created:

echo '18.'
cat data-hold/congress-twitter-profiles.json | jq --raw-output '.[] | [.name, .screen_name, .followers_count, .verified, .created_at] | @csv' | head -n 10


# 19. In congress-twitter-profiles.json, print the first 10 lines of: a CSV of .screen_name, .statuses_count, .followers_count, .created_at of their most recent tweet

echo '19.'
cat data-hold/congress-twitter-profiles.json | jq --raw-output '.[] | [.screen_name, .statuses_count, .followers_count, .created_at] | @csv' | head -n 10

