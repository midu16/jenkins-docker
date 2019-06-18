#!/bin/bash

#move the active directory tot he dockerfiles/ in order to build the docker image
cd dockerfiles/
#building the image according to the Dockerfile
sudo docker image build -t jenkins-docker .
#returnig to the start.sh
cd ../

# output the images on the host
echo " Output all the docker images on the Host!"
sudo docker images 
echo "##########################################"
sleep 2s

if [ ! -d logs/ ]; then
	# Control will enter here if host environment directory doesnt exists.
	mkdir logs/
	echo " The log-directory has been created!"
	#running the image and configuring the ports
	sudo  docker container run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins-docker > logs/jenkins-docker.log 2>&1
else
	echo " The log-directory existed! The informations on the jenkins-docker.log will be replaced!"
	sudo  docker container run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins-docker > logs/jenkins-docker.log 2>&1
fi

#checking if the docker is running corectly
echo " Output all the dockers running on the Host!"
sudo docker ps
echo "############################################"
