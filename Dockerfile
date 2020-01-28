FROM alpine:3.5

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

# can override UDPPORT value in command line with -e UDPPORT=4005
ENV UDPPORT 5005
ADD udplistener.py /udplistener.py
CMD ["python", "-u", "/udplistener.py"]

EXPOSE ${UDPPORT}
EXPOSE ${UDPPORT}/udp
