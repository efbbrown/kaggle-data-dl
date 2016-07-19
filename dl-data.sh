#!/bin/bash

source config.cfg

eval $(docker-machine env $NAME)

docker build -t efbbrown/kaggle-data-dl .

URL_ROOT=https://www.kaggle.com/c/
# COMP_NAME=state-farm-distracted-driver-detection/
COMP_NAME=$1/
URL_DL=download/
URL_FILE=
FILES="driver_imgs_list.csv.zip sample_submission.csv.zip"
SAVE_DIR=$COMP_NAME/data

for FILE in $FILES; do
	DATA_URL=$URL_ROOT$COMP_NAME$URL_DL$FILE
	wget -x -c --load-cookies cookies.txt -P $SAVE_DIR -nH --cut-dirs=5 $DATA_URL
done

# DATA_URL=diabetic-retinopathy-detection/download/trainLabels.csv.zip
