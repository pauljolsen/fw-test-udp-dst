FROM alpine:3.5

# Install python and pip
RUN apk add --update py2-pip

# upgrade pip
RUN pip install --upgrade pip


#RUN apk add --update \
#    python \
#    python-dev \
#    py-pip \
#    build-base \
#  && pip install virtualenv \
#  && rm -rf /var/cache/apk/*

# can override UDPPORT value in command line with -e UDPPORT=4005
ENV UDPPORT 5005
ADD udplistener.py /usr/src/
CMD ["python", "-u", "/usr/src/udplistener.py"]

EXPOSE ${UDPPORT}
EXPOSE ${UDPPORT}/udp
