pyenv-3.4.3-uwsgi-flask-pil-run
===========

You see [docker hub](https://hub.docker.com/r/peter1209/pyenv-3.4.3-uwsgi-flask-pil-run/), too.

## Project and zip structures：
```
├── project
├── .python-version
├── install.sh
└── run.sh
```

see [flask project generator](https://github.com/eHanlin/generator-ms-docker), **expose 4000 port (default)**.

## Run command：
```
docker run -p 4000:4000 -it peter1209/pyenv-3.4.3-uwsgi-flask-pil-run http://your.source.com/test.zip
```

