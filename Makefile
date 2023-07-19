all: build up

build:
	mkdir -p /Users/mnadir/data/wordpress
	mkdir -p /Users/mnadir/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml build
up:
	mkdir -p /Users/mnadir/data/wordpress
	mkdir -p /Users/mnadir/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v
stop:
	docker-compose -f ./srcs/docker-compose.yml stop
clean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	rm -rf /Users/mnadir/data/wordpress/*
	rm -rf /Users/mnadir/data/mariadb/*
re: clean all
