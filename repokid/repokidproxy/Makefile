GOFILES = $(shell find . -name '*.go' -not -path './vendor/*')
GOPACKAGES = $(shell go list ./...  | grep -v /repokidproxy/)
default: build

build: $(GOFILES)
	go build -o repokidproxy .

test: test-all

test-all:
	@go test -v ./...

test-min:
	@go test ./...

release:
	./release.sh $(VERSION) $(DESCRIPTION) $(TOKEN) $(APP)