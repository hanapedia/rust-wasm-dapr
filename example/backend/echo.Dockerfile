FROM --platform=linux/arm64/v8 rust:latest as builder

WORKDIR /rust-wasm/example/echo
SHELL ["/bin/bash", "-c"]

COPY ./echo/ /rust-wasm/example/echo/
COPY ./dapr-sdk-wasi/ /rust-wasm/example/dapr-sdk-wasi/

RUN rustup target add wasm32-wasi
RUN cargo build --target wasm32-wasi --release

RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- -p /usr/local
RUN wasmedgec target/wasm32-wasi/release/dapr_echo.wasm dapr_echo.wasm 

FROM --platform=wasi/wasm32 scratch
COPY --from=builder /rust-wasm/example/echo/dapr_echo.wasm /dapr_echo.wasm
ENTRYPOINT [ "dapr_echo.wasm" ]

