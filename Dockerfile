FROM adoptopenjdk/openjdk11:jre-11.0.14.1_1-alpine

ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./*.jar app.jar 
RUN mkdir -p /home/myuser/.config/acrarium
COPY application.properties /home/myuser/.config/acrarium

RUN adduser -D myuser
USER myuser

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/urandom", "-jar", "./app.jar"]%