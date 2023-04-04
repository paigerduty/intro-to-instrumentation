# Intro To Instrumentation

### Pre-Reqs
* [Podman](https://podman.io/getting-started/installation) 
* [Python3](https://www.python.org/downloads/) (if running locally) 


### Set Up 
[Clone repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)


#### Podman
1. Build image locally `podman build -t hello-otel:latest -f Dockerfile` 
1. Run container `podman run -p 5000:5000 localhost/hello-otel:latest` 
1. Confirm application is running. Open your browser and access http://localhost:5000 || `curl localhost:5000`
1. Stop container `CTRL+C`
1. Run Pod with application + Jaeger all-in-one containers `podman kube play app_pod.yaml`
1. Open your browser and make multiple requests to http://localhost:5000 and http://localhost:5000/rolldice
1. Open the Jaeger UI in your browser at http://localhost:16686/search and find your service `hello-otel` and traces


#### Local
1. CD to dir and create Python virtual environment `python3 -m venv .venv &&. .venv/bin/activate`
1. Install dependencies `pip install -r requirements.txt`
1. Run the application `flask run`
1. Confirm application is running. Open your browser and access http://localhost:5000 || `curl localhost:5000`

Run local Jaeger instance

```
podman run -d --name jaeger \
  -e COLLECTOR_OTLP_ENABLED=true \
  -p 16686:16686 \
  -p 4318:4318 \
  jaegertracing/all-in-one:1.42
```

