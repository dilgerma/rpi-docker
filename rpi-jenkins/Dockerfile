FROM hypriot/rpi-java
MAINTAINER Martin Dilger <martin@effectivetrainings.de>

MKDIR /opt/jenkins
WORKDIR /opt/jenkins

CMD wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war jenkins.war
RUN java -jar jenkins.war

