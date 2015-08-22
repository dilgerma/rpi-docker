FROM rpidockers/java
MAINTAINER Martin Dilger <martin@effectivetrainings.de>

RUN mkdir /var/jenkins_home

ENV JENKINS_HOME /var/jenkins_home
RUN groupadd -r jenkins && useradd -d $JENKINS_HOME jenkins -g jenkins
RUN chown -R jenkins /var/jenkins_home

RUN apt-get update
RUN apt-get install -y wget nodejs npm git unzip libicu48 libfontconfig1 libjpeg8 libpng12-0

RUN mkdir /var/jenkins_work
RUN chown -R jenkins /var/jenkins_work
RUN chown -R jenkins /usr/local

USER jenkins
WORKDIR /var/jenkins_work

RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war

ENV NODE_VERSION 0.12.0
RUN wget http://assets.hypriot.com/node-v${NODE_VERSION}-linux-armv6hf.tar.gz 
RUN cd /usr/local && \
    tar --strip-components 1 -xzf /var/jenkins_work/node-v${NODE_VERSION}-linux-armv6hf.tar.gz &&\
    rm -rf /var/jenkins_work/node-v${NODE_VERSION}-linux-armv6hf.tar.gz   
 
RUN npm update && \
    npm install -g grunt grunt-cli


WORKDIR /var/jenkins_work
RUN wget https://github.com/piksel/phantomjs-raspberrypi/archive/master.zip 
RUN unzip master.zip
RUN mv phantomjs-raspberrypi-master/bin/phantomjs /usr/local/bin/phantomjs
RUN rm -rf phantomjs-raspberrypi-master
RUN chmod +x /usr/local/bin/phantomjs
ENV PHANTOMJS_BIN=/usr/local/bin/phantomjs

USER root
RUN apt-get install -y build-essential

USER jenkins
WORKDIR /var/jenkins_home
CMD java -jar /var/jenkins_work/jenkins.war

