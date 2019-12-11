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
    PROJECT_PATH=${CURRENT_PATH}/${PROJECT_NAME}
    PYTHON_VERSION_PATH=${PROJECT_PATH}/.python-version
    WAR=$1
    fileName=$(echo $WAR | sed -e "s/^.*[^/]*\///g")
    wget -O ${CURRENT_PATH}/${fileName} $WAR 
    unzip ${CURRENT_PATH}/${fileName} -d ${PROJECT_PATH}
    if [ -f $PYTHON_VERSION_PATH ] ;then
        #sh ${CURRENT_PATH}/.bashrc
        PYTHON_VERSION=$(cat $PYTHON_VERSION_PATH)
    fi
    if [ -f $INSTALL_PATH ]; then
        $INSTALL_PATH
    fi
    $RUN_PATH --no-daemonize -cmd start
fi
