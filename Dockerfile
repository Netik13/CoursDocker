ARG version=latest
FROM ubuntu:$version
#MAINTAINER JCD "jcd717@outlook.com"

# Creation du compte user1 puis utilisation de celui-ci
RUN useradd user1
USER user1

# Metadonnées dans l'image / for read inspect
LABEL maintainer="JCD <jcd717@outlook.com>" \
      description="test" \
      auteur="bruno dubois"

COPY --chown=user1:user1 heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ; 
    #echo coucou >test.txt

ARG hbs=3
ENV HEARTBEATSTEP $hbs


# information de port réseau utile
EXPOSE 1234/udp 4321/tcp

#ENTRYPOINT ["/entrypoint.sh"]
CMD ["/entrypoint.sh","Test CMD"]

