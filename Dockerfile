FROM debian:12-slim AS pzserver
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV GROUP=pz
ENV USER=pzuser

RUN addgroup ${GROUP}

RUN adduser \
    --home /home/${USER} \
    --disabled-password \
    --shell /bin/bash \
    --quiet \
    --ingroup pz \
    ${USER}

RUN mkdir -p /opt/pzserver /opt/server_scripts /opt/custom_config /home/${USER}/Zomboid

COPY server_scripts /opt/server_scripts
COPY custom_config /opt/custom_config

RUN chown -R ${USER}:${GROUP} /opt /home/${USER}/Zomboid

USER ${USER}

EXPOSE 16261-16262/udp

ENTRYPOINT ["/bin/bash", "/opt/server_scripts/pzs_entrypoint.sh"]
