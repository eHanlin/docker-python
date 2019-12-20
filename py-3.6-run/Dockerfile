
FROM python:3.6

MAINTAINER sparrow.jang <sparrow.jang@gmail.com>
ENV HOME=/root SERVICE_TAGS=uwsgi
RUN apt-get update -y && apt-get install -y curl
RUN apt-get install -y locales
RUN sed -i -e 's/# zh_TW.UTF-8 UTF-8/zh_TW.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG zh_TW.UTF-8  
ENV LANGUAGE zh_TW:zh  
ENV LC_ALL zh_TW.UTF-8 
RUN export LC_ALL="zh_TW.UTF-8" && locale-gen zh_TW.UTF-8
COPY run-war.sh ${HOME}/run-war.sh
RUN chmod +x ${HOME}/run-war.sh
EXPOSE 4000

ENTRYPOINT ["/root/run-war.sh"]

