#!/bin/bash

# Load credentials
source ./credentials.cfg

# BUCKET=s3://kaggle-comp-data/
THIS_DIR=$(pwd)
LOCAL_DIR=$THIS_DIR

docker run -it --env aws_key=${S3_ACCESS} \
	--env aws_secret=${S3_SECRET} \
	--env cmd=interactive \
	-v ${LOCAL_DIR}:/opt/src \
	efbbrown/kaggle-data-dl:0.2.2
