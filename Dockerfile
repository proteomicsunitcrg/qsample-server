FROM node:14-buster as nodeclient
ARG QSAMPLE_API_PREFIX=http://localhost:8099/

RUN apt update && apt upgrade -y && apt -y install gettext-base
RUN mkdir -p /tmp
WORKDIR /tmp
COPY qsample-client/ /tmp/
# TODO: This could be moved to runtime later
RUN bash -c envsubst < src/assets/env.sample.js > src/assets/env.js
RUN npm install
RUN npm run transpile:prod
# Result in dist/
RUN apt clean

FROM biocorecrg/debian-perlbrew-pyenv3-java:buster as jarserver

RUN apt update && apt upgrade -y
RUN mkdir -p /tmp
WORKDIR /tmp
COPY mvn* /tmp/
COPY pom.xml /tmp/
COPY src/ /tmp/src/
COPY --from=nodeclient /tmp/dist/ /tmp/src/main/resources/dist/
RUN mvn package -DskipTests -f pom.xml
# Result in target/*jar
RUN apt clean

FROM biocorecrg/debian-perlbrew-pyenv3-java:buster
VOLUME /tmp
RUN mkdir -p /config
RUN mkdir -p /app
WORKDIR /app
COPY --from=jarserver /tmp/target/*jar /app
ENTRYPOINT ["java", "-jar", "-Dspring.config.location=file:/config/application.yml", "-Dspring.profiles.active=prod", "/app/qsample-0.2.5.Roger.jar"]

