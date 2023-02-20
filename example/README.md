# Run example app
make sure that the BETA feature for Docker Desktop is enabled to use WASM
```bash
docker-compose -f docker-compose.yaml up 
```

## Services
- placement: dapr control plane
- echo-service: http echo server
- echo-dapr: dapr sidecar for echo
- tests-service: test service invocation and state crud with dapr
- tests-dapr: dapr sidecar for tests
- redis: statestore for dapr
