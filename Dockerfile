FROM adoptopenjdk/openjdk11
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y 
# RUN apt-get install wget -y
RUN apt-get install sudo -y
RUN apt-get install git -y 
RUN git clone https://github.com/NarenPrakash/thymeleafExample.git 
# RUN sudo mkdir /mvnproject
# RUN cp -r thymeleafExample mvnproject
# WORKDIR thymeleafExample
# RUN ls
#RUN cd thymeleafExample
RUN sudo apt-get install openjdk-8-jdk -y
# #RUN cd thymeleafExample
RUN sudo apt-get install maven -y
RUN mvn clean install 
# RUN mvn package
# RUN mvn test 
WORKDIR /thymeleafExample/target
#RUN ls
#COPY thymeleafExample/target/work-0.0.1-SNAPSHOT.jar /
EXPOSE 8086
CMD ["java","-jar","work-0.0.1-SNAPSHOT.jar"]

