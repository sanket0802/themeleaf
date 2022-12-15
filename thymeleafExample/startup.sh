#! /bin/bash
  #cd /home/admin123/themeleaf/thymeleafExample/
  sudo apt install openjdk-8-jdk -y
  sudo apt-get install maven -y 
  mvn test
  mvn package
  mvn clean update 
  #mvn install
  #cd /home/admin123/themeleaf/
  #chmod 700 startup.sh
  cd target
  nohup java -jar work-0.0.1-SNAPSHOT.jar >/tmp/app.log 2>&1 &
