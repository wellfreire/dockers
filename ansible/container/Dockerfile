FROM python:2.7.11

MAINTAINER Well Freire <wellfreire1@gmail.com>

# ============================================

RUN apt-get update
RUN apt-get install -y vim sshpass

RUN pip install ansible

RUN ansible --version

ADD init.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/init.sh

CMD ["init.sh"]