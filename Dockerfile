FROM python:3.11

COPY NAE/AppDef.json /etc/NAE/AppDef.json
#COPY NAE/screenshot.png /etc/NAE/screenshot.png
#COPY NAE/license.txt /etc/NAE/license.txt

RUN mkdir -p /home/nimbix
#COPY src/* /home/nimbix/

WORKDIR /home/nimbix

#RUN touch /etc/NAE/screenshot.txt /etc/NAE/license.txt 
RUN mkdir -p /etc/NAE && touch /etc/NAE/AppDef.json