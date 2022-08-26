FROM biocorecrg/debian-perlbrew-pyenv3-java:buster as jarserver

RUN apt update && apt upgrade -y
RUN mkdir -p /tmp
WORKDIR /tmp
COPY mvn* /tmp/
COPY pom.xml /tmp/
COPY src/ /tmp/src/
RUN mvn package -DskipTests -f pom.xml
# Result in target/*jar
RUN apt clean

FROM node:14-buster as nodeclient

RUN apt update && apt upgrade -y
RUN mkdir -p /tmp
WORKDIR /tmp
COPY qsample-client/ /tmp/
RUN npm install
RUN npm run transpile:prod
# Result in dist/
RUN apt clean
