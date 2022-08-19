# syntax=docker/dockerfile:1

##
## Build
##
FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
COPY *.go ./
RUN export CGO_ENABLED=0 && go mod download && go build -o /server

##
## Deploy
##
FROM alpine

WORKDIR /

COPY --from=build /server /server

EXPOSE 8080

ENTRYPOINT ["/server"]
