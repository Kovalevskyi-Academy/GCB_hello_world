FROM openjdk:17-alpine3.14

RUN apk del busybox --quiet

# Add and enable a new user. Because it is more secure.
RUN addgroup -S testy && adduser -S api -G testy
USER api:testy

# 1. тут мы просто копируем распакованое приложение
# required a command `mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)`
ARG DEPENDENCY=helloworld/target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

# Run the web service on container startup.
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-cp","app:app/lib/*","com.example.helloworld.HelloWorldApplication"]
