Explanation of Civic Issue (Education):
http://www.cde.ca.gov/nr/ne/yr14/yr14rel42.asp

Downloadable Cohort Data Sheets:
http://www.cde.ca.gov/ds/sd/sd/filescohort.asp

Reasoning for choosing this project:
In 2009 I became passionate about helping at-risk students 
graduate high school. There is a large percentage of California’s 
public school’s population dropping out, and it’s an issue that’s 
difficult to solve. Nonetheless, I wanted to find out why there 
were so many students dropping out. From 2009 to 2012 I visited 
schools and spoke to students about staying in school. Since I was 
a performing musician, I knew how music and changed my life and 
kept me going strong in school; so I developed several music 
education programs that could help students engage in their 
schoolwork and enjoy learning. 

Mission:
I’d like to pay another visit to my past research and look deeper 
into the statistics from the past few years by downloading state, 
county, district, and school graduation and dropout rates. I did 
some preliminary research and found two links (posted above), 
which show this info. I’m hoping to find something interesting and 
will look into this more in order to finish my proposal this week. 

Process:
#PART 1: Scraper

# create a directory titled final-project
mkdir -p final-project

#create helper.sh
nano helper.sh 

#make a new directory to hold TXT files
mkdir data-hold
cd data-hold

#download the TXT files into data-hold
curl http://stash.compciv.org/final-project/10_filescohort.txt
curl http://stash.compciv.org/final-project/11_filescohort.txt
curl http://stash.compciv.org/final-project/12_filescohort.txt
curl http://stash.compciv.org/final-project/13_filescohort.txt
____

#PART 2: Analyzer
cat data-hold/10_filescohort.txt | grep -oE '\bName|NumGraduates|NumDropouts|\b'
cat data-hold/11_filescohort.txt | grep -oE '\bName|NumGraduates|NumDropouts|\b'
cat data-hold/12_filescohort.txt | grep -oE '\bName|NumGraduates|NumDropouts|\b'
cat data-hold/13_filescohort.txt | grep -oE '\bName|NumGraduates|NumDropouts|\b'

#PART 3: Present Data 
#Data is represented on a Google Fusion table that includes (# of graduats and # of dropouts)












