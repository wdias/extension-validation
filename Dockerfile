FROM golang:1.13-alpine

WORKDIR /go/src/app
RUN apk update && apk add git
# RUN go get -u github.com/kataras/iris
# Breaking change: https://github.com/kataras/iris/issues/1385#issuecomment-546643215
# RUN go get github.com/iris-contrib/cloud-native-go
ENV GO111MODULE=on
COPY go.mod go.sum ./
RUN go mod download
COPY ./src .

RUN go build -o main .

CMD ["./main"]

