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


https://medium.com/@aiiflo/kafka-monitor-producer-metrics-with-prometheus-and-grafana-3ac0ef2ee29f

https://grafana.com/grafana/plugins/foursquare-clouderamanager-datasource
