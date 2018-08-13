#!/bin/bash

source __rootPath__/run/config.sh

# Prefix of the JAR file, e.g. "admin-service"
BINARY_FILE_NAME=$1

# Name of the Systemd service, e.g. "admin-colab"
SERVICE_NAME=$2

# Name used in service description. Used for filtering journald in export_log.sh.
# E.g. "Admin"
SERVICE_TITLE=$3

echo "#####################################################################################"
echo "[INFO] Starting ${BINARY_FILE_NAME} service..."

# Copy binaries to a deploy directory (making sure it exists)
mkdir -p ${CLOUD_DEPLOY_DIR}
cp ${BINARY_SOURCE_DIR}/services/${BINARY_FILE_NAME}-1.0-SNAPSHOT.jar ${CLOUD_DEPLOY_DIR}/

# Copy logs of previous execution
OUT_FILE="${BINARY_FILE_NAME}.out"
if ! [ -z ${LOG_SERVER+x} ]; then
    DATE="$(date +"%Y-%m-%d_%H-%M-%S")"
    REMOTE_LOG_FILE_DEST="${LOG_SERVER}:${LOG_SERVER_FOLDER}/${DATE}-${OUT_FILE}"
	echo "Executing ./export_log.sh ${SERVICE_NAME} ${SERVICE_DESCRIPTION}"
    ./export_log.sh ${SERVICE_NAME} ${SERVICE_TITLE} > ${OUT_FILE}
    echo "[INFO] Copying logs to ${REMOTE_LOG_FILE_DEST}"
    scp ${OUT_FILE} ${REMOTE_LOG_FILE_DEST}
    rm ${OUT_FILE}
fi

echo "[INFO] Done."
echo "#####################################################################################"