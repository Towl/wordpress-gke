FROM bitnami/wordpress:5

RUN mkdir /bitnami/certs
COPY --chmod=600 --chown=1001:1001 ca.pem client-cert.pem client-key.pem /bitnami/certs
COPY my.cnf /opt/bitnami/mysql/conf/my.cnf
COPY --chown=1001:1001 wp-config.php /bitnami/wordpress
COPY --chown=1001:1001 wp-content /bitnami/wordpress/wp-content
