#pull base image
FROM openjdk:8-jdk-alpine

#maintainer 
MAINTAINER shali.malli@gmail.com

#expose port 8080
#EXPOSE 8080

#default command
#CMD java -jar /data/metrics1-0.0.1-SNAPSHOT.jar

#copy hello world to docker image
#COPY metrics1.jar /data/metrics1.jar
#COPY AppServerAgent-4 /data/AppServerAgent-4/
#CMD unzip -d /data/appagent /data/AppServerAgent-4.4.3.23530.zip
EXPOSE 8080
ADD ./data/metrics1-0.0.1-SNAPSHOT.jar /data/metrics1-0.0.1-SNAPSHOT.jar
ADD ./AppServerAgent-4 /data/AppServerAgent-4/
#CMD ["sh","/usr/local/startup.sh"]
CMD java -javaagent:/data/AppServerAgent-4/javaagent.jar -jar /data/metrics1-0.0.1-SNAPSHOT.jar -Dappdynamics.agent.tierName=middle -Dappdynamics.agent.nodeName=metricsnode
