all: build up

build:
	mkdir -p /home/mnadir/data/wordpress
	mkdir -p /home/mnadir/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml build
up:
	mkdir -p /home/mnadir/data/wordpress
	mkdir -p /home/mnadir/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v
stop:
	docker-compose -f ./srcs/docker-compose.yml stop
clean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	rm -rf /home/mnadir/data/wordpress/*
	rm -rf /home/mnadir/data/mariadb/*
re: clean all
