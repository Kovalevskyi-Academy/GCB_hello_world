FROM alpine
COPY quickstart.sh /
ENV TEST_ENV='Hello World from Alpine container in Google Cloud Build.'
ENTRYPOINT ["sh","/quickstart.sh"]
