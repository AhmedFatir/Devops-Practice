
all:
	clear
	docker-compose up --build -d

down:
	docker-compose down

stop:
	docker-compose stop

start:
	docker-compose start

clean:
	@docker stop jenkins || true
	@docker rm -f jenkins || true
	@docker rmi -f jenkins || true
	@docker volume rm -f jenkins || true
	@docker network rm jenkins || true

re: clean all

prune: clean
	@docker system prune -a --volumes -f

.PHONY: all up down stop start clean re prune