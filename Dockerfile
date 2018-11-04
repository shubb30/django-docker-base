FROM alpine:3.8
ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache \
    python3 \
    tzdata \
    && cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && apk del tzdata

ADD requirements.txt /root
ADD requirements-deps.txt /root
RUN apk --no-cache add --virtual build-dependencies \
    build-base \
    gcc \
    libc-dev \
    libffi-dev \
    openssl-dev \
    python3-dev \
    && pip3 install -r  /root/requirements-deps.txt \
    && rm -rf .cache/pip \
    && apk del build-dependencies

RUN apk --no-cache add \
    mariadb-client-libs

RUN pip3 install -r /root/requirements.txt \
    && rm /root/requirements.txt \
    && rm /root/requirements-deps.txt

RUN mkdir -p /var/log/django
RUN mkdir /var/log/gunicorn
