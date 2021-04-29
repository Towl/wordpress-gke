FROM bitnami/wordpress:5

USER root
RUN rm -rf /opt/bitnami/wordpress/wp-content/plugins
RUN apt update -y && apt upgrade -y
RUN apt install -y patch vim && apt clean

COPY apache/wordpress-vhost.conf /opt/bitnami/apache/conf/vhosts/wordpress-vhost.conf
COPY apache/wordpress-https-vhost.conf /opt/bitnami/apache/conf/vhosts/wordpress-https-vhost.conf

COPY patches /opt/bitnami/patches
RUN cat /opt/bitnami/patches/* | patch -d /opt/bitnami/wordpress -p1

COPY my.cnf /opt/bitnami/mysql/conf/my.cnf

RUN sed -i 's/;extension = imagick/extension = imagick/' /opt/bitnami/php/etc/php.ini
RUN chown -R daemon /opt/bitnami/wordpress
