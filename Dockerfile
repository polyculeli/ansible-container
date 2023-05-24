FROM docker.io/rockylinux/rockylinux:9-minimal

RUN microdnf install -y ansible-core python3 python3-pip && \
    microdnf clean all

RUN python3 -m pip install --no-cache-dir hcloud
