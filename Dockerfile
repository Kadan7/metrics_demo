FROM openjdk:8
LABEL maintainer=shali.malli@gmail.com
VOLUME ["/logsFolder"]
RUN rm -rf /var/lib/apt/lists/*
COPY metrics1-0.0.1-SNAPSHOT.jar /usr/local/metrics1.jar
COPY startup.sh /usr/local/startup.sh
EXPOSE 8080
#CMD["sh","/usr/local/startup.sh"]
