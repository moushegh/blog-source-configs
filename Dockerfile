FROM ubuntu:14.04

MAINTAINER Moushegh Nazaretyan "moushegh@gmail.com"

RUN apt-get update \ 
 && apt-get -y upgrade \ 
 && apt-get -y install \ 
 && apt-get -y install lsb-release software-properties-common supervisor

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 
RUN add-apt-repository "deb http://nginx.org/packages/ubuntu $(lsb_release -sc) nginx" 
RUN add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main" 


RUN apt-get update \
 && apt-get install -y ca-certificates nginx hhvm git 

RUN rm -rf /var/www \
 && rm -rf  /etc/nginx/ /etc/hhvm/server.ini

COPY /keys /etc/nginx/ssl/

RUN cd /tmp/ \ 
 && git clone https://github.com/moushegh/blog-source-configs.git \
 && mv /tmp/blog-source-configs/nginx /etc/nginx/ \
 && mv /tmp/blog-source-configs/www   /var/www    \
 && mv /tmp/blog-source-configs/hhvm.ini /etc/hhvm/server.ini \
 && mv /tmp/blog-source-configs/sup/nginx.conf /etc/supervisor/conf.d/nginx.conf \
 && mv /tmp/blog-source-configs/sup/hhvm.conf  /etc/supervisor/conf.d/hhvm.conf \
 && /usr/share/hhvm/install_fastcgi.sh \
 && rm -rf /tmp/blog-source-configs        

EXPOSE 80 443

CMD ["service", "supervisor", "start"]
