
docker build . -t local:latest
docker run -e DYNAMO_TABLE_REGION=us-east-1 -e DYNAMO_TABLE_ENDPOINT=https://dynamodb.us-east-1.amazonaws.com -e DYNAMO_TABLE_ACCOUNT_NUMBER=417615409974 -e AARDVARK_API_LOCATION=http://localhost local:latest


#Endpoints

1. /repokid/roles/accounts/{accountId}
2. 

##Users
1. RepoKid
2. Aardvark

##Policies