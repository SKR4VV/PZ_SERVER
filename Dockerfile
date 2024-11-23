FROM debian:12-slim AS pzserver
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV STEAMAPPID=380870
ENV GROUP=pz
ENV USER=pzuser

RUN echo "deb http://ftp.fr.debian.org/debian bookworm main non-free" > /etc/apt/sources.list.d/non-free.list

RUN addgroup ${GROUP}

RUN adduser \
	--home /home/${USER} \
	--disabled-password \
	--shell /bin/bash \
	--quiet \
    --ingroup pz \
	${USER}

RUN apt-get update && \
    apt-get install -y curl lib32gcc-s1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/steamcmd && \
    curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz -C /opt/steamcmd

RUN mkdir -p /opt/pzserver /opt/server_scripts /home/${USER}/Zomboid

COPY entrypoint.sh /opt/server_scripts/entrypoint.sh

RUN chown -R ${USER}:${GROUP} /opt /home/${USER}/Zomboid

USER ${USER}

RUN /opt/steamcmd/steamcmd.sh +force_install_dir /opt/pzserver/ +login anonymous +app_update ${STEAMAPPID} validate +quit

EXPOSE 16261-16262/udp

ENTRYPOINT ["/bin/bash", "/opt/server_scripts/entrypoint.sh"]