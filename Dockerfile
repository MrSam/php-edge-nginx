FROM phusion/baseimage:0.9.15
MAINTAINER outer/edge <hello@outeredgeuk.com>

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Install default packages and cleanup
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ruby nodejs-legacy npm git-core apache2 libapache2-mod-php5 \
        php5-cli php5-mysql php5-sqlite php5-curl php5-intl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install package managers
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN npm install -g bower && npm cache clean

# Setup apache
RUN a2enmod rewrite
RUN mkdir /etc/service/apache
ADD apache.conf /etc/apache2/sites-enabled/000-default.conf
ADD apache.sh /etc/service/apache/run
RUN chmod +x /etc/service/apache/run

# Add application code onbuild
ONBUILD ADD . /var/www
ONBUILD RUN chown www-data:www-data /var/www -R

EXPOSE 80
WORKDIR /var/www
CMD ["/sbin/my_init"]