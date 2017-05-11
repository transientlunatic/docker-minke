FROM lpmn/lalsuite:minke-latest
MAINTAINER Daniel Williams <daniel.wiliams@ligo.org>

RUN git config --global user.name "Anonymous" \
 && git config --global user.email anonymous@example.com


RUN git clone https://github.com/transientlunatic/minke.git \
 && cd minke \
 && python setup.py install 

RUN yum -y install openssh-server
EXPOSE 22
ADD minke-sshd /usr/bin/minke-sshd
RUN chmod +x /usr/bin/minke-sshd
RUN mkdir -p /var/run/sshd
