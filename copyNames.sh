#!/bin/bash
FILE_PATH="${1}/*"
BACKUP_DIR="${HOME}"
CUR_DATE=$(date +%F)

checkDir() {
  if [ ! -d ${BACKUP_DIR} ]; then
    mkdir -p ${BACKUP_DIR}
  fi
}

for DIR in ${FILE_PATH}; do
  if [ -d "${DIR}" ]; then
      echo "${DIR}" >> ${BACKUP_DIR}/${1}-${CUR_DATE}.txt
  fi
done
echo "File name backup completed to: ${BACKUP_DIR}/${1}-${CUR_DATE}.txt"