FROM python:3.7

RUN apt-get update && \
    apt-get install -y supervisor nginx python-dev build-essential redis-server

RUN mkdir /ci_pipeline

RUN chmod 777 /ci_pipeline

ADD . /ci_pipeline

WORKDIR /ci_pipeline

RUN python -m pip install --upgrade pip && \
        python -m pip install --trusted-host pypi.python.org -r requirements.txt

RUN apt-get update -y && apt-get install supervisor vim nginx python-dev build-essential -y

RUN pip install uwsgi

RUN export PYTHONPATH=$PYTHONPATH:/ci_pipeline/

RUN chmod +x ./docker-entrypoint.sh

RUN chown -R www-data ./

COPY ci_pipeline_nginx.conf /etc/nginx/sites-available/default

COPY supervisord.conf /etc/supervisor/conf.d/

ENTRYPOINT ["./docker-entrypoint.sh"]

EXPOSE 80