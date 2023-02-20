FROM --platform=linux/arm64/v8 rust:latest as builder

WORKDIR /rust-wasm/example/tests
SHELL ["/bin/bash", "-c"]

COPY ./tests/ /rust-wasm/example/tests/
COPY ./dapr-sdk-wasi/ /rust-wasm/example/dapr-sdk-wasi/

RUN rustup target add wasm32-wasi
RUN cargo build --target wasm32-wasi --release

RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- -p /usr/local
RUN wasmedgec target/wasm32-wasi/release/dapr_tests.wasm dapr_tests.wasm 

FROM --platform=wasi/wasm32 scratch
COPY --from=builder /rust-wasm/example/tests/dapr_tests.wasm /dapr_tests.wasm
ENTRYPOINT [ "dapr_tests.wasm" ]
