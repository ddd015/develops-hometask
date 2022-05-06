#!/bin/bash
docker build -t hometask-image .
docker container stop dynamic
docker container rm dynamic
docker run -d --name dynamic -p8080:80 -v $(pwd):/files hometask-image
docker exec dynamic cp /files/index.php /var/www/html

