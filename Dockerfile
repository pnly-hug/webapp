FROM ubuntu:latest

LABEL maintainer='pnly'

RUN apt update -y

RUN DEBIAN_FRONTEND=noninteractive apt install nginx git -y

RUN rm -Rf /var/www/html/*

RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html

RUN sed -i '23 {s/^/#/}' /etc/nginx/sites-available/default

#ADD static-website-example /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
