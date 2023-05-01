FROM centos

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install java

RUN git clone https://github.com/Aswin9796/maven-test.git /usr/local/maven-test

WORKDIR /usr/local/maven-test

RUN /usr/bin/mvn clean package


EXPOSE 8123

CMD ["java", "-jar", "/usr/local/maven-test/target/maven-test-1.0-SNAPSHOT.jar"]
