FROM debian:latest

RUN apt-get -y update && apt-get install -y sshpass git build-essential default-jre gcc python-dev python3-pip rsync ansible
#RUN pip3 install --upgrade pip && \
#    pip3 install --upgrade virtualenv && \
#    pip3 install ansible && \
#    pip3 install jmespath && ansble_playbook.sh
RUN  ansible-playbook /vagrant/playbook.yml -i "127.0.0.1," -c local
CMD /bin/bash
    
