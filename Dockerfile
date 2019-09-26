FROM golang:latest as builder
COPY . .
RUN CGO_ENABLED=0 go build -o /app .

FROM scratch
COPY --from=builder /app /
ENTRYPOINT ["/app"]
