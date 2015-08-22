FROM rpidockers/java
MAINTAINER Martin Dilger <martin@effectivetrainings.de>

ENV JENKINS_HOME /var/jenkins_home

RUN groupadd -r jenkins && useradd jenkins -g jenkins
RUN mkdir /var/jenkins_home
RUN chown -R jenkins /var/jenkins_home

USER jenkins

VOLUME $JENKINS_HOME
