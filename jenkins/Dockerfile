FROM jenkins/jenkins:lts

COPY --chown=jenkins:jenkins ./jenkins-plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt


ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_USER admin
ENV JENKINS_PASS 123

COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/