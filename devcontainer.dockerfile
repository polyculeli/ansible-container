FROM docker.io/debian:12

RUN apt-get update -y \
    && apt-get install -y ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
