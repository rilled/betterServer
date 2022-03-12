#!/bin/bash

BACKUP_DIR=/my/dir
CUR_DATE=$(date +%F)
DIR=${1}

checkDir() {
  if [ ! -d ${BACKUP_DIR} ]; then
    mkdir -p ${BACKUP_DIR}
  fi
}

if [[ -d ${DIR} ]]; then 
    checkDir
    cd ${DIR} && cd ..
    tar czfv ${BACKUP_DIR}/${DIR}-${CUR_DATE}.tgz ${DIR}
else
    echo "Directory variable is not set";
fi