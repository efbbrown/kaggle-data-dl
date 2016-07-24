#!/bin/bash

# Load machine configuration
source config.cfg
source credentials.cfg

# Create new instance according to configuration
# ./machine-create.sh

# Activate environment of new instance
# eval $(docker-machine env $NAME)

# Check for new competitions on kaggle.com
python scrape-comps.py

/opt/main.sh

# For each new competition:
while read p; do
	printf "New comp: $p\n"
	# Get the names of each competition dataset
	python comp-data-files.py $p
	# Create data directory to save downloaded data in
	mkdir data/$p
	# For each dataset in the competition:
	while read q; do
		printf "Data file: $q\n"
		# Download the dataset to the data directory
		./dl-data.sh $p $q
		ls data/$p/ | cat
	done < comp_data_files.txt
	# Remove data_files file once all are in s3
	rm comp_data_files.txt
	# Send this data to an s3 bucket
	# ./docker-s3cmd.sh
	s3cmd put --recursive data/$p s3://kaggle-comp-data
	rm -r data/$p
	echo $p >> current_comps.txt
done < new_comps.txt
# Remove new comps file once all complete
rm new_comps.txt
# Stop & remove new instance
# docker-machine stop $NAME
# docker-machine rm -y $NAME