# Pull Ubuntu Bionic
FROM ubuntu:18.04

# Create working directory
RUN mkdir -p /var/node/
WORKDIR /var/node

# Update and install git with java
RUN apt update
RUN apt install git -y
RUN apt install openjdk-11-jdk -y

# Running petclinic locally
RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR /var/node/spring-petclinic
RUN ./mvnw package
CMD java -jar target/*.jar

# Expose port 8080
EXPOSE 8080
