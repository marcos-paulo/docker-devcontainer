FROM debian:latest

ARG USERNAME
ARG USER_UID
ARG PASSWD
ARG DOCKER_GID
ARG USER_GID

ADD scripts /scripts

RUN chmod +x /scripts/*.sh \
  && chmod +x /scripts/**/*.sh \
  && /scripts/config_install_root.sh 

USER ${USERNAME}

RUN /scripts/config_install_non_root.sh
