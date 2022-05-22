FROM debian:latest

COPY playbook.yml /vagrant/
COPY install_open_jdk8.yml /vagrant/
COPY roles-nexus /usr/share/ansible/roles

RUN apt-get -y update && apt-get install -y sshpass git build-essential default-jre gcc python-dev python3-pip rsync ansible curl wget
RUN ansible-playbook /vagrant/playbook.yml -i "127.0.0.1," -c local -e 'ansible_python_interpreter=/usr/bin/python3'
CMD /opt/nexus-latest/bin/nexus run
    
