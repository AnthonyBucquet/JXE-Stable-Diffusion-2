FROM python:3.11

RUN pip install diffusers transformers accelerate scipy safetensors

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://cloud.nimbix.net/api/jarvice/validate
#COPY NAE/screenshot.png /etc/NAE/screenshot.png
#COPY NAE/license.txt /etc/NAE/license.txt

COPY src/* /opt/

WORKDIR /home/nimbix

#RUN touch /etc/NAE/screenshot.txt /etc/NAE/license.txt 
RUN mkdir -p /etc/NAE && touch /etc/NAE/AppDef.json