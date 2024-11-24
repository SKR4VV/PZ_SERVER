#!/bin/sh

cat <<EOL >/opt/config_update
//
@ShutdownOnFailedCommand 1
@NoPromptForPassword 1
force_install_dir /opt/server
login anonymous 
app_update ${STEAMAPPID} validate
quit
EOL

exec steamcmd +runscript /opt/config_update