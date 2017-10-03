
FROM selenium/standalone-chrome
 
MAINTAINER sparrow.jang <sparrow.jang@gmail.com>
USER root
ENV HOME=/root SERVICE_TAGS=uwsgi
COPY run-war.sh ${HOME}/run-war.sh
RUN chmod +x ${HOME}/run-war.sh

RUN whoami
RUN rm -rf /var/lib/apt/lists/* -vf 
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get clean
RUN apt-get update
RUN apt-get install -y build-essential python3.5-dev
RUN sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen
RUN sed -i 's/^# *\(zh_TW.UTF-8\)/\1/' /etc/locale.gen && locale-gen
RUN update-locale
RUN wget https://pypi.python.org/packages/a4/c8/9a7a47f683d54d83f648d37c3e180317f80dc126a304c45dc6663246233a/setuptools-36.5.0.zip#md5=704f500dd55f4bd0be905444f3ba892c && unzip setuptools-36.5.0.zip && cd setuptools-36.5.0 && python3 setup.py install
RUN easy_install pip
RUN pip install selenium flask uwsgi

EXPOSE 4000

ENTRYPOINT ["/root/run-war.sh"]

