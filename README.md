## Pre-Requisites

* Podman 
* 


## Set Up 
* Clone repository

### Build image and run container

* `podman build -t hello-otel:latest` 
* `podman run -p 5000:5000 localhost/hello-otel:latest`

### Check connection

* `curl localhost:5000`
* `curl localhost:5000/rolldice`

