package myapp

all: {
    apiVersion: "v1"
    kind: "List"
    items: [deploymentFrontend, serviceFrontend, deploymentBackend, serviceBackend]
}
