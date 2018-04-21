#!/bin/sh

# us-east-1
# https://dynamodb.us-east-1.amazonaws.com
# 417615409974
# http://localhost

IMAGE=$1
TAG=$2
REGION=$3
DYNAMO_REGION=$4
ACCOUNTS=$5
API_URL=$6

docker build . -t ${IMAGE}:${TAG}

docker run -p 5000:5000 -e DYNAMO_TABLE_REGION=${REGION} -e DYNAMO_TABLE_ENDPOINT=${DYNAMO_REGION}  -e DYNAMO_TABLE_ACCOUNT_NUMBER=${ACCOUNTS} -e AARDVARK_API_LOCATION=${API_URL} ${IMAGE}:${TAG}