FROM tomcat:8.0-alpine
MAINTAINER Rahul choudhary
WORKDIR /usr/src/main/webapp/index
RUN apk update
RUN apk add wget
RUN wget --user=admin --password=L0ve-u-m0mdad -O /usr/local/tomcat/webapps/my-first-app.war http://172.30.0.1:8082/artifactory/example-repo-local/com/nagarro/myfirstapp/my-first-app/0.0.1-SNAPSHOT/my-first-app-0.0.1-SNAPSHOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
