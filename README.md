# Intro To Instrumentation

### Install


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
    flask run
```    

### Manually instrument do_roll
```
with tracer.start_as_current_span("do_roll") as rollspan:
    result = random.randint(1,6)
    rollspan.set_attribute("roll.value", result)
    return result
```    

## Pre-Requisites

* Podman 
* 


## Set Up 

* Clone repository
* Build containers `make build` 
* Run containers `make run`
* Check connection
    `curl localhost:5000`
    open browser to http://localhost:16686/search




### Build image and run container

* `podman build -t hello-otel:latest` 
* `podman run -p 5000:5000 localhost/hello-otel:latest`

### Check connection

* `curl localhost:5000`
* `curl localhost:5000/rolldice`
