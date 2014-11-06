# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER Sebastian Kennedy "skennedy@e-mips.com.ar"
RUN apt-get update

# Instalacion de paquetes necesarions para OpenERP
RUN apt-get install -y python-dateutil python-docutils python-feedparser python-gdata
RUN apt-get install -y python-jinja2 python-ldap python-libxslt1 python-lxml 
RUN apt-get install -y python-mako python-mock python-openid python-psycopg2 python-psutil
RUN apt-get install -y python-pybabel python-pychart python-pydot python-pyparsing
RUN apt-get install -y python-reportlab python-simplejson python-tz python-unittest2
RUN apt-get install -y python-vatnumber python-vobject python-webdav
RUN apt-get install -y python-werkzeug python-xlwt python-yaml python-zsi

EXPOSE 8069
