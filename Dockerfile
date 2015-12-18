FROM quokka/quokkadev
MAINTAINER Thiago Avelino <thiago@avelino.xxx>
RUN apk update
RUN apk add supervisor
ADD supervisord.conf /etc/supervisor.d/quokka.ini
RUN pip install gunicorn gevent
ADD gunicorn.conf /tmp/gunicorn.conf

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
