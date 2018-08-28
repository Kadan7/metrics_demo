#pull base image
FROM openjdk:8-jdk-alpine

#maintainer 
MAINTAINER shali.malli@gmail.com

#expose port 8080
#EXPOSE 8080

#default command
#CMD java -jar /data/metrics1-0.0.1-SNAPSHOT.jar

#copy hello world to docker image
COPY metrics1.jar /usr/local/metrics1.jar
COPY startup.sh /usr/local/startup.sh
EXPOSE 8080
CMD ["sh","/usr/local/startup.sh"]
