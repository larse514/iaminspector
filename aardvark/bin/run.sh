#!/bin/sh


aardvark config --no-prompt -a $AARDVARK_ROLE
aardvark config --no-prompt -a $AARDVARK_DB_URI
aardvark config --no-prompt -a $AWS_ACCESS_KEY_ID
aardvark config --no-prompt -a $AWS_SECRET_ACCESS_KEY

aardvark update -a $ACCOUNTS


aardvark start_api -b 0.0.0.0:5000
