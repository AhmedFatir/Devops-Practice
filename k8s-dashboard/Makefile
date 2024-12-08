all :
	@kubectl apply -f k8s-dashboard.yml -f k8s-dashboard-access.yml
	@echo "==========\nDashboard URL: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/cluster?namespace=default\n==========\n"
	@echo "$$(kubectl describe secrets kubernetes-dashboar -n kubernetes-dashboard | grep '^token:' | awk '{print $2}')\n=========="
	@kubectl proxy

clean :
	@kubectl delete -f k8s-dashboard.yml || true

re : clean all