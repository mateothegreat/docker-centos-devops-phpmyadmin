#
# https://www.phpmyadmin.net/downloads/
#
# $VERSION is an environment variable and can be any version available via the downloads page at https://www.phpmyadmin.net/downloads//
# i.e.: 4.6.6 or 4.7.0-beta1
#
FROM appsoa/docker-centos-base-php70
LABEL maintainer    = "Matthew Davis <matthew@appsoa.io>"
LABEL repository    = appsoa
LABEL image         = docker-centos-devops-phpmyadmin
LABEL built_at      = 0000-00-00 00:00:00

ENV VERSION=4.7.0-beta1
ENV URL=https://files.phpmyadmin.net/phpMyAdmin/$VERSION/phpMyAdmin-$VERSION-all-languages.zip

RUN yum -y install httpd && \
    wget -q "https://files.phpmyadmin.net/phpMyAdmin/$VERSION/phpMyAdmin-$VERSION-all-languages.zip" && \
    unzip phpMyAdmin-$VERSION-all-languages.zip -d /tmp && \
    mv /tmp/phpMyAdmin-$VERSION-all-languages /www && \
    rm -rf phpMyAdmin-$VERSION-all-languages.zip

RUN wget -q "https://files.phpmyadmin.net/themes/fallen/0.2/fallen-0.2.zip" && \
    unzip fallen-0.2.zip -d /www/themes && \
    rm -f fallen-0.2.zip && \
    chown -R nginx:nginx /www

EXPOSE 80

COPY /entrypoint.sh /
COPY /entrypoint.d/* /entrypoint.d/
ONBUILD COPY /entrypoint.d/* /entrypoint.d/

ENTRYPOINT ["/entrypoint.sh"]