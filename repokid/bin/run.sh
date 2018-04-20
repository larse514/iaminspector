#!/bin/sh

echo "Starting replacement"
sed -i -e "s/<DYNAMO_TABLE_REGION>/$DYNAMO_TABLE_REGION/g" config.json
sed -i -e "s/<DYNAMO_TABLE_ENDPOINT>/$DYNAMO_TABLE_ENDPOINT/g" config.json
sed -i -e "s/<DYNAMO_TABLE_ACCOUNT_NUMBER>/$DYNAMO_TABLE_ACCOUNT_NUMBER/g" config.json
#make a weird @ substitution so we can use URLS
sed -i -e "s@<AARDVARK_API_LOCATION>@$AARDVARK_API_LOCATION@g" config.json

exec ./repokidproxy