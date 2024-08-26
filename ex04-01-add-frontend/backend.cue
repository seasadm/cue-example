package myapp

deploymentBackend: {
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
				image: _values.imageBackend
				env: [{
					name:  "DB_HOST"
					value: _values.DB_HOST
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
}
serviceBackend: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: name: "backend-service"
	spec: {
		selector: app: "backend"
		ports: [{
			name:       "name-of-service-portapi"
			protocol:   "TCP"
			port:       80
			targetPort: "api"
		}]
	}
}
