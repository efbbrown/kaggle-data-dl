#!/bin/bash

# Check for new competitions on kaggle.com
# python scrape-comps.py

p=$1

printf "New comp: $p\n"
# Get the names of each competition dataset
python comp-data-files.py $p
# Create data directory to save downloaded data in
mkdir /tmp/data
# For each dataset in the competition:
while read q; do
	printf "Data file: $q\n"
	# Download the dataset to the data directory
	./dl-data.sh $p $q
done < comp_data_files.txt
ls /tmp/data/ | cat
# Stop & remove new instance
# docker-machine stop $NAME
# docker-machine rm -y $NAME