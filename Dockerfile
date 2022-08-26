FROM biocorecrg/debian-perlbrew-pyenv3-java:buster as jarserver

RUN apt update && apt upgrade -y
RUN mkdir -p /tmp
WORKDIR /tmp
COPY mvn* /tmp/
COPY pom.xml /tmp/
COPY src/ /tmp/src/
RUN mvn package -DskipTests -f pom.xml
RUN apt clean
