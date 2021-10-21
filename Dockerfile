FROM debian:stretch-slim

RUN apt-get update && \
  apt-get upgrade -y --autoremove --purge && \
  apt-get install -y apt-utils

RUN apt-get install -y sudo openssh-server openssl && \
  sed -i 's/#X11UseLocalhost yes/X11UseLocalhost no/' /etc/ssh/sshd_config && \
  sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY docker-entrypoint.sh /opt/

RUN chmod a+x /opt/docker-entrypoint.sh
RUN useradd -mUG sudo -s /bin/bash docker_user

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
