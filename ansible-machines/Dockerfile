FROM phusion/baseimage

CMD ["/sbin/my_init"]

#--- installs python2
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y make build-essential zlib1g-dev libbz2-dev libreadline-dev
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN apt-get install -y libssl-dev
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

#RUN printf '\n%s\n%s\n%s' 'export PATH="/root/.pyenv/bin:$PATH"' 'eval "$(pyenv init -)"' 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
#RUN tail ~/.bashrc
#RUN /bin/bash -c 'source ~/.bashrc'

RUN /root/.pyenv/bin/pyenv install 2.7.9
RUN /root/.pyenv/bin/pyenv global 2.7.9

RUN ln -s /root/.pyenv/shims/python /usr/bin/python

#--- enables ssh
RUN rm -f /etc/service/sshd/down

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

ADD ssh_key.pub /tmp/ssh_key.pub
RUN cat /tmp/ssh_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/ssh_key.pub

#--- Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*