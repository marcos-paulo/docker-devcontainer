FROM debian:latest

ARG USERNAME
ARG USER_UID
ARG PASSWD
ARG DOCKER_GID
ARG USER_GID

ADD scripts /tmp/scripts

RUN chmod -R 777 /tmp/scripts \
  && /tmp/scripts/config_install_root.sh \
  && chown -R ${USERNAME}:${USER_GID} /tmp/scripts/

USER ${USERNAME}

RUN /tmp/scripts/config_install_non_root.sh \
  && ls -al /tmp/scripts > /home/${USERNAME}/tests.txt \
  && rm -rf /tmp/scripts
