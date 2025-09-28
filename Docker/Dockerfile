FROM httpd:latest
RUN apt-get update -y
RUN apt-get install vim -y
ADD index1.html /usr/local/apache2/htdocs


----------------------------------------

FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y apache2
ADD index1.html /var/www/html
ENTRYPOINT apachectl -D FOREGROUND
ENV name cloud-sre
