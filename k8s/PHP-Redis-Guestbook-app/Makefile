all:
	@kubectl apply -f redis-leader.yml -f redis-follower.yml -f frontend.yml

clean:
	@kubectl delete -f redis-leader.yml -f redis-follower.yml -f frontend.yml || true

re: clean all