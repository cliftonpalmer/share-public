FROM httpd:2.4

RUN apt-get update -y && \
    apt-get -y install make gcc perl && \
    cpan -i File::Spec File::Path

RUN mkdir -p /usr/local/apache2/htdocs/public

ADD /public /root/public
