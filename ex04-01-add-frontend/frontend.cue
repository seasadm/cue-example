package myapp

deploymentFrontend: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name: "myapp-frontend"
		labels: app: "frontend"
	}
	spec: {
		replicas: 1
		selector: matchLabels: app: "frontend"
		template: {
			metadata: labels: app: "frontend"
			spec: containers: [{
				name:  "frontend"
				image: _values.imageFrontend
				ports: [{
					containerPort: 8080
					name:          "api"
				}]
			}]
		}
	}
}
serviceFrontend: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: name: "backend-service"
	spec: {
		selector: app: "frontend"
		ports: [{
			name:       "name-of-service-portapi"
			protocol:   "TCP"
			port:       80
			targetPort: "api"
		}]
	}
}
