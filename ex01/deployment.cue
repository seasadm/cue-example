apiVersion: "apps/v1"
kind:       "Deployment"
metadata: {
	name: "myapp-backend"
	labels: app: "backend"
}
spec: {
	replicas: 1
	selector: matchLabels: app: "backend"
	template: {
		metadata: labels: app: "backend"
		spec: containers: [{
			name:  "backend"
			image: "registry.company.co/myapp/backend:1.14.2"
			env: [{
				name:  "DB_HOST"
				value: "devdb.company.co"
			}, {
				name:  "DB_NAME"
				value: "backend"
			}]
			ports: [{
				containerPort: 8080
				name:          "api"
			}]
		}]
	}
}
