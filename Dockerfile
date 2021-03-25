FROM openjdk:8
EXPOSE 8080
ADD target/my-first-app.war my-first-app.war
ENTRYPOINT ["java", "-war", "/my-first-app.war"]
