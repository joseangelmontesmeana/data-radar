FROM python:3.7-slim as deploy

ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y ca-certificates \
    gcc \
    curl \
    git \
    default-libmysqlclient-dev

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
COPY wait-for-it.sh /scripts/wait-for-it.sh
COPY ./DataRadar/ /code/
WORKDIR /code

EXPOSE 8000

RUN python manage.py collectstatic
ENTRYPOINT ["gunicorn",  "--bind", "0.0.0.0:8000", "DataRadar.wsgi"]
