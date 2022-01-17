FROM ubuntu:focal as base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential sudo && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base as gsinka
RUN addgroup --gid 1000 gsinka
RUN adduser --gecos gsinka --uid 1000 --gid 1000 --disabled-password gsinka
RUN adduser gsinka sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
    /etc/sudoers
USER gsinka
WORKDIR /home/gsinka/ansible

FROM gsinka
ENV TAGS=all
COPY --chown=gsinka . .
CMD ["sh", "-c", "ansible-playbook --tags $TAGS local.yml"]
