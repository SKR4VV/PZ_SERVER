#!/bin/bash
sed -i "s/-Xmx8g/-Xmx${SERVER_MEMORY_LIMIT}/g" /opt/pzserver/ProjectZomboid64.json
/opt/pzserver/start-server.sh -adminpassword $(cat $ADMIN_PASSWORD) -servername ${SERVER_NAME} -nosteam