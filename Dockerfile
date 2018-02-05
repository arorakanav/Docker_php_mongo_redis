FROM centos:centos7

MAINTAINER Statusbrew

# -----------------------------------------------------------------------------
# EPEL
# -----------------------------------------------------------------------------
RUN yum -y update \
	&& yum --setopt=tsflags=nodocs -y install \
	epel-release \
	&& rm -rf /var/cache/yum/* \
	&& yum clean all

# -----------------------------------------------------------------------------
# REMI
# -----------------------------------------------------------------------------
ENV REMI_URL http://rpms.remirepo.net/enterprise/remi-release-7.rpm

RUN curl -O  $REMI_URL \
	&& rpm -Uvh remi-release-7.rpm \
	&& rm -rf /var/cache/yum/* \
	&& yum clean all

# -----------------------------------------------------------------------------
# Python
# -----------------------------------------------------------------------------
RUN yum -y update \
	&& yum --setopt=tsflags=nodocs --disablerepo="*" --enablerepo="remi-safe","epel"  -y install \
	curl \
	git \
	python34 \
	python34-pip \
	python34-wheel \
	&& rm -rf /var/cache/yum/* \
	&& yum clean all

# -----------------------------------------------------------------------------
# Apache + PHP
# -----------------------------------------------------------------------------
RUN	yum -y update \
	&& yum --setopt=tsflags=nodocs --enablerepo="remi","remi-php71","remi-php56","epel" -y install \
	gcc \
	gcc-c++ \
	httpd \
	mod_ssl \
	php71 \
	php\
	php-gd \
	php-mbstring \
	php-mysqlnd \
	php-pdo \
 	php-pecl-igbinary \
 	php-pecl-memcache \
 	php-pecl-mongodb \
	php-opcache \
	php-bcmath \
	php-pecl-redis \
	php-pear \
	php56-php-pecl-mongo \
	php-curl \
	php-apc \
	zip \
	unzip \
	yum-utils \
	vim-enhanced \
	bind-utils \
	libXrender fontconfig libXext urw-fonts \
	ImageMagick \
	ImageMagick-devel \
	&& rm -rf /var/cache/yum/* \
	&& yum clean all

# -----------------------------------------------------------------------------
# Composer + Synfony
# -----------------------------------------------------------------------------
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
	&& php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
	&& php composer-setup.php \
	&& php -r "unlink('composer-setup.php');" \
	&& mv composer.phar /usr/local/bin/composer \
	&& composer create-project symfony/framework-standard-edition my_project_name

# -----------------------------------------------------------------------------
# Enviornment Setup
# -----------------------------------------------------------------------------

RUN mkdir -p /var/www/html/{public_html,var/{log,session}}

# -----------------------------------------------------------------------------
# Set ports
# -----------------------------------------------------------------------------
EXPOSE 80 443 8000

ADD index.php /var/www/html/index.php

ADD ./setup.sh /
RUN chmod +x /setup.sh

WORKDIR /



