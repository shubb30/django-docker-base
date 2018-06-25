FROM alpine:3.7
ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache \
    python \
    py-pip \
    tzdata \
    && cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && apk del tzdata

ADD requirements.txt /root

RUN apk add --no-cache --virtual .build-deps mariadb-dev mariadb-client mariadb-libs mariadb-client-libs python-dev gcc musl-dev \
    && pip install -r /root/requirements.txt \
    && apk del .build-deps \
    && rm /root/requirements.txt

RUN mkdir -p /var/log/django
RUN mkdir /var/log/gunicorn
