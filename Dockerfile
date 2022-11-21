FROM golang:alpine as builder
WORKDIR /go/src

COPY . .

RUN go build -o /go/bin/server main.go

FROM scratch
COPY --from=builder /go/bin/server /server
EXPOSE 3000

CMD ["/server"]
