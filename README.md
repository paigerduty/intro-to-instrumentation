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

