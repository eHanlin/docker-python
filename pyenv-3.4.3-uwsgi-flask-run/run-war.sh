#!/bin/sh
export LC_CTYPE=zh_TW.UTF-8
export LC_MESSAGES=zh_TW.UTF-8
export LC_TIME=en_US.UTF-8

if [ -z "$1" ]; then
    echo "please give me a war download url"
else
    CURRENT_PATH=/root
    PROJECT_NAME=uwsgi_project
    INSTALL_PATH=${CURRENT_PATH}/${PROJECT_NAME}/install.sh
    RUN_PATH=${CURRENT_PATH}/${PROJECT_NAME}/run.sh
    INI_PATH=${CURRENT_PATH}/${PROJECT_NAME}/uwsgi.ini
    PROJECT_PATH=${CURRENT_PATH}/${PROJECT_NAME}
    PYTHON_VERSION_PATH=${PROJECT_PATH}/.python-version
    WAR=$1
    fileName=$(echo $WAR | sed -e "s/^.*[^/]*\///g")
    wget -O ${CURRENT_PATH}/${fileName} $WAR 
    unzip ${CURRENT_PATH}/${fileName} -d ${PROJECT_PATH}
    if [ -f $PYTHON_VERSION_PATH ] ;then
        #sh ${CURRENT_PATH}/.bashrc
        PYTHON_VERSION=$(cat $PYTHON_VERSION_PATH)
        ${CURRENT_PATH}/.pyenv/bin/pyenv install -s ${PYTHON_VERSION}
        export PATH=${CURRENT_PATH}/.pyenv/versions/${PYTHON_VERSION}/bin:$PATH
        #alias python=${CURRENT_PATH}/.pyenv/versions/${PYTHON_VERSION}/bin/python
        #alias pip=${CURRENT_PATH}/.pyenv/versions/${PYTHON_VERSION}/bin/pip
        #export python
        #export pip
        #echo $(${CURRENT_PATH}/.pyenv/versions/${PYTHON_VERSION}/bin/python -V)
        #echo $(python -V)
    fi
    if [ -f $INSTALL_PATH ]; then
        $INSTALL_PATH
    fi
    if [ -f $RUN_PATH ]; then
        $RUN_PATH --no-daemonize -cmd start
    else
        cd $PROJECT_PATH
        uwsgi --ini $INI_PATH
    fi
fi
