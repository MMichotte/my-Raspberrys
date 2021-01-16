#!/bin/bash

ContentType="Content-Type: application/json"
Auth="X-Api-Key: 18ED4B56BF3B460CB46E460F361A834C"
FilePath='/home/martin/services/OctoPrint/api'
URL='http://192.168.1.101:5000/api/connection'

curl -X POST -H "$ContentType" -H "$Auth" -d @$FilePath/con.json $URL
