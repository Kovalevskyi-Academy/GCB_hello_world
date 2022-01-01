FROM openjdk:17-alpine
# Add and enable a new user. Because it is more secure.
RUN addgroup -S textify && adduser -S api -G textify
USER api:textify

# Copy the jar to the production image from the builder stage.
#RUN ls -lh
COPY ./helloworld/target/h*.jar /helloworld.jar

# Run the web service on container startup.
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/helloworld.jar"]




# OLD
#FROM alpine
#COPY quickstart.sh /
#ENV TEST_ENV='Hello World from Alpine container in Google Cloud Build.'
#ENTRYPOINT ["sh","/quickstart.sh"]
