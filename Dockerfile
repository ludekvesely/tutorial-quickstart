FROM tutum/apache-php

RUN apt-get update && apt-get install -yq php5-sqlite && \  
    rm -rf /var/lib/apt/lists/* && rm -fr /app

COPY . /app

RUN chmod 777 log temp && \  
    composer install && \
    rm -rf composer* Dockerfile .git && \
    sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/www/g" /etc/apache2/sites-available/000-default.conf

ENV ALLOW_OVERRIDE true

