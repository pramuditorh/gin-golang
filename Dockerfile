FROM golang:1.16-alpine

WORKDIR /app

RUN apk --no-cache add curl

COPY go.mod .

COPY go.sum .

COPY *.go ./

RUN go get .

RUN go build -o ./gin-golang

EXPOSE 8080

ENTRYPOINT [ "./gin-golang" ]