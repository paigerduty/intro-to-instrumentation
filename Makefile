define USAGE
▄▀▄▀▄▀▄▀▄▀▄ Hello, OpenTelemetry ▄▀▄▀▄▀▄▀▄▀▄

Commands:
	setup     Run system checks for pre-requisites
	build     Build image with Podman
	run 	  Run as container
	pod       Run as pod
	jaeger    Run Jaeger all-in-one container
▄▀▄▀▄▀▄▀▄▀▄ ▄▀▄▀▄▀▄▀▄▀▄ ▄▀▄▀▄▀▄▀▄▀▄ ▄▀▄▀▄▀▄▀▄▀▄
endef

export USAGE
help:
	@echo "$$USAGE"

setup:
	@echo "TODO"

build:
	podman build -t hello-otel:latest -f Dockerfile

jaeger:
	podman run --name jaeger -e COLLECTOR_OTLP_ENABLED=true -p 16686:16686 -p 4317:4317 -p 4318:4318 jaegertracing/all-in-one:1.42

run:
	podman run -p 5000:5000 localhost/hello-otel:latest

kube: 
	podman kube play app_pod.yaml 

stop: 
	# podman pod stop hello-otel && podman pod rm hello-otel
	podman stop $(shell podman ps --format "{{.ID}}") && podman rm $(shell podman ps --format "{{.ID}}")
