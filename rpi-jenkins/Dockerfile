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
RUN wget https://github.com/spfaffly/phantomjs-linux-armv6l/archive/master.zip
RUN unzip master.zip && tar -xf phantomjs-linux-armv6l-master/phantomjs-2.0.1-development-linux-armv6l.tar.gz  
RUN mv phantomjs-2.0.1-development-linux-armv6l/bin/* /opt/phantomjs
RUN chmod +x /opt/phantomjs
ENV PATH /opt/phantomjs/:$PATH

CMD java -jar /opt/jenkins/jenkins.war

