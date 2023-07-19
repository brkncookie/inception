FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install nginx openssl

COPY tools/nginxsetup.sh /

RUN chmod +x /nginxsetup.sh

EXPOSE 443

CMD ["/nginxsetup.sh"]
