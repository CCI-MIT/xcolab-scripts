#!/bin/bash

source __rootPath__/run/config.sh

CONTEST=contest-service

echo "#####################################################################################"
echo "[INFO] Starting ${CONTEST} service..."

mkdir -p ${CLOUD_DEPLOY_DIR}

cp ${BINARY_SOURCE_DIR}/services/${CONTEST}-1.0-SNAPSHOT.jar ${CLOUD_DEPLOY_DIR}/
OUT_FILE="${CONTEST}.out"
if ! [ -z ${LOG_SERVER+x} ]; then
    DATE="$(date +"%Y-%m-%d_%H-%M-%S")"
    REMOTE_LOG_FILE_DEST="${LOG_SERVER}:${LOG_SERVER_FOLDER}/${DATE}-${OUT_FILE}"
    echo "[INFO] Copying logs to ${REMOTE_LOG_FILE_DEST}"
    scp ${OUT_FILE} ${REMOTE_LOG_FILE_DEST}
fi

echo "[INFO] Done."
echo "#####################################################################################"