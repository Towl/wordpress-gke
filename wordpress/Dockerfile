FROM bitnami/wordpress:5

USER root
RUN apt update -y && apt upgrade -y
RUN apt install -y patch && apt clean
COPY patches /opt/bitnami/patches
RUN cat /opt/bitnami/patches/* | patch -d /opt/bitnami/wordpress -p1

USER 1001
RUN mkdir /bitnami/certs
COPY --chmod=600 --chown=1001:1001 ca.pem client-cert.pem client-key.pem /bitnami/certs
COPY my.cnf /opt/bitnami/mysql/conf/my.cnf
COPY keys.php /opt/bitnami/wordpress/
COPY --chown=1001:1001 wp-config.php /bitnami/wordpress
COPY --chown=1001:1001 wp-content /bitnami/wordpress/wp-content
