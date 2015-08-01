FROM rpidockers/java
MAINTAINER Martin Dilger <martin@effectivetrainings.de>

RUN mkdir /opt/jenkins
WORKDIR /opt/jenkins

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y nodejs npm

RUN wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war

ENV NODE_VERSION 0.12.0
ADD http://assets.hypriot.com/node-v${NODE_VERSION}-linux-armv6hf.tar.gz /
RUN \
  cd /usr/local/ && \
  tar --strip-components 1 -xzf /node-v${NODE_VERSION}-linux-armv6hf.tar.gz && \
  rm -f node-v${NODE_VERSION}-linux-armv6hf.tar.gz

RUN npm install -g grunt grunt-cli

ENV JENKINS_HOME /root/.jenkins

#get the lastest phantomjs binary
#necessary to get phantomjs run on raspberry
RUN apt-get install -y unzip libicu48 libfontconfig1 libjpeg8 libpng12-0

WORKDIR /opt/phantomjs
RUN wget https://github.com/piksel/phantomjs-raspberrypi/archive/master.zip 
RUN unzip master.zip
RUN mv phantomjs-raspberrypi-master/bin/phantomjs /opt/phantomjs
RUN rm -rf phantomjs-raspberrypi-master
RUN chmod +x /opt/phantomjs/phantomjs
ENV PATH /opt/phantomjs/:$PATH
ENV PHANTOMJS_BIN=/opt/phantomjs/phantomjs

#git
RUN apt-get install -y git

CMD java -jar /opt/jenkins/jenkins.war

