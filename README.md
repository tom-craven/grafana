# graphana
A dockerfile for the Graphana client. 

###Build it yourself
build and run locally
>docker build
--build-arg USER=1000 --build-arg USER_GROUP=1000
-t graphana-local .
&& docker run
-p 3000:3000
--name graphana-local
graphana-local

connect to the Docker

>docker exec -i -t graphana-local /bin/bash
