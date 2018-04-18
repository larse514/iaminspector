GOFILES = $(shell find . -name '*.go' -not -path './vendor/*')
GOPACKAGES = $(shell go list ./...  | grep -v /aardvarkproxy/)
default: build

build: $(GOFILES)
	go build -o aardvarkproxy .

test: test-all

test-all:
	@go test -v ./...

test-min:
	@go test ./...

release:
	# aws s3 cp workdir/amazonian s3://amazonian.package.release/latest/amazonian
	# aws s3 cp workdir/amazonian s3://amazonian.package.release/$(VERSION)/amazonian