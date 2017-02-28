
FROM peter1209/pyenv-3.4.3-uwsgi-flask-pil

Run rm -rf /var/lib/apt/lists/* -vf
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
Run apt-get clean
Run apt-get autoremove
Run apt-get update
RUN apt-get -y install libmemcached-dev

MAINTAINER sparrow.jang <sparrow.jang@gmail.com>
ENV HOME=/root SERVICE_TAGS=uwsgi
COPY run-war.sh ${HOME}/run-war.sh
RUN chmod +x ${HOME}/run-war.sh
EXPOSE 4000

ENTRYPOINT ["/root/run-war.sh"]

