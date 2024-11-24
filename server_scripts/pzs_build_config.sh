#!/bin/bash

SOURCE_DIR="/opt/custom_config"
DEST_DIR="/home/${USER}/Zomboid/Server"

FILE_SUFFIXES=(
    "_SandboxVars.lua"
    "_spawnpoints.lua"
    "_spawnregions.lua"
    ".ini"
)

mkdir -p "${DEST_DIR}"

for SUFFIX in "${FILE_SUFFIXES[@]}"; do
    FILES=(${SOURCE_DIR}/*${SUFFIX})
    if [ ${#FILES[@]} -eq 0 ]; then
        echo "No file found with the suffix ${SUFFIX} in ${SOURCE_DIR}."
        exit 1
    fi
done

for SUFFIX in "${FILE_SUFFIXES[@]}"; do
    FILES=(${SOURCE_DIR}/*${SUFFIX})
    for FILE in "${FILES[@]}"; do
        FILE_NAME="${SERVER_NAME}${SUFFIX}"
        mv "${FILE}" "${DEST_DIR}/${FILE_NAME}"

        if [[ "${SUFFIX}" == ".ini" ]]; then
            sed -i "s/^PublicName=.*/PublicName=${SERVER_NAME}/" "${DEST_DIR}/${FILE_NAME}"
        fi
    done
done

echo "Custom config build complete."
