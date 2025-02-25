FROM docker.io/debian:12@sha256:35286826a88dc879b4f438b645ba574a55a14187b483d09213a024dc0c0a64ed

ARG USERNAME=devcontainer
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME}

RUN apt-get update -y \
    && apt-get install -y \
    ansible \
    git \
    gnupg \
    locales \
    vim \
    sudo \
    wireguard \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

USER ${USERNAME}
