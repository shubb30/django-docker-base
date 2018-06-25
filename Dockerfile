from alpine:3.7
ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache \
    python \
    py-pip \
    tzdata
ADD requirements.txt /root
RUN pip install -r /root/requirements.txt

RUN cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
apk del tzdata

RUN mkdir -p /var/log/django
RUN mkdir /var/log/gunicorn

