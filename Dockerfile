FROM golang:1.15.5

WORKDIR /go/src/app
COPY . .

RUN export GO111MODULE=on
RUN go mod init gitlhub.com/go-redis/test
RUN go test
RUN go get -d -v ./... 
RUN go install -v ./...

CMD ["go", "run", "main.go"]
