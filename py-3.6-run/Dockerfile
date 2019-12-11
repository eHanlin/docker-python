
FROM python:3.6

MAINTAINER sparrow.jang <sparrow.jang@gmail.com>
ENV HOME=/root SERVICE_TAGS=uwsgi
COPY run-war.sh ${HOME}/run-war.sh
RUN chmod +x ${HOME}/run-war.sh
EXPOSE 4000

ENTRYPOINT ["/root/run-war.sh"]

