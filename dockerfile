FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata
RUN apt-get update && apt-get install mysql-server -y
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install wordpress -y
RUN apt-get install openssl
RUN apt-get install vim -y
RUN cp -r /usr/share/wordpress/* /var/www/html/
RUN rm /var/www/html/index.html
RUN chown -R www-data: /var/www/html
COPY apache2.conf /etc/apache2/apache2.conf
COPY wordpress.conf /etc/apache2/sites-available/
COPY script /script
RUN chmod u+x /script
CMD ["bash","script"]
