FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y mariadb-server

COPY ./tools/dbsetup.sh /

CMD ["dbsetup.sh"]
