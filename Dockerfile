# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER Sebastian Kennedy "skennedy@e-mips.com.ar"
ENV REFRESHED_AT 2014-11-10

RUN apt-get update

RUN apt-get install -y python2.7 python-setuptools python-pip python-dev libxml2 libxml2-dev libxslt-dev zlib1g-dev libpq-dev libsasl2-dev libldap2-dev libjpeg-dev
RUN apt-get install -y wget git bzr vim

RUN pip install zc.buildout

RUN useradd -ms /bin/bash odoodev
RUN echo "odoodev:password" | chpasswd
RUN gpasswd -a odoodev sudo

ENV BUILDOUT_DIR /opt/buildout

VOLUME ["/opt/buildout"]

RUN chown -R odoodev /opt/buildout

USER odoodev

COPY ./start.sh /tmp/

WORKDIR /opt/buildout

EXPOSE 8069
