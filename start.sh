#!/bin/bash

#building the image according to the Dockerfile
sudo docker image build -t jenkins-docker .

#running the image and configuring the ports
sudo  docker container run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins-docker

#checking if the docker is running corectly
sudo docker ps
