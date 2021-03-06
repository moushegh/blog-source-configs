FROM ubuntu:14.04

MAINTAINER Moushegh Nazaretyan "moushegh@gmail.com"

RUN apt-get update \ 
 && apt-get -y upgrade \ 
 && apt-get -y install \ 
 && apt-get -y install lsb-release software-properties-common supervisor

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 
RUN add-apt-repository "deb http://nginx.org/packages/ubuntu $(lsb_release -sc) nginx" 


RUN apt-get update \
 && apt-get install -y ca-certificates nginx php5-fpm php5-memcached php5-mysql php5-mcrypt php5-json php5-gd php5-curl git 

RUN rm -rf /var/www \
 && rm -rf /etc/nginx/ 

RUN cd /tmp/ \ 
 && git clone https://github.com/moushegh/blog-source-configs.git \
 && cp -r /tmp/blog-source-configs/nginx /etc/ \
 && cp -r /tmp/blog-source-configs/www   /var/    \
 && mv /tmp/blog-source-configs/sup/nginx.conf /etc/supervisor/conf.d/nginx.conf \
 && mv /tmp/blog-source-configs/sup/php-fpm.conf  /etc/supervisor/conf.d/php-fpm.conf \
 && mv /tmp/blog-source-configs/sup/supervisord.conf /etc/supervisor/supervisord.conf \
 && chown -R 33:33 /var/www \
 && rm -rf /tmp/blog-source-configs        

ADD run.sh /run.sh
RUN chmod +x run.sh
EXPOSE 443

CMD ["/run.sh"]
