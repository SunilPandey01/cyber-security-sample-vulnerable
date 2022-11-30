#
# Build stage
#
# FROM maven:alpine as build
FROM maven:3.8.6-eclipse-temurin-19-alpine as build
ENV HOME=/usr/cyber-security-sample-vulnerable
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
ADD pom.xml $HOME
RUN mvn verify --fail-never
ADD . $HOME
RUN mvn package
