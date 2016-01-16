#!/bin/bash
docker run --name jenkinsdata -v /root/.jenkins_home:/var/jenkins_home resin/rpi-raspbian:jessie bash
docker run --restart=always -d -p 8080:8080 -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock --volumes-from jenkinsdata -v /lib/arm-linux-gnueabihf/libudev.so.1:/lib/arm-linux-gnueabihf/libudev.so.1  -v /lib/arm-linux-gnueabihf/libdevmapper.so.1.02.1:/lib/arm-linux-gnueabihf/libdevmapper.so.1.02.1 dilgerm/rpi-jenkins
