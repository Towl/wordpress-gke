FROM bitnami/wordpress:5

USER root
RUN apt update -y && apt upgrade -y
RUN apt install -y patch vim && apt clean

COPY patches /opt/bitnami/patches
RUN cat /opt/bitnami/patches/* | patch -d /opt/bitnami/wordpress -p1

COPY my.cnf /opt/bitnami/mysql/conf/my.cnf
COPY keys.php /opt/bitnami/wordpress/

RUN sed -i 's/;extension = imagick/extension = imagick/' /opt/bitnami/php/etc/php.ini
RUN chown -R daemon /opt/bitnami/wordpress
