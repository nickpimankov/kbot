VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)

format: 
	gofmt -s -w ./

TARGETOS=linux

build: format
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o kbot -ldflags "-X="github.com/nickpimankov/kbot/cmd.appVersion=${VERSION}

lint:
	golint

test:
	go test -v

clean:
	rm -f kbot
