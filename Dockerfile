from python:2.7
ENV PYTHONUNBUFFERED 1

ADD requirements.txt /root
RUN pip install -r /root/requirements.txt
RUN cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

RUN mkdir -p /var/log/django
RUN mkdir /var/log/gunicorn

