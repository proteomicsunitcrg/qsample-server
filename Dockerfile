FROM node:14-bullseye as nodeclient

RUN apt update && apt upgrade -y
RUN mkdir -p /tmp
WORKDIR /tmp
COPY qsample-client/ /tmp/
RUN npm install
RUN npm run transpile:prod
# Result in dist/
RUN apt clean

FROM biocorecrg/debian-perlbrew-pyenv3-java:bullseye as jarserver

RUN apt update && apt upgrade -y
RUN mkdir -p /tmp
WORKDIR /tmp
COPY mvn* /tmp/
COPY pom.xml /tmp/
COPY src/ /tmp/src/
COPY --from=nodeclient /tmp/dist/qsample-client/ /tmp/src/main/resources/static/
RUN mvn package -DskipTests -f pom.xml
# Result in target/*jar
RUN apt clean

FROM biocorecrg/debian-perlbrew-pyenv3-java:bullseye
RUN apt update && apt upgrade -y && apt -y install gettext-base
ENV QSAMPLE_API_PREFIX=http://localhost:8099/
VOLUME /tmp
RUN mkdir -p /config
RUN mkdir -p /app
WORKDIR /app
RUN apt clean
COPY --from=jarserver /tmp/target/*jar /app
COPY ./entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh
RUN mv /app/qsample-*.jar /app/qsample.jar
ENTRYPOINT /app/entrypoint.sh

