FROM openjdk:8

WORKDIR /var/app
COPY lib ./plugins
COPY docker/install.sh install.sh
RUN chmod +x install.sh && ./install.sh

CMD java -DIReallyKnowWhatIAmDoingISwear -jar server.jar