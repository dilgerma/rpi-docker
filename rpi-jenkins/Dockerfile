FROM dilgerm/rpi-app-base:jessie
MAINTAINER Martin Dilger <martin@effectivetrainings.de>

RUN mkdir /var/jenkins_home

ENV JENKINS_HOME /var/jenkins_home
RUN groupadd -r jenkins && useradd -d $JENKINS_HOME jenkins -g jenkins
RUN chown -R jenkins /var/jenkins_home

RUN apt-get update
RUN apt-get install -y wget nodejs npm git unzip

RUN mkdir /var/jenkins_work
RUN chown -R jenkins /var/jenkins_work
RUN chown -R jenkins /usr/local

USER jenkins
WORKDIR /var/jenkins_work

RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war

# setup pal's build enviroment
USER root
    RUN apt-get update
    RUN apt-get upgrade
    RUN apt-get update
    RUN apt-get upgrade
    RUN apt-get install -y build-essential
    RUN apt-get install -y mercurial
    RUN apt-get install -y openssh-client
    RUN apt-get install -y git


#install python - docker-compose has some dependencies
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install jsonschema

RUN pip install docker-compose

#shipwright
RUN pip install shipwright

RUN usermod -a -G root jenkins
WORKDIR /var/jenkins_home
ENV JENKINS_HOME=/var/jenkins_home

USER jenkins
CMD java -jar /var/jenkins_work/jenkins.war
