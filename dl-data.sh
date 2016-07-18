#!/bin/bash

source config.cfg

eval $(docker-machine env $NAME)

docker build -t efbbrown/kaggle-data-dl .

URL_ROOT=https://www.kaggle.com/c/
COMP_NAME=state-farm-distracted-driver-detection/
URL_DL=download/
URL_FILE=
FILES="driver_imgs_list.csv.zip sample_submission.csv.zip"

for FILE in $FILES; do
	DATA_URL=$URL_ROOT$COMP_NAME$URL_DL$FILE
	wget -x -c --load-cookies cookies.txt -P data -nH --cut-dirs=5 $DATA_URL
done

# DATA_URL=diabetic-retinopathy-detection/download/trainLabels.csv.zip