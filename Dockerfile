FROM ubuntu:22.04

RUN apt update && apt upgrade -y
RUN apt install -y apache2
RUN apt-get install nano
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt update
# Default choise yes and stop promt to ask use DEBIAN_FRONTEND=noninteractive and -y, --yes, --assume-yes
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php8.2
RUN a2enmod rewrite php8.2
RUN apt clean

COPY php_page.php /var/www/html/

WORKDIR /var/www/html/

EXPOSE 80 443

CMD ["apache2ctl", "-D", "FOREGROUND"]