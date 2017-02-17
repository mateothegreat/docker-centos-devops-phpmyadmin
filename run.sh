#!/bin/bash

docker rm -f phpmyadmin

docker run -id  -p 8888:80 \
                --name phpmyadmin \
                appsoa/docker-centos-devops-phpmyadmin

