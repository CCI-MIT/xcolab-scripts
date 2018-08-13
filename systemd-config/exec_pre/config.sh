#!/bin/bash

#= Directory configuration

# Option 2: Custom config for binary deployments
 ROOT_PATH="__rootPath__"
 VCS_ROOT="${ROOT_PATH}/src"


#= Log configuration
# LOG_SERVER=log-user@log-host.com
LOG_SERVER_FOLDER=__user__


#= Load external config files id they exist and allow them to override variables
# config file in home directory
if [ -f ${ROOT_PATH}/.xcolab.run-config.sh ]; then
    echo "[INFO] Loading configuration from ${ROOT_PATH}/.xcolab.run-config.sh"
    source ${ROOT_PATH}/.xcolab.run-config.sh
fi

# config file in parent directory
if [ -f ${ROOT_PATH}/scripts/run-config.sh ]; then
    echo "[INFO] Loading configuration from '${ROOT_PATH}/scripts/run-config.sh'"
    source ${ROOT_PATH}/scripts/run-config.sh
fi


#= Derived configuration variables, should remain unchanged in most deployments

# Source directory from which to retrieve the latest binaries
export BINARY_SOURCE_DIR="${ROOT_PATH}/binaries"

# Directory from which to run binaries
export DEPLOY_DIR="${ROOT_PATH}/bundle"

CLOUD_DEPLOY_DIR=${DEPLOY_DIR}/cloud
SERVICE_DEPLOY_DIR=${DEPLOY_DIR}/services
VIEW_DEPLOY_DIR=${DEPLOY_DIR}/view
