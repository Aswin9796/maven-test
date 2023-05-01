FROM centos:latest

# Install required packages
RUN yum update -y && \
    yum install -y git && \
    yum install -y java-1.8.0-openjdk-devel && \
    yum clean all

# Clone the Maven project from GitHub
RUN git clone https://github.com/Aswin9796/maven-test.git /usr/local/maven-test

# Set the working directory to the project directory
WORKDIR /usr/local/maven-test

# Build the Maven project
RUN /usr/bin/mvn clean package

# Start the application
CMD ["java", "-jar", "/usr/local/maven-test/target/maven-test-1.0-SNAPSHOT.jar"]
