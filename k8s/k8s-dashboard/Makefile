all :
	@kubectl apply -f k8s-dashboard.yml -f k8s-dashboard-access.yml
	@echo "==========\n\nDashboard URL: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/cluster?namespace=default\n\n==========\n"
	@echo "Token:	$$(kubectl get secrets kubernetes-dashboard-secret -n  kubernetes-dashboard -o jsonpath='{.data.token}' | base64 --decode)\n\n=========="
	@kubectl proxy

clean :
	@kubectl delete namespaces kubernetes-dashboard || true

re : clean all