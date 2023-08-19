FROM httpd:2.4-alpine

# open htdocs so scripts can write dynamically into there
RUN  chmod 777 /usr/local/apache2/htdocs

COPY /httpd.conf /usr/local/apache2/conf/httpd.conf
COPY /lua        /usr/local/apache2/lua
