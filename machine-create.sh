#!/bin/bash

source credentials.cfg
# source config.cfg

docker-machine create --driver amazonec2 \
					  --amazonec2-region $REGION \
					  --amazonec2-zone $ZONE \
					  --amazonec2-instance-type $INSTANCE_TYPE \
					  --amazonec2-vpc-id $VPC_ID \
					  --amazonec2-ssh-keypath $SSH_KEYPATH \
					  --amazonec2-security-group $SECURITY_GROUP \
					  --amazonec2-access-key $ACCESS_KEY \
					  --amazonec2-secret-key $SECRET_KEY \
		    		  $NAME
