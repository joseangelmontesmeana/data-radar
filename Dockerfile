FROM python:3.7-slim as deploy

# not check if another pip version is available to remove warnings
# we'll be based on the pip version that comes bundle with python official images.
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PYTHONUNBUFFERED 1

# gcc to compile some python and mysql libs
# curl to download certs
# default-libmysqlclient-dev mysql headers

RUN apt-get update && \
    apt-get install -y ca-certificates \
    gcc \
    curl \
    git \
    default-libmysqlclient-dev


COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY wait-for-it.sh /scripts/wait-for-it.sh

# Adds our application code to the image
COPY ./DataRadar/ /code/

WORKDIR /code

EXPOSE 8000

RUN python manage.py collectstatic

ENTRYPOINT ["gunicorn",  "--bind", "0.0.0.0:8000", "DataRadar.wsgi"]
