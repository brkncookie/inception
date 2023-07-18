FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y mariadb-server

COPY ./tools/dbsetup.sh /

RUN chmod +x /dbsetup.sh

EXPOSE 3306

CMD ["/dbsetup.sh"]
