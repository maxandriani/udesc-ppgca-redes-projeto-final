# k8s Collector

## build

``` sh
sudo docker buildx build -t maxandriani/k8s-collector:1.0.0 -t maxandriani/k8s-collector:latest --platform linux/amd64,linux/arm64 -f ./src/CollectorCli/Dockerfile --push .
```
