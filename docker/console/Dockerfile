FROM yiisoftware/yii2-php:7.1-apache

RUN pecl install xdebug-2.6.0 \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /usr/src/yii2-fias
VOLUME /usr/src/yii2-fias
RUN rm /var/www/html
RUN ln -s /usr/src/yii2-fias/tests/_app/web /var/www/html || true

RUN curl -LO https://www.rarlab.com/rar/unrar_5.2.5-0.1_amd64.deb && dpkg -i unrar_5.2.5-0.1_amd64.deb && rm unrar_5.2.5-0.1_amd64.deb

COPY docker-php-entrypoint /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-php-entrypoint

RUN useradd -m -U -s /bin/bash hostuser

RUN chmod 755 /usr/local/bin/composer