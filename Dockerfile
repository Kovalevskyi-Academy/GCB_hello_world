FROM maven:3.8.4-eclipse-temurin-17-alpine as builder

# Copy local code to the container image.
WORKDIR /app
COPY ./helloworld/pom.xml .
COPY ./helloworld/src ./src

# Build a release artifact.
RUN mvn clean package

# Use AdoptOpenJDK for base image.
# It's important to use OpenJDK 8u191 or above that has container support enabled.
# https://hub.docker.com/r/adoptopenjdk/openjdk8
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM openjdk:17-alpine

# Copy the jar to the production image from the builder stage.
COPY --from=builder /app/target/helloworld-*.jar /helloworld.jar

# Run the web service on container startup.
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/helloworld.jar"]




# OLD
#FROM alpine
#COPY quickstart.sh /
#ENV TEST_ENV='Hello World from Alpine container in Google Cloud Build.'
#ENTRYPOINT ["sh","/quickstart.sh"]
