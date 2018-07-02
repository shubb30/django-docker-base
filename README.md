# docker-django-base

This is meant to be a base Docker container for creating a containerized Django app. This can be used in the FROM statement in a Dockerfile as a base container with Django already installed.

It is based on the Alpine 3.7 image, and only includes Django, MySQL-python, gevent and gunicorn.

The MySQL-python library requires some other MySQL dependencies in order to install, so it will install the dependencies, then install MySQL-python, and then remove the dependencies in a single layer so that the final image is kept small.

The container will be updated when there is a new Django 1.x version.

The image is available on Docker Hub at [https://hub.docker.com/r/shubb30/django-base/](https://hub.docker.com/r/shubb30/django-base/) 
