FROM docker.io/debian:12

RUN apt-get update -y \
    && apt-get install -y \
    ansible \
    git \
    gnupg \
    locales \
    vim \
    wireguard \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
