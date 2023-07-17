FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install php php-mysql php-fpm curl

COPY ./tools/wpsetup.sh /

EXPOSE 9000

CMD ["/wpsetup.h"]

