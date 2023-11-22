# Teste de conectividade entre containers Kubernetes

## Images

* IPerf4: maxandriani/iperf3:3.18
* Sockperf: maxandriani/sockperf:3.10
* ETG-Client: maxandriani/etg-client:1.0.0
* ETG-Server: maxandriani/etg-server:1.0.0
* k8s-collector: maxandriani/k8s-collector:1.0.0

## Healms

* Referência: k8s-referencia
* Referência: k8s-referencia-sockperf
* Simulação: k8s-simulacao
* Simulação: k8s-simulacao-sockperf

## Build

````sh
docker buildx build -t maxandriani/iperf3:3.15 -t maxandriani/iperf3:latest --platform linux/amd64,linux/arm64 --push .
docker buildx build -t maxandriani/sockperf:3.10 -t maxandriani/sockperf:latest --platform linux/amd64,linux/arm64 --push .
docker buildx build -t maxandriani/etg-client:1.0.0 -t maxandriani/etg-client:latest --platform linux/amd64,linux/arm64 --push .
docker buildx build -t maxandriani/etg-server:1.0.0 -t maxandriani/etg-server:latest --platform linux/amd64,linux/arm64 --push .
docker buildx build -t maxandriani/k8s-collector:1.0.0 -t maxandriani/k8s-collector:latest --platform linux/amd64,linux/arm64 --push .
``

## Run

``` sh
cd helms/k8s-referencia
helm install k8s-ref . --namespace=k8s-tests

cd helms/k8s-referencia-sockperf
helm install k8s-ref-sock . --namespace=k8s-tests

cd helms/k8s-simulacao
helm install k8s-sim . --namespace=k8s-tests

cd helms/k8s-simulacao-sock
helm install k8s-sim-sock . --namespace=k8s-tests
```
