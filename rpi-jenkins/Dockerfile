FROM resin/rpi-raspbian:latest

MAINTAINER Peter LaValle <peter.lavalle@gmail.com>
# previously Martin Dilger <martin@effectivetrainings.de>

EXPOSE 8080

# setup pal's build enviroment
USER root
    # be sure we're up to date
        RUN apt-get update
        RUN apt-get upgrade
        RUN apt-get -qy install curl ca-certificates
        RUN apt-get update
        RUN apt-get upgrade
    # do obvious plugin installs

        RUN apt-get install -y wget
        RUN apt-get install -y oracle-java8-jdk
        RUN apt-get install -y build-essential
        RUN apt-get install -y mercurial
        RUN apt-get install -y openssh-client
        RUN apt-get install -y git
    # docker in docker? well ... how else am I going to build these images ;)
    #    RUN curl -sSL https://get.docker.com | sh

#install python - docker-compose has some dependencies
    RUN apt-get install -y python
    RUN wget https://bootstrap.pypa.io/get-pip.py
    RUN python get-pip.py
    RUN pip install jsonschema

# install docker-compose
    # (pal doesn't know what this is)
    RUN pip install docker-compose

# install shipwright
    # (again - pal doesn't know what this is)
    RUN pip install shipwright

# setup the user
    RUN mkdir /var/jenkins_home
    ENV JENKINS_HOME /var/jenkins_home
    RUN groupadd -r jenkins && useradd -d $JENKINS_HOME jenkins -g jenkins
    RUN chown -R jenkins /var/jenkins_home
    RUN mkdir /var/jenkins_work
    RUN chown -R jenkins /var/jenkins_work
    RUN chown -R jenkins /usr/local
    RUN usermod -a -G root jenkins
    WORKDIR /var/jenkins_home
    ENV JENKINS_HOME=/var/jenkins_home

# finally ... run it!
USER jenkins
    WORKDIR /var/jenkins_work
    # setup ssh known hosts
        RUN mkdir -p ~/.ssh
        RUN echo '|1|mNWNWhF2pCKCzIt2KYvlXhidoJ0=|gVpjYgPRSp3VwsetLl5UlakszMw= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==' >> ~/.ssh/known_hosts
        RUN echo '|1|QqoqWw5ZsEvIkAIvSOCMcyeRs/w=|EG8/rHzWFPXSR32XviRyBVmMmn4= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==' >> ~/.ssh/known_hosts
        RUN echo '|1|7WxXWEmgs7asFlVePcg5Xk5UQP8=|GHfDln9FKn+ObvQxMNxxsaI9bDk= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==' >> ~/.ssh/known_hosts
        RUN echo '|1|Y2OywWi5CKvplMuX8djn449bJqA=|Ba7ZxfBABo7XQhRK6hzybrykw68= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==' >> ~/.ssh/known_hosts
        RUN echo '|1|k4ASrlPedzbC8jXi/VV+4yrHmc4=|68rniQ2qpFZscfxznmGZO5O8uA8= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==' >> ~/.ssh/known_hosts
        RUN echo '|1|t5KiTOC6OFanqwd4iEk0yECwvtQ=|Ihi9FNFbOEqkFFL6A+3kfVq3TOc= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==' >> ~/.ssh/known_hosts
    # oh hai!
        RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
        CMD java -jar /var/jenkins_work/jenkins.war

