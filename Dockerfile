FROM pagevamp/nginx-php7-fpm:php74

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests --allow-unauthenticated -q -y php7.4-soap
