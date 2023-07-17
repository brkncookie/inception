FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install nginx openssl

EXPOSE 443

CMD ["\nginxsetup.sh"]
