FROM ubuntu
MAINTAINER jaehong park <iworkist@gmail.com>

ENV TERM xterm

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd \
  && mkdir /root/.ssh \
  && chmod 700 /root/.ssh

COPY bin/* /usr/local/bin/
COPY sshd_config /etc/ssh/sshd_config
COPY authorized_keys /root/.ssh/authorized_keys

EXPOSE 22

ENTRYPOINT ["ssh-start"]
CMD ["ssh-server"]
