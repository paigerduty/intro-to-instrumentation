define USAGE
▄▀▄▀▄▀▄▀▄▀▄ Hello, OpenTelemetry ▄▀▄▀▄▀▄▀▄▀▄

Commands:
	setup     Run system checks for pre-requisites
	build     Build image with Podman
	run 	  Run as container
	kube      Run as pod
▄▀▄▀▄▀▄▀▄▀▄ ▄▀▄▀▄▀▄▀▄▀▄ ▄▀▄▀▄▀▄▀▄▀▄ ▄▀▄▀▄▀▄▀▄▀▄

endef

export USAGE
help:
	@echo "$$USAGE"

setup:
	@echo "TODO"

build:
	podman build -t hello-otel:latest -f Dockerfile

run:
	podman run -p 5000:5000 -v $(shell pwd):/app/ -e FLASK_DEBUG=1 localhost/hello-otel:latest

kube: 
	podman kube play app_pod.yaml 

stop: 
	# podman pod stop hello-otel && podman pod rm hello-otel
	podman stop $(shell podman ps --format "{{.ID}}") && podman rm $(shell podman ps --format "{{.ID}}")

local:
	pip install -r requirements.txt
	flask run --host=0.0.0.0

setup-local:
	python3 -m venv .venv
	. .venv/bin/activate 
	pip install -r requirements.txt
