ARG VERSION=latest
ARG MONGO_INITDB_ROOT_USERNAME
ARG MONGO_INITDB_ROOT_PASSWORD

FROM mongo:$VERSION

ADD mongodump.sh /bin/mongodump.sh

RUN ["chmod", "+x", "/bin/mongodump.sh"]

WORKDIR /bin/

ENV MONGO_INITDB_ROOT_USERNAME=$MONGO_INITDB_ROOT_USERNAME
ENV MONGO_INITDB_ROOT_PASSWORD=$MONGO_INITDB_ROOT_PASSWORD

ENTRYPOINT ["/bin/bash"]

CMD ["/bin/mongodump.sh"]