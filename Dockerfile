FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3E5C1192 40976EAF437D05B5 3B4FE6ACC0B21F32 06BBDC2602DFE7E7
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apache2 apache2-dev curl haveged language-pack-en language-pack-en-base software-properties-common
RUN update-rc.d haveged defaults
RUN locale-gen en_US.UTF-8
RUN LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update -y
RUN apt-get install -y libapache2-mod-php7.3 openssl php7.3 php7.3-cli php7.3-curl php7.3-gd php7.3-intl php7.3-json php7.3-mbstring
RUN apt-get install -y php7.3-mysql php7.3-readline php7.3-pgsql php7.3-sqlite3 php7.3-xml php7.3-zip
RUN apt-get install -y composer
RUN update-alternatives --set php /usr/bin/php7.3
RUN update-alternatives --set php-config /usr/bin/php-config7.3
RUN update-alternatives --set phpdbg /usr/bin/phpdbg7.3
RUN update-alternatives --set phpize /usr/bin/phpize7.3
CMD ["apachectl","-D","FOREGROUND"]
RUN a2enmod expires headers rewrite ssl
EXPOSE 80
EXPOSE 443