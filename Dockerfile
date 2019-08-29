FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -yqq
RUN apt-get upgrade -yq
RUN apt-get install -yq apache2 apache2-dev curl haveged language-pack-en language-pack-en-base software-properties-common
RUN update-rc.d haveged defaults
RUN locale-gen en_US.UTF-8
RUN LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update -yqq
RUN apt-get install -yq libapache2-mod-php7.3 php7.3 php7.3-cli php7.3-curl php7.3-gd php7.3-intl php7.3-json php7.3-mbstring
RUN apt-get install -yq php7.3-mysql php7.3-readline php7.3-pgsql php7.3-sqlite3 php7.3-xml php7.3-zip
RUN apt-get install -yq composer
RUN update-alternatives --set php /usr/bin/php7.3
CMD ["apachectl","-D","FOREGROUND"]
RUN a2enmod expires headers rewrite ssl
EXPOSE 80
EXPOSE 443