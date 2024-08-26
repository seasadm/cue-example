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
			image: values.image
			env: [{
				name:  "DB_HOST"
				value: values.DB_HOST
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

values: {
   DB_HOST: "devdb.company.co"
   image: "registry.company.co/myapp/backend:v2"
}
