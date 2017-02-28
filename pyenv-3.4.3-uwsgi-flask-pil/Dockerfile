
FROM peter1209/pyenv-3.4.3-uwsgi-flask

Run rm -rf /var/lib/apt/lists/* -vf
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
Run apt-get clean
Run apt-get autoremove
Run apt-get update
RUN apt-get install libjpeg-dev zlib1g-dev libpng12-dev libfreetype6 libfreetype6-dev
RUN ln -s /usr/include/freetype2 /usr/include/freetype
RUN ln -s /usr/lib/x86_64-linux-gnu/libfreetype.so.6.11.1 /usr/lib/libfreetype.so
#RUN ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so.8 /usr/lib/libjpeg.so
#RUN ln -s /lib/x86_64-linux-gnu/libz.so.1 /usr/lib/libz.so


