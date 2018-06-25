FROM alpine:3.7
ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache \
    python \
    py-pip \
    tzdata \
    && cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && apk del tzdata

ADD requirements.txt /root

RUN apk --no-cache add --virtual build-dependencies \
    build-base \
    py-mysqldb \
    gcc \
    libc-dev \
    libffi-dev \
    mariadb-dev \
    python2-dev \
    && pip install MySQL-python gevent \
    && rm -rf .cache/pip \
    && apk del build-dependencies

RUN apk --no-cache add mariadb-client-libs

RUN pip install -r /root/requirements.txt \
    && rm /root/requirements.txt

RUN mkdir -p /var/log/django
RUN mkdir /var/log/gunicorn
