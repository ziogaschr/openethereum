FROM rust:latest AS builder

WORKDIR /usr/src/openethereum

# RUN rustup target add x86_64-unknown-linux-musl
RUN apt -y update
RUN apt-get install -y build-essential
RUN apt-get -y install cmake libudev-dev

# Add our source code.
ADD . ./

# RUN mkdir -p ./.cargo/git ./.cargo/registry ./target

# ENV RUSTFLAGS="-C target-feature=+crt-static"
RUN cargo build --verbose

# FROM alpine
# COPY --from=builder \
#     /usr/src/openethereum/target/debug/openethereum \
#     /usr/local/bin/openethereum

EXPOSE 8090 8190 8555 8556 30313

# ENTRYPOINT ["/usr/local/bin/openethereum"]
ENTRYPOINT ["/usr/src/openethereum/target/debug/openethereum"]
# # CMD [ "uname -a" ]
