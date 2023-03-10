# Intro To Instrumentation

### Install

| Tech  | Linux  | Mac | Windows  |
|---|---|---|---|
| Docker Desktop  |[Linux](https://docs.docker.com/desktop/linux/install/) | [MAC Intel Chip](https://desktop.docker.com/mac/main/amd64/Docker.dmg) [MAC Apple Chip](https://desktop.docker.com/mac/main/arm64/Docker.dmg)   | [Windows](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)  |
| Kubectl  | [Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux)  | [MacOS](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos)  | [Windows](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows)  |
| Helm  | [Linux](https://helm.sh/docs/intro/install)  | `brew install helm`  | `choco install kubernetes-helm`   |


* [Enable Kubernetes in Docker Desktop](https://docs.docker.com/desktop/kubernetes/#enable-kubernetes)

### Set-up  



### Test if it works

```shell
python3 -m venv .venv
. .venv/bin/activate

python3 cli.py
Hello world from CLI

pip install -r requirements.txt
flask run
curl localhost:5000
Hello, World!
```

## Run local Jaeger instance

```
docker run -d --name jaeger \
  -e COLLECTOR_OTLP_ENABLED=true \
  -p 16686:16686 \
  -p 4317:4317 \
  -p 4318:4318 \
  jaegertracing/all-in-one:1.42
```
###  Auto-Instrumentation

```
pip3  install opentelemetry-distro

# auto-instruments
opentelemetry-bootstrap -a install

# prints spans to the console
opentelemetry-instrument \
    --traces_exporter console \
    --metrics_exporter console \
    flask run
```    

### Manually instrument do_roll
```
with tracer.start_as_current_span("do_roll") as rollspan:
    result = random.randint(1,6)
    rollspan.set_attribute("roll.value", result)
    return result
```    
    

### Send to Jaeger

```
## add to app.py

# Service name is required for most backends
resource = Resource(attributes={
    SERVICE_NAME: "your-service-name"
})

provider = TracerProvider(resource=resource)
processor = BatchSpanProcessor(OTLPSpanExporter(endpoint="localhost:16686"))
provider.add_span_processor(processor)
trace.set_tracer_provider(provider)
```
