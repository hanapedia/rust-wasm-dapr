FROM --platform=linux/arm64/v8 rust:latest as builder

WORKDIR /rust-wasm/example/frontend/ssr_modes_axum
SHELL ["/bin/bash", "-c"]

COPY . .

RUN rustup toolchain install nightly && rustup default nightly && rustup target add wasm32-unknown-unknown
RUN cargo install --locked cargo-leptos 
RUN cargo leptos build --release

FROM --platform=linux/arm64/v8 debian:buster-slim
COPY --from=builder /rust-wasm/example/frontend/ssr_modes_axum/target/server/release/ssr_modes_axum /usr/local/bin/ssr_modes_axum
ENTRYPOINT [ "ssr_modes_axum" ]
