FROM golang:latest as builder

RUN go version
RUN pwd
COPY . .
RUN ls
RUN CGO_ENABLED=0 go build -o /app .

FROM scratch

COPY --from=builder /app /

ENTRYPOINT ["/app"]
