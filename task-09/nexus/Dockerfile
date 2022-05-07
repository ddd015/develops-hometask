FROM debian:latest
COPY playbook.yml /vagrant
RUN apt-get -y update && apt-get install -y sshpass git build-essential default-jre gcc python-dev python3-pip rsync ansible
RUN  ansible-playbook /vagrant/playbook.yml -i "127.0.0.1," -c local
CMD /bin/bash
    
