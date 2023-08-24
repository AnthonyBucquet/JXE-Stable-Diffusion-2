FROM python:3.11

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install curl --no-install-recommends && \
    curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/jarvice-desktop/master/install-nimbix.sh \
        | bash

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://cloud.nimbix.net/api/jarvice/validate
#COPY NAE/screenshot.png /etc/NAE/screenshot.png
#COPY NAE/license.txt /etc/NAE/license.txt

RUN mkdir -p /home/nimbix
#COPY src/* /home/nimbix/

WORKDIR /home/nimbix

#RUN touch /etc/NAE/screenshot.txt /etc/NAE/license.txt 
RUN mkdir -p /etc/NAE && touch /etc/NAE/AppDef.json