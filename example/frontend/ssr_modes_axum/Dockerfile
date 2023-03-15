# FROM --platform=linux/arm64/v8 alpine
FROM --platform=linux/arm64/v8 rust:latest 
ARG LEPTOS_OUTPUT_NAME=ssr_modes_axum
COPY target/server/release/ssr_modes_axum /usr/local/bin/ssr_modes_axum
ENTRYPOINT [ "ssr_modes_axum" ]
