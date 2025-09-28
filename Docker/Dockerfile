FROM httpd:latest
RUN apt-get update -y
RUN apt-get install vim -y
ADD index1.html /usr/local/apache2/htdocs


----------------------------------------

FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y apache2
COPY index1.html /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
ENV name cloud-sre

----------------------------------------------

FROM openjdk:17-jre-slim
WORKDIR /app
COPY your-application.jar /app/your-application.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "your-application.jar"]
