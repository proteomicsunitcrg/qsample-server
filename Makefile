run:
	docker compose -f docker-compose.dev.yml up -d 

stop:
	docker compose -f docker-compose.dev.yml down

build:
	docker compose build --no-cache

remove:
	docker rm -f qsample-server-db-1 qsample-server-app-1

clone:
	git clone --recurse-submodules git@github.com:proteomicsunitcrg/qsample-server.git

list: 
	docker ps -a

logs:
	docker logs qsample-server-app-1
