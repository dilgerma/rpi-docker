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

VOLUME /root/.jenkins

ENV JENKINS_HOME /root/.jenkins

CMD java -jar jenkins.war

