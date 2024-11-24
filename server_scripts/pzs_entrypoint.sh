#!/bin/bash

if [ "${CUSTOM_CONFIG}" = "true" ]; then
    echo "CUSTOM_CONFIG=true. Executing custom config build..."
    /opt/server_scripts/pzs_build_config.sh
else
    echo "CUSTOM_CONFIG=false. Skipping execution."
fi

sed -i "s/-Xmx8g/-Xmx${SERVER_MEMORY_LIMIT}/g" /opt/pzserver/ProjectZomboid64.json
/opt/pzserver/start-server.sh -adminpassword $(cat $ADMIN_PASSWORD) -servername ${SERVER_NAME} -nosteam
