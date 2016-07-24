#!/bin/bash

# Load credentials
source credentials.cfg

docker run -it \
	--env aws_key=${S3_ACCESS} \
	--env aws_secret=${S3_SECRET} \
	--env cmd=interactive \
	-v /:/opt/dest \
	garland/docker-s3cmd /bin/sh

/opt/main.sh
