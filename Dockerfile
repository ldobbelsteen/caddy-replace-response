FROM golang:alpine AS builder
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN xcaddy build \
    --output /usr/bin/caddy \
    --with github.com/caddyserver/replace-response

FROM alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "run"]
