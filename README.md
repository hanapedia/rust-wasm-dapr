# WASM with rust
## Goal
The goal of this project is to play around with WASM on browser and servers.
The end product of this project is a full-stack web app for my blogs.

## Features
- Upload blog posts as markdown files
- Parse the markdown file and store the content in persistent layer
- Display blogs (server-side rendered)

## Tech stack
### Infra
- Everything will be deployed to self-hosted single-node Kubernetes cluster at home
  - server-side wasm components are deployed using WASM Edge
  - frontend wasm components are deployed as linux containers to handle ssr
  - persistent layer will be deployed as linux containers
- service discovery will be handled by Service mesh
- ingress will be handled by ingress controller
- To make it publically accessible, use AWS gateway as proxy
  
## Dev notes
- Local wasmedge does not seem to work out of the box
- Consider using docker for everything 
  - docker-compose to manage dapr and wasm app
