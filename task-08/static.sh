#!/bin/bash
docker container stop static
docker container rm static
docker run -d --name static -p8081:80 -v $(pwd):/files hometask-image
docker exec static cp /files/index.html /var/www/html
docker exec static rm /var/www/html/index.php

