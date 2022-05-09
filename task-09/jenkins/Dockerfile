FROM debian:latest

COPY playbook.yml /vagrant/
COPY roles-jenkins /usr/share/ansible/roles

RUN apt-get -y update && apt-get install -y sshpass git build-essential default-jre gcc python3-pip rsync ansible daemon wget curl
RUN ansible-playbook /vagrant/playbook.yml -i "127.0.0.1," -c local -e 'ansible_python_interpreter=/usr/bin/python3 ansible.galaxy_roles_path=/usr/share/ansible/roles/'

CMD /usr/bin/daemon --foreground --name=jenkins --inherit --env=JENKINS_HOME=/var/lib/jenkins --output=/var/log/jenkins/jenkins.log --pidfile=/var/lib/jenkins/jenkins.pid -- /usr/bin/java -Djava.awt.headless=true -Djenkins.install.runSetupWizard=false -Dhudson.security.csrf.DefaultCrumbIssuer.EXCLUDE_SESSION_ID=true -jar /usr/share/java/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8080 --prefix=
    
