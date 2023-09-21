FROM alpine:3.15
LABEL org.opencontainers.image.source="https://github.com/lotusnetwork/SakuraNeko"
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf
RUN apk update && apk add --no-cache bash php7 curl supervisor redis php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-mbstring php7-tokenizer php7-gd php7-redis php7-bcmath php7-iconv php7-pdo php7-posix php7-gettext php7-simplexml php7-sodium php7-sysvsem php7-fpm php7-mysqli php7-json php7-openssl php7-curl php7-sockets php7-zip php7-pdo_mysql php7-xmlwriter php7-opcache php7-gmp php7-pdo_sqlite php7-sqlite3 php7-pcntl php7-fileinfo git mailcap caddy
RUN mkdir /www /wwwlogs /rdb
RUN mkdir -p /run/php /run/caddy/run/supervisor
COPY config/php-fpm.conf /etc/php7/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
WORKDIR /www
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
